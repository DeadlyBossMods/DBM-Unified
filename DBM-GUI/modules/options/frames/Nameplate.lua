local L = DBM_GUI_L
local panel = DBM_GUI.Cat_Frames:CreateNewPanel(L.Panel_Nameplates, "option")

local general = panel:CreateArea(L.Area_General)

general:CreateCheckButton(L.SpamBlockNoNameplate, true, nil, "DontShowNameplateIcons")
general:CreateCheckButton(L.SpamBlockNoNameplateCD, true, nil, "DontShowNameplateIconsCD")
general:CreateCheckButton(L.SpamBlockNoBossGUIDs, true, nil, "DontSendBossGUIDs")
general:CreateCheckButton(L.SpamBlockTimersWithNameplates, true, nil, "DontShowTimersWithNameplates")

local style = panel:CreateArea(L.Area_Style)

local auraSizeSlider = style:CreateSlider(L.NPAuraSize, 20, 80, 1, 200)
auraSizeSlider:SetPoint("TOPLEFT", style.frame, "TOPLEFT", 20, -25)
auraSizeSlider:SetValue(DBM.Options.NPAuraSize)
auraSizeSlider:HookScript("OnValueChanged", function(self)
	DBM.Options.NPAuraSize = self:GetValue()
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

local resetbutton = general:CreateButton(L.SpecWarn_ResetMe, 120, 16)
resetbutton:SetPoint("BOTTOMRIGHT", style.frame, "BOTTOMRIGHT", -2, 4)
resetbutton:SetNormalFontObject(GameFontNormalSmall)
resetbutton:SetHighlightFontObject(GameFontNormalSmall)
resetbutton:SetScript("OnClick", function()
	-- Set Options
	DBM.Options.NPAuraSize = DBM.DefaultOptions.NPAuraSize
	-- Set UI visuals
	auraSizeSlider:SetValue(DBM.DefaultOptions.NPAuraSize)
end)
