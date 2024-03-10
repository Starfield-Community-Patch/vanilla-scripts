ScriptName AddictionOddsScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property Magnitude Auto
ActorValue Property TrackingActorValue Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akTarget.ModValue(TrackingActorValue, Magnitude)
EndEvent
