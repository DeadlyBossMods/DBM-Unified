local L = DBM_GUI_L

local pbcPanel = DBM_GUI.Cat_Filters:CreateNewPanel(L.Panel_PullBreakCombat, "option")

local pbcPTArea = pbcPanel:CreateArea(L.Area_PullTimer)
pbcPTArea:CreateCheckButton(L.DontShowPTNoID, true, nil, "DontShowPTNoID")
pbcPTArea:CreateCheckButton(L.DontShowPT, true, nil, "DontShowPT2")
pbcPTArea:CreateCheckButton(L.DontShowPTText, true, nil, "DontShowPTText")
pbcPTArea:CreateCheckButton(L.DontShowPTCountdownText, true, nil, "DontShowPTCountdownText")
local SPTCDA = pbcPTArea:CreateCheckButton(L.DontPlayPTCountdown, true, nil, "DontPlayPTCountdown")

local PTSlider = pbcPTArea:CreateSlider(L.PT_Threshold, 1, 10, 1, 300)
PTSlider:SetPoint("BOTTOMLEFT", SPTCDA, "BOTTOMLEFT", 80, -40)
PTSlider:SetValue(math.floor(DBM.Options.PTCountThreshold2))
PTSlider:HookScript("OnValueChanged", function(self)
	DBM.Options.PTCountThreshold2 = math.floor(self:GetValue())
end)

local pbcSoundsArea = pbcPanel:CreateArea(L.Area_SoundOptions)

local PTCountSoundDropDown = pbcSoundsArea:CreateDropdown(L.PullVoice, DBM:GetCountSounds(), "DBM", "PullVoice", function(value)
	DBM.Options.PullVoice = value
	DBM:PlayCountSound(1, DBM.Options.PullVoice)
	DBM:BuildVoiceCountdownCache()
end, 180)
PTCountSoundDropDown:SetPoint("TOPLEFT", pbcSoundsArea.frame, "TOPLEFT", 0, -20)

local Sounds = DBM_GUI:MixinSharedMedia3("sound", {
	{
		text	= L.NoSound,
		value	= "None"
	}
})

local PullSoundDropdown = pbcSoundsArea:CreateDropdown(L.EventEngagePT, Sounds, "DBM", "EventSoundPullTimer", function(value)
	DBM.Options.EventSoundPullTimer = value
	DBM:PlaySoundFile(DBM.Options.EventSoundPullTimer)
end, 180)
PullSoundDropdown:SetPoint("TOPLEFT", PTCountSoundDropDown, "TOPLEFT", 0, -45)
