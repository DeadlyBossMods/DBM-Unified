local _, private = ...

local tinsert, tsort = table.insert, table.sort
local UnitIsUnit, UnitExists, SetRaidTarget, GetRaidTargetIndex =
	UnitIsUnit, UnitExists, SetRaidTarget, GetRaidTargetIndex

local playerName = UnitName("player")

private.canSetIcons = {}
private.addsGUIDs = {}
private.enableIcons = true -- Set to false when a raid leader or a promoted player has a newer version of DBM

local scanExpires = {}
local addsIcon = {}
local addsIconSet = {}
local iconSortTable = {}
local iconSet = {}

local module = private:NewModule("Icons")

function module:SetIcon(bossMod, target, icon, timer)
	if not target then return end--Fix a rare bug where target becomes nil at last second (end combat fires and clears targets)
	if DBM.Options.DontSetIcons or not private.enableIcons or DBM:GetRaidRank(playerName) == 0 then
		return
	end
	bossMod:UnscheduleMethod("SetIcon", target)
	if type(icon) ~= "number" or type(target) ~= "string" then--icon/target probably backwards.
		DBM:Debug("|cffff0000SetIcon is being used impropperly. Check icon/target order|r")
		return--Fail silently instead of spamming icon lua errors if we screw up
	end
	icon = icon and icon >= 0 and icon <= 8 and icon or 8
	local uId = DBM:GetRaidUnitId(target)
	if uId and UnitIsUnit(uId, "player") and DBM:GetNumRealGroupMembers() < 2 then return end--Solo raid, no reason to put icon on yourself.
	if uId or UnitExists(target) then--target accepts uid, unitname both.
		uId = uId or target
		--save previous icon into a table.
		local oldIcon = self:GetIcon(uId) or 0
		if not bossMod.iconRestore[uId] then
			bossMod.iconRestore[uId] = oldIcon
		end
		--set icon
		if oldIcon ~= icon then--Don't set icon if it's already set to what we're setting it to
			SetRaidTarget(uId, bossMod.iconRestore[uId] and icon == 0 and bossMod.iconRestore[uId] or icon)
		end
		--schedule restoring old icon if timer enabled.
		if timer then
			bossMod:ScheduleMethod(timer, "SetIcon", target, 0)
		end
	end
end

local function SortByGroup(v1, v2)
	return DBM:GetRaidSubgroup(DBM:GetUnitFullName(v1)) < DBM:GetRaidSubgroup(DBM:GetUnitFullName(v2))
end

local function clearSortTable(scanID)
	iconSortTable[scanID] = nil
	iconSet[scanID] = nil
end

function module:SetIconByAlphaTable(bossMod, returnFunc, scanID) -- LOCAL
	tsort(iconSortTable[scanID])--Sorted alphabetically
	for i = 1, #iconSortTable[scanID] do
		local target = iconSortTable[scanID][i]
		if i > 8 then
			DBM:Debug("|cffff0000Too many players to set icons, reconsider where using icons|r", 2)
			return
		end
		if not bossMod.iconRestore[target] then
			bossMod.iconRestore[target] = self:GetIcon(target) or 0
		end
		SetRaidTarget(target, i)--Icons match number in table in alpha sort
		if returnFunc then
			bossMod[returnFunc](bossMod, target, i)--Send icon and target to returnFunc. (Generally used by announce icon targets to raid chat feature)
		end
	end
	DBM:Schedule(1.5, clearSortTable, scanID)--Table wipe delay so if icons go out too early do to low fps or bad latency, when they get new target on table, resort and reapplying should auto correct teh icon within .2-.4 seconds at most.
end

function module:SetAlphaIcon(bossMod, delay, target, maxIcon, returnFunc, scanID)
	if not target then return end
	if DBM.Options.DontSetIcons or not private.enableIcons or DBM:GetRaidRank(playerName) == 0 then
		return
	end
	scanID = scanID or 1
	local uId = DBM:GetRaidUnitId(target)
	if uId or UnitExists(target) then--target accepts uid, unitname both.
		uId = uId or target
		if not iconSortTable[scanID] then iconSortTable[scanID] = {} end
		if not iconSet[scanID] then iconSet[scanID] = 0 end
		local foundDuplicate = false
		for i = #iconSortTable[scanID], 1, -1 do
			if iconSortTable[scanID][i] == uId then
				foundDuplicate = true
				break
			end
		end
		if not foundDuplicate then
			iconSet[scanID] = iconSet[scanID] + 1
			tinsert(iconSortTable[scanID], uId)
		end
		bossMod:UnscheduleMethod("SetIconByAlphaTable")
		if maxIcon and iconSet[scanID] == maxIcon then
			self:SetIconByAlphaTable(bossMod, returnFunc, scanID)
		elseif bossMod:LatencyCheck() then--lag can fail the icons so we check it before allowing.
			bossMod:ScheduleMethod(delay or 0.5, "SetIconByAlphaTable", returnFunc, scanID)
		end
	end
