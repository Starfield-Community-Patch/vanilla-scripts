ScriptName SpellEffectImod Extends ActiveMagicEffect
{ Plays the selected Imod on begin effect }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ImageSpaceModifier Property StingwingPoisonImod Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  StingwingPoisonImod.Apply(1.0)
EndEvent
