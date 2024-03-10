ScriptName UC09SceneTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStage = 310 Auto Const
{ Only check this trigger once this stage is set }
ReferenceAlias Property Abello Auto Const mandatory
{ Ref alias for President Abello }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest()
  Actor PlayACT = Game.GetPlayer()
  If OQ.GetStageDone(PreReqStage) && (akActionRef == Game.GetPlayer() as ObjectReference)
    Abello.GetActorRef().Activate(PlayACT as ObjectReference, False)
  EndIf
EndEvent