end

function module:SetIconBySortedTable(bossMod, startIcon, reverseIcon, returnFunc, scanID) -- LOCAL
	tsort(iconSortTable[scanID], SortByGroup)
	local icon, CustomIcons
	if startIcon and type(startIcon) == "table" then--Specific gapped icons
		CustomIcons = true
		icon = 1
	else
		icon = startIcon or 1
	end
	for _, v in ipairs(iconSortTable[scanID]) do
		if not bossMod.iconRestore[v] then
			bossMod.iconRestore[v] = self:GetIcon(v) or 0
		end
		if CustomIcons then
			SetRaidTarget(v, startIcon[icon])--do not use SetIcon function again. It already checked in SetSortedIcon function.
			icon = icon + 1
			if returnFunc then
				bossMod[returnFunc](bossMod, v, startIcon[icon])--Send icon and target to returnFunc. (Generally used by announce icon targets to raid chat feature)
			end
		else
			SetRaidTarget(v, icon)--do not use SetIcon function again. It already checked in SetSortedIcon function.
			if reverseIcon then
				icon = icon - 1
			else
				icon = icon + 1
			end
			if returnFunc then
				bossMod[returnFunc](bossMod, v, icon)--Send icon and target to returnFunc. (Generally used by announce icon targets to raid chat feature)
			end
		end
	end
	DBM:Schedule(1.5, clearSortTable, scanID)--Table wipe delay so if icons go out too early do to low fps or bad latency, when they get new target on table, resort and reapplying should auto correct teh icon within .2-.4 seconds at most.
end

function module:SetSortedIcon(bossMod, delay, target, startIcon, maxIcon, reverseIcon, returnFunc, scanID)
	if not target then return end
	if DBM.Options.DontSetIcons or not private.enableIcons or DBM:GetRaidRank(playerName) == 0 then
		return
	end
	scanID = scanID or 1
	if not startIcon then startIcon = 1 end
	local uId = DBM:GetRaidUnitId(target)
	if uId or UnitExists(target) then--target accepts uid, unitname both.
		uId = uId or target
		if not iconSortTable[scanID] then iconSortTable[scanID] = {} end
		if not iconSet[scanID] then iconSet[scanID] = 0 end
		local foundDuplicate = false
		for i = #iconSortTable[scanID], 1, -1 do
			if iconSortTable[scanID][i] == uId then
				foundDuplicate = true
				break
			end
		end
		if not foundDuplicate then
			iconSet[scanID] = iconSet[scanID] + 1
			tinsert(iconSortTable[scanID], uId)
		end
		bossMod:UnscheduleMethod("SetIconBySortedTable")
		if maxIcon and iconSet[scanID] == maxIcon then
			self:SetIconBySortedTable(bossMod, startIcon, reverseIcon, returnFunc, scanID)
		elseif bossMod:LatencyCheck() then--lag can fail the icons so we check it before allowing.
			bossMod:ScheduleMethod(delay or 0.5, "SetIconBySortedTable", startIcon, reverseIcon, returnFunc, scanID)
		end
	end
end

function module:GetIcon(uIdOrTarget)
	local uId = DBM:GetRaidUnitId(uIdOrTarget) or uIdOrTarget
	return UnitExists(uId) and GetRaidTargetIndex(uId)
end

function module:RemoveIcon(bossMod, target)
	return self:SetIcon(bossMod, target, 0)
end

