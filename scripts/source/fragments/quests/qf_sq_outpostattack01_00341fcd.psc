ScriptName Fragments:Quests:QF_SQ_OutpostAttack01_00341FCD Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  sq_outpostattackhumansscript kmyQuest = __temp as sq_outpostattackhumansscript
  kmyQuest.StartAttack(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop()
EndFunction
