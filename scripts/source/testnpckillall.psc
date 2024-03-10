ScriptName TestNPCKillAll Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const
{ Either fill this with the spawn controller, or use a default linkedRef to the spawn controller }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None)
  If SpawnControllerFromLink
    (SpawnControllerFromLink as testnpcarenascript).KillAllNPCs()
  ElseIf SpawnController
    (SpawnController as testnpcarenascript).KillAllNPCs()
  EndIf
EndEvent
