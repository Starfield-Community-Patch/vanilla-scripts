ScriptName PushActorAwayScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property Magnitude Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetActor = akTarget as Actor
  If targetActor
    akCaster.PushActorAway(targetActor, Magnitude)
  EndIf
EndEvent
