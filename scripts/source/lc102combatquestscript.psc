ScriptName LC102CombatQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property targetQuest Auto Const mandatory
Int Property stageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Function SetTargetQuestStage()
  If !targetQuest.IsStageDone(stageToSet)
    targetQuest.SetStage(stageToSet)
  EndIf
EndFunction
