ScriptName FXScripts:FXPlaceExplosionOnLoad Extends ActiveMagicEffect Const
{ Places a activator on death. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property PlacedExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Actor targetActor = Self.GetTargetActor()
  If targetActor
    targetActor.PlaceAtMe(PlacedExplosion as Form, 1, False, False, True, None, None, True)
  EndIf
EndEvent
