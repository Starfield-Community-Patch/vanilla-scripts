ScriptName glowingLootDropSCRIPT Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor caster

;-- Properties --------------------------------------
LeveledItem Property list Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  caster = akCaster
EndEvent

Event onDying(ObjectReference akKiller)
  caster.additem(list as Form, 1, False)
EndEvent
