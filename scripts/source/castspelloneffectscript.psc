ScriptName CastSpellOnEffectScript Extends ActiveMagicEffect hidden
{ Cast spell on target timed after another effect. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property OnEffectSpell Auto Const
{ Cast this spell on effect start. }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  OnEffectSpell.Cast(akCaster as ObjectReference, akTarget)
EndEvent
