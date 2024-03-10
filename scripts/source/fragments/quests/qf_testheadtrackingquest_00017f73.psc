ScriptName Fragments:Quests:QF_TestHeadtrackingQuest_00017F73 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property TestHeadtrackingQuestScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  TestHeadtrackingQuestScene.start()
EndFunction
