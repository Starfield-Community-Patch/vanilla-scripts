ScriptName Fragments:Quests:QF_SQ_PlayerClearedReward_000394C5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SQ_ClearedLocationCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  SQ_ClearedLocationCount.SetValue(0.0)
EndFunction
