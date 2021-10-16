local _, private = ...

local tinsert, twipe = table.insert, table.wipe

---------------
-- Prototype --
---------------
local modulePrototype = {}

function modulePrototype:RegisterEvents(...)
	for _, event in ipairs({...}) do
		self.frame:RegisterEvent(event)
	end
end

function modulePrototype:RegisterShortTermEvents(...)
	for _, event in ipairs({...}) do
		self.frame:RegisterEvent(event)
		tinsert(self.shortTermEvents, event)
	end
end

function modulePrototype:UnregisterShortTermEvents()
	for _, event in ipairs(self.shortTermEvents) do
		self.frame:UnregisterEvent(event)
	end
	twipe(self.shortTermEvents)
end

-------------
-- Modules --
-------------
local modules = {}

function private:NewModule(name)
	if modules[name] then
		error("DBM:NewModule(): Module names must be unique", 2)
	end
	local frame = CreateFrame("Frame", "DBM" .. name)
	local obj = setmetatable({
		frame = frame,
		shortTermEvents = {}
	}, {
		__index = modulePrototype
	})
	frame:SetScript("OnEvent", function(_, event, ...)
		local handler = obj[event]
		if handler then
			handler(obj, ...)
		end
	end)
	modules[name] = obj
	return obj
end

function private:GetModule(name)
	return modules[name]
end

--As more and more of DBM core gets modulized, it'd be a large waste of memory to store each and every modules tables in private.
--Therefor, modules tables should be localized and use this method (which is called in EndCombat in DBM Core)
--This will wipe module tables that can't wipe themselves when their functions get terminated early
function private:ClearModuleTables()
	for _, mod in pairs(modules) do
		if mod.OnModuleEnd then
			mod:OnModuleEnd()
		end
	end
end
