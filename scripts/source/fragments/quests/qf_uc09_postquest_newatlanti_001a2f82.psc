ScriptName Fragments:Quests:QF_UC09_PostQuest_NewAtlanti_001A2F82 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC09_PostQuest_110_ShipTechs_HeatleechScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  uc09questscript kmyQuest = __temp as uc09questscript
  kmyQuest.GetNPCsInPlace()
EndFunction

Function Fragment_Stage_0110_Item_00()
  UC09_PostQuest_110_ShipTechs_HeatleechScene.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
