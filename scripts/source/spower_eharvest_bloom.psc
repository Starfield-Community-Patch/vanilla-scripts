ScriptName SPower_EHarvest_Bloom Extends ActiveMagicEffect

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akTarget.SetHarvested(False)
EndEvent
