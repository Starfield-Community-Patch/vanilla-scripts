ScriptName LC012NASAGravTrigger Extends ObjectReference Const
{ Set the Gravity for the cell on trigger enter }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property LC017NASA Auto Const mandatory
Float Property NewGravity Auto Const mandatory
Quest Property MQ301 Auto Const
Int Property TutorialStage = 147 Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.getplayer() as ObjectReference
    LC017NASA.setGravityScale(NewGravity)
    If MQ301.GetStageDone(TutorialStage) == False && NewGravity == 0.0
      MQ301.SetStage(TutorialStage)
    EndIf
    If NewGravity == 0.0
      ObjectReference DummyMarker = Self.GetLinkedRef(None)
      ObjectReference[] LinkedRefs = None
      LinkedRefs = DummyMarker.GetLinkedRefChain(None, 100)
      Int I = 0
      While I < LinkedRefs.Length
        LinkedRefs[I].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), (LinkedRefs[I].GetMass() * Utility.RandomInt(1, 2) as Float) * 0.25)
        I += 1
      EndWhile
    EndIf
  EndIf
EndEvent
