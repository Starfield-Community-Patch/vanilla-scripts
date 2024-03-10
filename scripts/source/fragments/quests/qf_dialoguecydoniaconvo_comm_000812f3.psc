ScriptName Fragments:Quests:QF_DialogueCydoniaConvo_Comm_000812F3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CY_CommunityConvo_CooldownTime Auto Const mandatory
GlobalVariable Property CY_CommunityConvo_CooldownTimeDaysToAdd Auto Const mandatory
GlobalVariable Property CY_Community_Support01_Variation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  CY_Community_Support01_Variation.Mod(1.0)
EndFunction

Function Fragment_Stage_10000_Item_00()
  CY_CommunityConvo_CooldownTime.SetValue(Utility.GetCurrentGameTime() + CY_CommunityConvo_CooldownTimeDaysToAdd.GetValue())
  If CY_Community_Support01_Variation.GetValue() == 3.0
    CY_Community_Support01_Variation.SetValue(0.0)
  EndIf
EndFunction
