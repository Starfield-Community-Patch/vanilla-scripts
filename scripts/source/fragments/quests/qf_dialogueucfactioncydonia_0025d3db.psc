ScriptName Fragments:Quests:QF_DialogueUCFactionCydonia_0025D3DB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SpacerEnableMarker Auto Const mandatory
GlobalVariable Property UC03_PlayerKilledSpacerBoss Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
GlobalVariable Property UC_LouMeetsPlayerEarly Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  UC03_PlayerKilledSpacerBoss.SetValue(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_SpacerEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  UC_LouMeetsPlayerEarly.SetValue(1.0)
EndFunction
