ScriptName Test_PryOpenDoors Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ActivatorLever Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(ActivatorLever) as ScriptObject, "OnTriggerEnter")
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  Utility.Wait(5.0)
  ObjectReference Destination = Self.GetLinkedRef(None)
  Self.TranslateToRef(Destination, 0.001, 0.0)
EndEvent
