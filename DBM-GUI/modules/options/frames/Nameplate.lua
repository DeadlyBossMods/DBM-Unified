local L = DBM_GUI_L
local CL = DBM_COMMON_L
local panel = DBM_GUI.Cat_Frames:CreateNewPanel(L.Panel_Nameplates, "option")

local general = panel:CreateArea(L.Area_General)

general:CreateCheckButton(L.SpamBlockNoNameplate, true, nil, "DontShowNameplateIcons")
general:CreateCheckButton(L.SpamBlockNoNameplateCD, true, nil, "DontShowNameplateIconsCD")
general:CreateCheckButton(L.SpamBlockNoBossGUIDs, true, nil, "DontSendBossGUIDs")

local style = panel:CreateArea(L.Area_Style)

local auraSizeSlider = style:CreateSlider(L.NPAuraSize, 20, 80, 1, 200)
auraSizeSlider:SetPoint("TOPLEFT", style.frame, "TOPLEFT", 20, -25)
auraSizeSlider:SetValue(DBM.Options.NPIconSize)
auraSizeSlider:HookScript("OnValueChanged", function(self)
	DBM.Options.NPIconSize = self:GetValue()
end)

local iconOffsetXSlider = style:CreateSlider(L.NPIcon_BarOffSetX, -50, 50, 1, 200)
iconOffsetXSlider:SetPoint("TOPLEFT", auraSizeSlider, "BOTTOMLEFT", 0, -10)
iconOffsetXSlider:SetValue(DBM.Options.NPIconXOffset)
iconOffsetXSlider:HookScript("OnValueChanged", function(self)
	DBM.Options.NPIconXOffset = self:GetValue()
end)
iconOffsetXSlider.myheight = 0

local iconOffsetYSlider = style:CreateSlider(L.NPIcon_BarOffSetY, -50, 50, 1, 200)
iconOffsetYSlider:SetPoint("TOPLEFT", iconOffsetXSlider, "BOTTOMLEFT", 0, -10)
iconOffsetYSlider:SetValue(DBM.Options.NPIconYOffset)
iconOffsetYSlider:HookScript("OnValueChanged", function(self)
	DBM.Options.NPIconYOffset = self:GetValue()
end)
iconOffsetYSlider.myheight = 0

local dirs = {
	{
		text	= CL.UP,
		value	= "UP",
	},
	{
		text	= CL.DOWN,
		value	= "DOWN",
	},
	{
		text	= CL.LEFT,
		value	= "LEFT",
	},
	{
		text	= CL.RIGHT,
		value	= "RIGHT",
	},
	{
		text	= CL.CENTER,
		value	= "CENTER",
	},
}

local iconGrowthDirection = style:CreateDropdown(L.NPIcon_GrowthDirection, dirs, "DBM", "NPIconGrowthDirection", function(value)
	DBM.Options.NPIconGrowthDirection = value
end)
iconGrowthDirection:SetPoint("TOPLEFT", iconOffsetYSlider, "BOTTOMLEFT", -20, -25)
iconGrowthDirection.myheight = 85

local testbutton = general:CreateButton(L.NPDemo, 100, 16)
testbutton:SetPoint("TOPRIGHT", style.frame, "TOPRIGHT", -2, -4)
testbutton:SetNormalFontObject(GameFontNormalSmall)
testbutton:SetHighlightFontObject(GameFontNormalSmall)
testbutton:SetScript("OnClick", function()
	DBM:DemoMode()
end)

local resetbutton = general:CreateButton(L.SpecWarn_ResetMe, 120, 16)
resetbutton:SetPoint("BOTTOMRIGHT", style.frame, "BOTTOMRIGHT", -2, 4)
resetbutton:SetNormalFontObject(GameFontNormalSmall)
resetbutton:SetHighlightFontObject(GameFontNormalSmall)
resetbutton:SetScript("OnClick", function()
	-- Set Options
	DBM.Options.NPIconSize = DBM.DefaultOptions.NPIconSize
	DBM.Options.NPIconXOffset = DBM.DefaultOptions.NPIconXOffset
	DBM.Options.NPIconYOffset = DBM.DefaultOptions.NPIconYOffset
	DBM.Options.NPIconGrowthDirection = DBM.DefaultOptions.NPIconGrowthDirection
	-- Set UI visuals
	auraSizeSlider:SetValue(DBM.DefaultOptions.NPIconSize)
	iconOffsetXSlider:SetValue(DBM.DefaultOptions.NPIconXOffset)
	iconOffsetYSlider:SetValue(DBM.DefaultOptions.NPIconYOffset)
end)
