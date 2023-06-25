local _, private = ...

if IsAddOnLoaded("BigWigs") then
	-- BigWigs is already loaded, so we won't want to send callbacks and there's no need to set up the infrastructure.
	-- Lack of private.SendBWMessage signals to core that BW messages won't be used.
	-- See bottom of file for BigWigs loading after us.
	return
end

-------------------------
--  DBM-to-BW mapping  --
-------------------------
local GetBWStage, GetBWKey, GetBWModule
do
	local spellIdMap = {
		-- Kazzara
		[406516] = 407196,
		[406525] = 407196,
		[404744] = 404743,
		-- The Amalgamation Chamber
		[405016] = 405036,
		[405641] = 405642,
		-- The Forgotten Experiments
		[405042] = 407327,
		[405391] = 405392,
		-- Assault of the Za'qali
		["ej26217"] = 397383,
		[410535] = 401516,
		-- Zskarn
		[404007] = 404010,
		-- Magmorax
		[402989] = 402994,
		[409238] = 409093,
		-- Echo of Neltharion
		[402116] = 402115,
		[406222] = 401998,
		[404038] = 405433,
		-- Scalecommander Sarkareth
		[401642] = 401680,
		[401325] = 401330,
		[411236] = 411241,
		[403517] = 403520,
		[408422] = 408429,
		[405022] = 405486,

		-- The Primalist Council
		[374021] = 372279,
		[370991] = 397134,
		[374043] = 374038,
		-- Sennarth
		["ej24899"] = -24899,
		[373027] = 373048,
		-- Kurog Grimtotem
		[390548] = 372158,
		[374022] = 374023,
		[372456] = 372458,
		[391055] = 391056,
		-- Broodkeeper Diurna
		[375842] = 380175,
		[380176] = 392194,
		-- Raszageth
		[377658] = 395906,
		[378829] = 377497,
	}

	function GetBWStage(mod)
		local bwCompat = mod.bwCompat
		local modStage = bwCompat and bwCompat.useStageTotality and (mod.vb.stageTotality or 0) or (mod.vb.phase or 0)
		return bwCompat and bwCompat.stageMap and bwCompat.stageMap[modStage] or modStage
	end

	function GetBWKey(obj)
		return spellIdMap[obj.spellId] or obj.spellId
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
local applyFakeAPI -- used here as upvalue, defined in next section
local bwCallbacks = {}
local function RegisterBWMessage(addon, message, callback)
	if callback == nil then callback = message end
	if not bwCallbacks[message] then bwCallbacks[message] = {} end
	bwCallbacks[message][addon] = callback
	-- callback may be a string at this point, so we can't modify the env here and have to do it in SendBWMessage
end

function private.SendBWMessage(message, mod, ...)
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
	-- TODO: We blindly assume the function's original env was _G.
	-- This is currently true for the WeakAuras functions we're interested in. Use of setfenv is rare in general except for sandboxing user code.

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
			elseif event == "ADDON_LOADED" and arg == "BigWigs" then
				-- Other addons messing with load order and Enable/Disable/LoadAddOn can make BigWigs load at any time after us.
				-- If BigWigs loads delayed, its API consumers might break or misbehave anyway, but do our best to remove DBM from the equation.

				-- Stop core from calling SendBWMessage
				private.SendBWMessage = nil
				DBM:UpdateBWCallbacks()

				-- Ensure we won't insert our fake API anymore even if WeakAuras loads even later.
				frame:UnregisterEvent("ADDON_LOADED")
				frame:SetScript("OnEvent", nil)

				-- Remove our fake API from any functions that had it applied, and restore _G
				for func in next, applyFakeAPI do
					setfenv(func, _G)
				end

				-- Move registered callbacks to BigWigs proper.
				-- This isn't quite the same as the API not existing in the first place, but less disruptive than just abandoning the callbacks.
				if BigWigsLoader and BigWigsLoader.RegisterMessage then
					for message, addons in next, bwCallbacks do
						for addon, callback in next, addons do
							BigWigsLoader.RegisterMessage(addon, message, callback)
						end
					end
				end
			end
		end)
		frame:RegisterEvent("ADDON_LOADED")
	end
end
