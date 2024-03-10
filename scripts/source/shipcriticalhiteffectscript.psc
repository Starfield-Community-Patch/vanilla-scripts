ScriptName ShipCriticalHitEffectScript Extends ActiveMagicEffect
{ test script for critical hits on ships }

;-- Structs -----------------------------------------
Struct CriticalHitEffect
  Int weight
  Int criticalHitType
  ActorValue systemAV
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
{ holds critical hit data/logic }
shipcriticalhiteffectscript:criticalhiteffect[] Property CriticalHitEffects Auto Const
{ array of critical hit effects }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  SQ_Parent.HandleCriticalHit(akTarget as spaceshipreference, CriticalHitEffects)
EndEvent
