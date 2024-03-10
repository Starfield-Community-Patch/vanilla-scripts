ScriptName Fragments:Quests:QF_SQ_OutpostAttack01Predato_00361A85 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  sq_outpostattackcreaturesscript kmyQuest = __temp as sq_outpostattackcreaturesscript
  kmyQuest.StartAttack(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop()
EndFunction
