ScriptName SpaceProjectileHazardEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property Debug_SpaceProjectileSpell Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akTarget.AddSpell(Debug_SpaceProjectileSpell, False)
EndEvent
