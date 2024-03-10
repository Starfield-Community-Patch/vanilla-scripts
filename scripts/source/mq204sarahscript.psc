ScriptName MQ204SarahScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int StagePlayerLeftLodge = 420
Int StageToSetLeftLodge = 440

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Quest myMQ204 = Self.GetOwningQuest()
  If akActionRef == Game.GetPlayer() as ObjectReference
    If myMQ204.GetStageDone(StagePlayerLeftLodge)
      myMQ204.SetStage(StageToSetLeftLodge)
    EndIf
  EndIf
EndEvent
