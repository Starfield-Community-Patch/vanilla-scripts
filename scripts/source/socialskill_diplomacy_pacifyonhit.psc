ScriptName SocialSkill_Diplomacy_PacifyOnHit Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CharmFaction Auto
Int Property AllowForTeammate = 0 Auto
Topic Property CombatTopicToSay Auto
GlobalVariable Property WICastNonHostileTimer Auto
GlobalVariable Property GameDaysPassed Auto
Topic Property TopicToSay Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor
  myTarget.AddToFaction(CharmFaction)
  akCaster.StopCombat()
  myTarget.StopCombat()
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor
  myTarget.RemoveFromFaction(CharmFaction)
EndEvent