function module:ClearIcons()
	if IsInRaid() then
		for i = 1, GetNumGroupMembers() do
			if UnitExists("raid" .. i) and GetRaidTargetIndex("raid" .. i) then
				SetRaidTarget("raid" .. i, 0)
			end
		end
	else
		for i = 1, GetNumSubgroupMembers() do
			if UnitExists("party" .. i) and GetRaidTargetIndex("party" .. i) then
				SetRaidTarget("party" .. i, 0)
			end
		end
	end
end

function module:CanSetIcon(optionName)
	return private.canSetIcons[optionName] or false
end

local mobUids = {
	"nameplate1", "nameplate2", "nameplate3", "nameplate4", "nameplate5", "nameplate6", "nameplate7", "nameplate8", "nameplate9", "nameplate10",
	"nameplate11", "nameplate12", "nameplate13", "nameplate14", "nameplate15", "nameplate16", "nameplate17", "nameplate18", "nameplate19", "nameplate20",
	"nameplate21", "nameplate22", "nameplate23", "nameplate24", "nameplate25", "nameplate26", "nameplate27", "nameplate28", "nameplate29", "nameplate30",
	"nameplate31", "nameplate32", "nameplate33", "nameplate34", "nameplate35", "nameplate36", "nameplate37", "nameplate38", "nameplate39", "nameplate40",
	"raid1target", "raid2target", "raid3target", "raid4target", "raid5target", "raid6target", "raid7target", "raid8target", "raid9target", "raid10target",
	"raid11target", "raid12target", "raid13target", "raid14target", "raid15target", "raid16target", "raid17target", "raid18target", "raid19target", "raid20target",
	"raid21target", "raid22target", "raid23target", "raid24target", "raid25target", "raid26target", "raid27target", "raid28target", "raid29target", "raid30target",
	"raid31target", "raid32target", "raid33target", "raid34target", "raid35target", "raid36target", "raid37target", "raid38target", "raid39target", "raid40target",
	"party1target", "party2target", "party3target", "party4target",
	"mouseover", "target", "focus", "targettarget", "mouseovertarget"
	--	"boss1", "boss2", "boss3", "boss4", "boss5", "arena1", "arena2", "arena3", "arena4", "arena5"
}

