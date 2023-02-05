local L = DBM_GUI_L

local reducPanel = DBM_GUI.Cat_Filters:CreateNewPanel(L.Panel_ReducedInformation, "option")

local spamAnnounces = reducPanel:CreateArea(L.Area_SpamFilter_Anounces)
spamAnnounces:CreateCheckButton(L.SpamBlockNoShowTgtAnnounce, true, nil, "DontShowTargetAnnouncements")
spamAnnounces:CreateCheckButton(L.SpamBlockNoTrivialSpecWarnSound, true, nil, "DontPlayTrivialSpecialWarningSound")

local spamArea = reducPanel:CreateArea(L.Area_SpamFilter)
spamArea:CreateCheckButton(L.DontShowFarWarnings, true, nil, "DontShowFarWarnings")
spamArea:CreateCheckButton(L.StripServerName, true, nil, "StripServerName")
spamArea:CreateCheckButton(L.FilterVoidFormSay, true, nil, "FilterVoidFormSay")

local spamSpecArea = reducPanel:CreateArea(L.Area_SpecFilter)
spamSpecArea:CreateCheckButton(L.FilterTankSpec, true, nil, "FilterTankSpec")
spamSpecArea:CreateCheckButton(L.FilterDispels, true, nil, "FilterDispel")
spamSpecArea:CreateCheckButton(L.FilterTrashWarnings, true, nil, "FilterTrashWarnings2")
local FilterInterruptNote = spamSpecArea:CreateCheckButton(L.FilterInterruptNoteName, true, nil, "FilterInterruptNoteName")

local interruptOptions = {
	{	text	= L.SWFNever,			value	= "None"},
	{	text	= L.FilterInterrupts,	value	= "onlyTandF"},
	{	text	= L.FilterInterrupts2,	value	= "TandFandBossCooldown"},
	{	text	= L.FilterInterrupts3,	value	= "TandFandAllCooldown"},
}
local interruptDropDown		= spamSpecArea:CreateDropdown(L.FilterInterruptsHeader, interruptOptions, "DBM", "FilterInterrupt2", function(value)
	DBM.Options.FilterInterrupt2 = value
end, 410)
interruptDropDown:SetPoint("TOPLEFT", FilterInterruptNote, "BOTTOMLEFT", -15, -25)
interruptDropDown.myheight = 50
