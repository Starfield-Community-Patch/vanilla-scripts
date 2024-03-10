ScriptName CastSpellOnActivate Extends ObjectReference
{ Casts a spell with user as target }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property SpellToCast Auto Const mandatory

;-- Functions ---------------------------------------

Function ArcElectricityToTarget(ObjectReference target)
  If target
    SpellToCast.Cast(Self as ObjectReference, target)
  EndIf
EndFunction

;-- State -------------------------------------------
State Busy

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Busy")
    Self.ArcElectricityToTarget(akActionRef)
    Self.GoToState("Waiting")
  EndEvent
EndState
