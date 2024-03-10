ScriptName TestJeffBEncounterSpawn Extends ObjectReference
{ script the lives on an activator that spawns a ref at the linked ref }

;-- Variables ---------------------------------------
ObjectReference myLink

;-- Properties --------------------------------------
ActorBase Property myLeveledActor Auto

;-- Functions ---------------------------------------

Event OnLoad()
  myLink = Self.GetLinkedRef(None)
EndEvent

Event OnActivate(ObjectReference akActionRef)
  myLink.PlaceAtMe(myLeveledActor as Form, 1, False, False, True, None, None, True)
EndEvent
