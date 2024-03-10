ScriptName RL040DirectionSwapScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PirateLeader Auto Const mandatory
ObjectReference Property PirateLeaderMoveToMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  PirateLeader.MoveTo(PirateLeaderMoveToMarker, 0.0, 0.0, 0.0, True, False)
EndEvent
