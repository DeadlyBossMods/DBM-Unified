local _, private = ...

-------------------------
--  DBM-to-BW mapping  --
-------------------------
local GetBWStage, GetBWKey, GetBWModule
do
	function GetBWStage(mod)
		local bwCompat = mod.bwCompat
		local modStage = bwCompat and bwCompat.useStageTotality and (mod.vb.stageTotality or 0) or (mod.vb.phase or 0)
		return bwCompat and bwCompat.stageMap and bwCompat.stageMap[modStage] or modStage
	end

	function GetBWKey(obj)
		local bwCompat = obj.mod.bwCompat
		return bwCompat and bwCompat.keys and (bwCompat.keys[obj] or bwCompat.keys[obj.spellId]) or obj.spellId
	end

	local fakeBWModules = setmetatable({}, {
		__index = function(this, mod)
			local fake = {}
			rawset(this, mod, fake)
			return fake
		end
	})

	function GetBWModule(mod)
		return fakeBWModules[mod]
	end
end
private.GetBWStage = GetBWStage
private.GetBWKey = GetBWKey


-------------------------
--  BW event handling  --
-------------------------
local RegisterBWMessage, SendBWMessage
local applyFakeAPI -- used here as upvalue, defined in next section
do
	local bwCallbacks = {}

	function RegisterBWMessage(addon, message, callback)
		if callback == nil then callback = message end
		if not bwCallbacks[message] then bwCallbacks[message] = {} end
		bwCallbacks[message][addon] = callback
		-- callback may be a string at this point, so we can't modify the env here and have to do it in SendBWMessage
	end

	function SendBWMessage(message, mod, ...)
		local bwMod = GetBWModule(mod)
		for addon, callback in next, bwCallbacks[message] do
			if type(callback) == "function" then
				applyFakeAPI[callback] = true
				securecallfunction(callback, message, bwMod, ...)
			else
				applyFakeAPI[addon[callback]] = true
				securecallfunction(addon[callback], addon, message, bwMod, ...)
			end
		end
	end
end
private.SendBWMessage = SendBWMessage

---------------------------------
--  Fake BW API for WeakAuras  --
---------------------------------
-- To prevent compatibility problems with other addons that might try to use BigWigs API, we avoid creating BigWigs globals.
-- Instead we use setfenv on the few WeakAuras functions that access BW globals, giving them a proxy environment that contains
-- our limited BW API implementation and otherwise falls back to the normal global environment.
do
	local white = {1, 1, 1}
	local colorsPlugin = {
		GetColorTable = function() return white end, -- Don't bother actually faking BW color settings if it's not needed
	}

	-- WA only uses IterateBossModules to get current stage, so a single fake with IsEngaged and GetStage is enough for now
	local fakeModules = {
		DBM_BWCallbacks = {
			IsEngaged = function() return DBM:InCombat() end,
			GetStage = function()
				-- Assume only one mod is active. With actual BW, WA scans for highest stage number among engaged mods.
				local mod = private.inCombat[1]
				if mod then return GetBWStage(mod) end
			end,
		},
	}

	local fakeAPIEnv = setmetatable({
		BigWigsLoader = {
			RegisterMessage = RegisterBWMessage,
		},
		BigWigs = {
			GetPlugin = function(_, plugin) if plugin == "Colors" then return colorsPlugin end end,
			IterateBossModules = function() return next, fakeModules end,
		},
	}, { __index = _G, __newindex = _G })

	-- Modify the env of each callback if needed
	-- Use table directly rather than calling helper func unconditionally or checking "if t[func]" manually
	applyFakeAPI = setmetatable({}, {
		__mode = "k",
		__newindex = function(t, func) -- Ignore value
			setfenv(func, fakeAPIEnv)
			rawset(t, func, true) -- Don't call __newindex again
		end
	})

	local function hookWA()
		-- Ensure WeakAuras loaded properly
		if not (WeakAuras and WeakAuras.RegisterBigWigsCallback) then return end
		applyFakeAPI[WeakAuras.RegisterBigWigsCallback] = true
	end

	if IsAddOnLoaded("WeakAuras") then
		hookWA()
	else
		local frame = CreateFrame("Frame")
		frame:SetScript("OnEvent", function(self, event, arg)
			if event == "ADDON_LOADED" and arg == "WeakAuras" then
				hookWA()
				self:UnregisterEvent(event)
				self:SetScript("OnEvent", nil)
			end
		end)
		frame:RegisterEvent("ADDON_LOADED")
	end
end
