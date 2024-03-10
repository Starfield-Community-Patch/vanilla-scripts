ScriptName ModLegendaryOnCritHitRefillAPScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ActionPoints Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.RestoreValue(ActionPoints, 999.0)
EndEvent
