ScriptName LC088_DefensiveBatteryAliasScript Extends ReferenceAlias
{ Script to toggle the Defensive Batteries' Laser Fire. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  VisualEffect Property FX_ShipExplosionHugeBattery Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  ObjectReference selfRef = Self.GetReference()
  FX_ShipExplosionHugeBattery.Play(selfRef, -1.0, None)
  Utility.Wait(5.0)
  selfRef.Disable(False)
EndEvent
