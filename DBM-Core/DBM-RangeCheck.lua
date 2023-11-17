---------------
--  Globals  --
---------------
DBM.RangeCheck = {}

--------------
--  Locals  --
--------------
local isRetail = WOW_PROJECT_ID == (WOW_PROJECT_MAINLINE or 1)
local isClassic = WOW_PROJECT_ID == (WOW_PROJECT_CLASSIC or 2)

local DDM = _G["LibStub"]:GetLibrary("LibDropDownMenu")
local UIDropDownMenu_AddButton, UIDropDownMenu_Initialize, ToggleDropDownMenu = DDM.UIDropDownMenu_AddButton, DDM.UIDropDownMenu_Initialize, DDM.ToggleDropDownMenu

local function UnitPhaseReasonHack(uId)
	if isRetail then
		return not UnitPhaseReason(uId)
	end
	return UnitInPhase(uId)
end

local L = DBM_CORE_L
local rangeCheck = DBM.RangeCheck

-----------------------
--  Check functions  --
-----------------------
local getDistanceBetween, getDistanceBetweenAll

do
	local UnitPosition, UnitExists, UnitIsUnit, UnitIsDeadOrGhost, UnitIsConnected = UnitPosition, UnitExists, UnitIsUnit, UnitIsDeadOrGhost, UnitIsConnected

	function itsBCAgain(uId)
		local inRange, checkedRange = UnitInRange(uId)
		if inRange and checkedRange then--Range checked and api was successful
			return 43
		else
			return 1000
		end
	end

	--Scope is now limited to just being a wrapper for returning true or false for being within 43 yard (40+hitbox)
	function getDistanceBetweenAll(checkrange)
		local restrictionsActive = DBM:HasMapRestrictions()
		local range = restrictionsActive and 43 or checkrange
		for uId in DBM:GetGroupMembers() do
			if UnitExists(uId) and not UnitIsUnit(uId, "player") and not UnitIsDeadOrGhost(uId) and UnitIsConnected(uId) and UnitPhaseReasonHack(uId) then
				range = DBM:HasMapRestrictions() and itsBCAgain(uId) or UnitDistanceSquared(uId) * 0.5
				if checkrange < (range + 0.5) then
					return true
				end
			end
		end
		return false
	end

	function getDistanceBetween(uId, x, y)
		local restrictionsActive = DBM:HasMapRestrictions()
		if not x then -- If only one arg then 2nd arg is always assumed to be player
			return restrictionsActive and itsBCAgain(uId) or UnitDistanceSquared(uId) ^ 0.5
		end
		if type(x) == "string" and UnitExists(x) then -- arguments: uId, uId2
			-- First attempt to avoid UnitPosition if any of args is player UnitDistanceSquared should work
			if UnitIsUnit("player", uId) then
				return restrictionsActive and itsBCAgain(x) or UnitDistanceSquared(x) ^ 0.5
			elseif UnitIsUnit("player", x) then
				return restrictionsActive and itsBCAgain(uId) or UnitDistanceSquared(uId) ^ 0.5
			else -- Neither unit is player, no way to avoid UnitPosition
				if restrictionsActive then -- Cannot compare two units that don't involve player with restrictions, just fail quietly
					return 1000
				end
				local uId2 = x
				x, y = UnitPosition(uId2)
				if not x then
					print("getDistanceBetween failed for: " .. uId .. " (" .. tostring(UnitExists(uId)) .. ") and " .. uId2 .. " (" .. tostring(UnitExists(uId2)) .. ")")
					return
				end
			end
		end
		if restrictionsActive then -- Cannot check distance between player and a location (not another unit, again, fail quietly)
			return 1000
		end
		local startX, startY = UnitPosition(uId)
		local dX = startX - x
		local dY = startY - y
		return (dX * dX + dY * dY) ^ 0.5
	end
end

---------------
--  Methods  --
---------------
--Safe exit temp functions for now
function rangeCheck:Show()
	return
end

function rangeCheck:Hide()
	return
end

function rangeCheck:IsShown()
	return false
end

function rangeCheck:IsRadarShown()
	return false
end

function rangeCheck:GetDistance(...)
	return getDistanceBetween(...)
end

function rangeCheck:GetDistanceAll(checkrange)
	return getDistanceBetweenAll(checkrange)
end

do
	SLASH_DBMRANGE1 = "/range"
	SLASH_DBMRANGE2 = "/distance"
	SLASH_DBMRRANGE1 = "/rrange"
	SLASH_DBMRRANGE2 = "/rdistance"
	SlashCmdList["DBMRANGE"] = function()--msg
		DBM:AddMsg("Range finder is no longer available and this command will be removed in a future update")
	end
	SlashCmdList["DBMRRANGE"] = function()--msg
		DBM:AddMsg(L.NO_RANGE)
	end
end
