ScriptName Fragments:Quests:QF_DialogueWaggonerFarm_002CC109 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFWaggonerFarm01 Auto Const mandatory
Quest Property FFWaggonerFarm02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0110_Item_00()
  FFWaggonerFarm01.Start()
EndFunction

Function Fragment_Stage_0210_Item_00()
  FFWaggonerFarm02.Start()
EndFunction
