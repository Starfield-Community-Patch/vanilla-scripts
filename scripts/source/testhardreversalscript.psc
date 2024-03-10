ScriptName TestHardReversalScript Extends ObjectReference
{ sets an actor value on actor that enters }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property myAV Auto Const mandatory
{ First Actor Value to set. }
Float Property myAV_Value Auto Const mandatory
{ First Actor Value's new value. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference
    Actor myActor = akActionRef as Actor
    If myActor.getValue(myAV) == 0.0
      myActor.SetValue(myAV, 1.0)
    Else
      myActor.SetValue(myAV, 0.0)
    EndIf
    myActor.EvaluatePackage(False)
  EndIf
EndEvent
