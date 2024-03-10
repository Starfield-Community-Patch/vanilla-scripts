ScriptName HazardTriggerScript Extends ObjectReference Const
{ Script for a hazard-like trigger that casts a spell at any actors in the trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property TriggerSpell Auto Const mandatory
{ The spell to cast on any actors in the trigger. }
Float Property TriggerSpellDelay = 1.0 Auto Const
{ DEFAULT: 1. Timer delay between castings of the spell. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.StartTimer(TriggerSpellDelay, 0)
EndEvent

Event OnTimer(Int timerID)
  ObjectReference[] triggerRefs = Self.GetAllRefsInTrigger()
  If triggerRefs.Length > 0
    Int I = 0
    While I < triggerRefs.Length
      TriggerSpell.Cast(Self as ObjectReference, triggerRefs[I])
      I += 1
    EndWhile
    Self.StartTimer(TriggerSpellDelay, 0)
  EndIf
EndEvent
