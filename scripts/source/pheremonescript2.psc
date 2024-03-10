ScriptName PheremoneScript2 Extends ActiveMagicEffect

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.StopCombat()
EndEvent