function module:ScanForMobs(bossMod, creatureID, iconSetMethod, mobIcon, maxIcon, scanInterval, scanningTime, optionName, allowFriendly, secondCreatureID, skipMarked, allAllowed)
	if not optionName then optionName = bossMod.findFastestComputer[1] end
	if private.canSetIcons[optionName] or (allAllowed and not DBM.Options.DontSetIcons) then
		--Declare variables.
		DBM:Debug("canSetIcons or allAllowed true for "..(optionName or "nil"), 2)
		local timeNow = GetTime()
		if not creatureID then--This function must not be used to boss, so remove self.creatureId. Accepts cid, guid and cid table
			error("DBM:ScanForMobs calld without creatureID")
			return
		end
		iconSetMethod = iconSetMethod or 0--Set IconSetMethod -- 0: Descending / 1:Ascending / 2: Force Set / 9:Force Stop
		scanningTime = scanningTime or 8
		maxIcon = maxIcon or 8 --We only have 8 icons.
		allowFriendly = allowFriendly or false
		skipMarked = skipMarked or false
		secondCreatureID = secondCreatureID or 0
		scanInterval = scanInterval or 0.2
		--With different scanID, this function can support multi scanning same time. Required for Nazgrim.
		local scanID = 0
		if type(creatureID) == "number" then
			scanID = creatureID --guid and table no not supports multi scanning. only cid supports multi scanning
		end
		if iconSetMethod == 9 then--Force stop scanning
			--clear variables
			scanExpires[scanID] = nil
			addsIcon[scanID] = nil
			addsIconSet[scanID] = nil
			return
		end
		if not addsIcon[scanID] then addsIcon[scanID] = mobIcon or 8 end
		if not addsIconSet[scanID] then addsIconSet[scanID] = 0 end
		if not scanExpires[scanID] then scanExpires[scanID] = timeNow + scanningTime end
		--DO SCAN NOW
		for _, unitid in ipairs(mobUids) do
			local guid = UnitGUID(unitid)
			local cid = bossMod:GetCIDFromGUID(guid)
			local isFriend = UnitIsFriend("player", unitid)
			local isFiltered = false
			local success = false
			if (not allowFriendly and isFriend) or (skipMarked and GetRaidTargetIndex(unitid)) then
				isFiltered = true
				DBM:Debug(unitid.." was skipped because it's a filtered mob. Friend Flag: "..(isFriend and "true" or "false"), 2)
			end
			if not isFiltered then
				if guid and type(creatureID) == "table" and creatureID[cid] and not private.addsGUIDs[guid] then
					DBM:Debug("Match found in mobUids, SHOULD be setting table icon on "..unitid, 1)
					if type(creatureID[cid]) == "number" then
						SetRaidTarget(unitid, creatureID[cid])
						DBM:Debug("DBM called SetRaidTarget on "..unitid.." with icon value of "..creatureID[cid], 2)
						if GetRaidTargetIndex(unitid) then
							success = true
						end
					else
						SetRaidTarget(unitid, addsIcon[scanID])
						DBM:Debug("DBM called SetRaidTarget on "..unitid.." with icon value of "..addsIcon[scanID], 2)
						if GetRaidTargetIndex(unitid) then
							success = true
							if iconSetMethod == 1 then
								addsIcon[scanID] = addsIcon[scanID] + 1
							else
								addsIcon[scanID] = addsIcon[scanID] - 1
							end
						end
					end
					if success then
						DBM:Debug("SetRaidTarget was successful", 2)
						private.addsGUIDs[guid] = true
						addsIconSet[scanID] = addsIconSet[scanID] + 1
						if addsIconSet[scanID] >= maxIcon then--stop scan immediately to save cpu
							--clear variables
							scanExpires[scanID] = nil
							addsIcon[scanID] = nil
							addsIconSet[scanID] = nil
							return
						end
					else
						DBM:Debug("SetRaidTarget failed", 2)
					end
				elseif guid and ((guid == creatureID) or (cid == creatureID) or (cid == secondCreatureID)) and not private.addsGUIDs[guid] then
					DBM:Debug("Match found in mobUids, SHOULD be setting icon on "..unitid, 1)
					if iconSetMethod == 2 then
						SetRaidTarget(unitid, mobIcon)
						DBM:Debug("DBM called SetRaidTarget on "..unitid.." with icon value of "..mobIcon, 2)
						if GetRaidTargetIndex(unitid) then
							success = true
						end
					else
						SetRaidTarget(unitid, addsIcon[scanID])
						DBM:Debug("DBM called SetRaidTarget on "..unitid.." with icon value of "..addsIcon[scanID], 2)
						if GetRaidTargetIndex(unitid) then
							success = true
							if iconSetMethod == 1 then
								addsIcon[scanID] = addsIcon[scanID] + 1
							else
								addsIcon[scanID] = addsIcon[scanID] - 1
							end
						end
					end
					if DBM.Options.DebugMode and unitid:find("boss") then
						if not UnitExists(unitid) then
							DBM:Debug("SetRaidTarget may have failed on boss unit ID because unit does not yet exist, consider a delay on this method", 1)
						end
						if not UnitIsVisible(unitid) then
							DBM:Debug("SetRaidTarget may have failed on boss unit ID because unit is not visible yet, consider a delay on this method", 1)
						end
					end
					if success then
						DBM:Debug("SetRaidTarget was successful", 2)
						private.addsGUIDs[guid] = true
						addsIconSet[scanID] = addsIconSet[scanID] + 1
						if addsIconSet[scanID] >= maxIcon then--stop scan immediately to save cpu
							--clear variables
							scanExpires[scanID] = nil
							addsIcon[scanID] = nil
							addsIconSet[scanID] = nil
							return
						end
					else
						DBM:Debug("SetRaidTarget failed", 2)
					end
				end
			end
		end
		if timeNow < scanExpires[scanID] then--scan for limited time.
			bossMod:ScheduleMethod(scanInterval, "ScanForMobs", creatureID, iconSetMethod, mobIcon, maxIcon, scanInterval, scanningTime, optionName, allowFriendly, secondCreatureID, skipMarked, allAllowed)
		else
			DBM:Debug("Stopping ScanForMobs for: "..(optionName or "nil"), 2)
			--clear variables
			scanExpires[scanID] = nil
			addsIcon[scanID] = nil
			addsIconSet[scanID] = nil
			--Do not wipe adds GUID table here, it's wiped by :Stop() which is called by EndCombat
		end
	else
		DBM:Debug("Not elected to set icons for "..(optionName or "nil"), 2)
	end
end
