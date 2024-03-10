ScriptName LegendaryCryoFreezeScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property pCryoFreezeSpell Auto
{ The Cryo freeze spell }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  pCryoFreezeSpell.Cast(Game.getPlayer() as ObjectReference, akTarget)
EndEvent
