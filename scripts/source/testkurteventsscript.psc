ScriptName TestKurtEventsScript Extends ReferenceAlias
{ trace events }

;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  ; Empty function
EndEvent

Event OnDeath(ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
  ; Empty function
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  ; Empty function
EndEvent

Event OnUnload()
  ; Empty function
EndEvent
