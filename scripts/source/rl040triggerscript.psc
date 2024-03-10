ScriptName RL040TriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  myEnableMarker.Enable(False)
  Utility.Wait(0.100000001)
  Self.GetOwningQuest().SetStage(20)
EndEvent
