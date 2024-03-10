ScriptName Fragments:Quests:QF_FFNeonZ06_QuestIntroTimer_001CEDC2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property pDialogueFCNeon Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  dialoguefcneon_timerscript kmyQuest = __temp as dialoguefcneon_timerscript
  kmyQuest.Wait24()
EndFunction

Function Fragment_Stage_0020_Item_00()
  pDialogueFCNeon.SetStage(294)
EndFunction
