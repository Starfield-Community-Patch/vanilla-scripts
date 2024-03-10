ScriptName Fragments:Quests:QF_DialogueHopeTown_002A823E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueHopeTown_100_IntroScene Auto Const mandatory
Quest Property SY_HopeTech_TestPilot01 Auto Const mandatory
Quest Property Hope01 Auto Const mandatory
Quest Property Hope02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0999_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0050_Item_00()
  Hope01.Start()
  Hope02.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueHopeTown_100_IntroScene.Start()
EndFunction

Function Fragment_Stage_1110_Item_00()
  SY_HopeTech_TestPilot01.SetStage(100)
EndFunction
