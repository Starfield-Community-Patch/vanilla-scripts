ScriptName StarPower_AlienAlliance_Faction Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor target

;-- Properties --------------------------------------
Faction Property PlayerAllyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  target = akTarget as Actor
  target.stopcombat()
  target.makeplayerfriend()
  target.addtofaction(PlayerAllyFaction)
EndEvent
