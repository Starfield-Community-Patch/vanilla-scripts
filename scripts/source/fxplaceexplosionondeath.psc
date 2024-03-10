ScriptName FXPlaceExplosionOnDeath Extends ActiveMagicEffect Const
{ Places a activator on death. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property PlacedActivator Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  Actor targetActor = Self.GetTargetActor()
  If targetActor
    targetActor.PlaceAtMe(PlacedActivator as Form, 1, False, False, True, None, None, True)
  EndIf
EndEvent
