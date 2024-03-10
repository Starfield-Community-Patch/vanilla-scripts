ScriptName COM_ConvoQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property QuestToSet Auto Const mandatory
{ Convo tracking quest whose stage we should set. }
Int Property StageToSet Auto Const mandatory
{ what stage to set in QuestToSet when "kmyquest.SceneCompleted()" is called from scene fragmen }

;-- Functions ---------------------------------------

Function SceneCompleted()
  QuestToSet.SetStage(StageToSet)
EndFunction
