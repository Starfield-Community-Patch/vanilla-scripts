ScriptName Fragments:Quests:QF_DialogueUCTheLodge_002956BB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Vasco Auto Const mandatory
Quest Property FFLodge_MB Auto Const mandatory
Quest Property MQ_TutorialQuest_Misc02 Auto Const mandatory
Quest Property MQ_TutorialQuest_Misc05 Auto Const mandatory
Quest Property MQ_TutorialQuest_Misc06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  MQ_TutorialQuest_Misc05.SetStage(10)
  MQ_TutorialQuest_Misc06.SetStage(10)
EndFunction

Function Fragment_Stage_0040_Item_00()
  MQ_TutorialQuest_Misc02.SetStage(10)
EndFunction

Function Fragment_Stage_0042_Item_00()
  Alias_Vasco.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  FFLodge_MB.SetStage(10)
EndFunction
