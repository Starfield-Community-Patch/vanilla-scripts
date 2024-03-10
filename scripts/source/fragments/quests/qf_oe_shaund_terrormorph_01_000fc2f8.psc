ScriptName Fragments:Quests:QF_OE_ShaunD_Terrormorph_01_000FC2F8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property OE_KreetTerrormorphDone Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0100_Item_00()
  OE_KreetTerrormorphDone.SetValue(1.0)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
