ScriptName FXabVisualEffectScript Extends ActiveMagicEffect
{ This Script applies a Visual Effect. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
VisualEffect Property VisualEffectToApply Auto Const mandatory
{ This is the visue effect that will be used. }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  VisualEffectToApply.play(akCaster as ObjectReference, -1.0, None)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  VisualEffectToApply.Stop(akCaster as ObjectReference)
EndEvent
