ScriptName LC017NASAGravityToNormal Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property LC017NASA Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  LC017NASA.setGravityScale(1.0)
EndEvent
