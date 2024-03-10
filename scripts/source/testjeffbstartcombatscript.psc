ScriptName TestJeffBStartCombatScript Extends ObjectReference
{ Tells the linked ref to start combat with his linkedref chain }

;-- Variables ---------------------------------------
Actor myActor

;-- Properties --------------------------------------
Keyword Property myKeyword Auto

;-- State -------------------------------------------
State allDone
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference
      myActor = Self.getlinkedRef(myKeyword) as Actor
      myActor.StartCombat((myActor.getlinkedRef(myKeyword) as Actor) as ObjectReference, False)
    EndIf
  EndEvent
EndState
