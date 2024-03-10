ScriptName TestHardReversalScript2 Extends ObjectReference
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
    myActor.SetValue(myAV, myAV_Value)
    myActor.EvaluatePackage(False)
  EndIf
EndEvent
