ScriptName MQ204CompanionAtEye_Script Extends ReferenceAlias

;-- Variables ---------------------------------------
Int StagePlayerLeftLodge = 400
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
