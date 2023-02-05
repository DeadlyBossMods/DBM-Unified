local L = DBM_GUI_L
local rlControlsPanel = DBM_GUI.Cat_Filters:CreateNewPanel(L.Tab_RLControls, "option")

local featureOverridesArea = rlControlsPanel:CreateArea(L.Area_FeatureOverrides)
featureOverridesArea:CreateCheckButton(L.OverrideIcons, true, nil, "DisableRaidIcons")
featureOverridesArea:CreateCheckButton(L.OverrideSay, true, nil, "DisableChatBubbles")
featureOverridesArea:CreateCheckButton(L.DisableStatusWhisperShort, true, nil, "DisableStatusWhisper")--TODO, whenc hanging this checkbox, make sure other checkbox in privacy also updates?
featureOverridesArea:CreateCheckButton(L.DisableGuildStatusShort, true, nil, "DisableGuildStatus")--TODO, whenc hanging this checkbox, make sure other checkbox in privacy also updates?
local infotext = featureOverridesArea:CreateText(L.ConfigAreaFooter, nil, false, GameFontNormalSmall, "LEFT", 25)
infotext:SetPoint("BOTTOMLEFT", featureOverridesArea.frame, "BOTTOMLEFT", 10, 10)

local configOverrideArea = rlControlsPanel:CreateArea(L.Area_ConfigOverrides)
configOverrideArea:CreateCheckButton(L.OverrideBossAnnounceOptions, true, nil, "OverrideBossAnnounce")
configOverrideArea:CreateCheckButton(L.OverrideBossTimerOptions, true, nil, "OverrideBossTimer")
configOverrideArea:CreateCheckButton(L.OverrideBossIconOptions, true, nil, "OverrideBossIcon")
configOverrideArea:CreateCheckButton(L.OverrideBossSayOptions, true, nil, "OverrideBossSay")
local infotext2 = configOverrideArea:CreateText(L.ConfigAreaFooter, nil, false, GameFontNormalSmall, "LEFT", 20)
infotext2:SetPoint("BOTTOMLEFT", configOverrideArea.frame, "BOTTOMLEFT", 10, 10)
local infotext3 = configOverrideArea:CreateText(L.ConfigAreaFooter2, nil, false, GameFontNormalSmall, "LEFT", 25)
infotext3:SetPoint("BOTTOMLEFT", infotext2, "BOTTOMLEFT", 0, 20)

local infotext4 = rlControlsPanel:CreateText(L.TabFooter, nil, false, GameFontNormalSmall, "LEFT", 0)
infotext4:SetPoint("BOTTOMLEFT", rlControlsPanel.frame, "BOTTOMLEFT", 10, 10)
