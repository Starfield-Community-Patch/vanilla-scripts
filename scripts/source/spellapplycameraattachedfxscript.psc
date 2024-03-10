ScriptName SpellApplyCameraAttachedFXScript Extends ActiveMagicEffect
{ Applies a camera attached fx }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group fx_Properties
  VisualEffect Property camAttachedFX Auto Const
  { FX to attach to the camera }
  Float Property timeToApply = 2.0 Auto Const
  { How long to play cam attach default 2 sec }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget == Game.getPlayer() as ObjectReference
    camAttachedFX.play(akTarget, timeToApply, None)
  EndIf
EndEvent
