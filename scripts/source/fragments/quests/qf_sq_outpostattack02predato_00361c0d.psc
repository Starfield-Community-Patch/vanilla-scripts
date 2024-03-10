ScriptName Fragments:Quests:QF_SQ_OutpostAttack02Predato_00361C0D Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  sq_outpostattackscript kmyQuest = __temp as sq_outpostattackscript
  kmyQuest.StartAttack(True)
EndFunction
