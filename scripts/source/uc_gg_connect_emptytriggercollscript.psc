ScriptName UC_GG_Connect_EmptyTriggerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 200 Auto Const
{ Only start shutting off trigger once this stage is set }
Int Property ShutdownStage = 350 Auto Const
{ Once this stage is set, we can stop checking (because the player's already found the right one) }
Int Property ObjectiveIndex = 200 Auto Const
{ Objective index we're modifying as each one of these triggers is updated }
GlobalVariable Property UC_GG_Connect_StopsCompleted Auto Const mandatory
{ Global used to track how many triggers the player's entered }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Quest OQ = Self.GetOwningQuest()
    If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
      Self.RemoveRef(akSenderRef)
      OQ.ModObjectiveGlobal(1.0, UC_GG_Connect_StopsCompleted, ObjectiveIndex, -1.0, True, True, True, False)
    EndIf
  EndIf
EndEvent
