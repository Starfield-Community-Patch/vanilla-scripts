ScriptName SocialSkill_Manipulation_CommandOnHit Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CharmFaction Auto
Bool Property bMakePlayerTeammate = False Auto
Int Property AllowForTeammate = 0 Auto
Topic Property CombatTopicToSay Auto
GlobalVariable Property WICastNonHostileTimer Auto
GlobalVariable Property GameDaysPassed Auto
Topic Property TopicToSay Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor
  myTarget.AddToFaction(CharmFaction)
  If bMakePlayerTeammate
    myTarget.SetPlayerTeammate(True, True, False)
    myTarget.SetCanDoCommand(True)
    myTarget.SetCommandState(True)
  EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor
  myTarget.RemoveFromFaction(CharmFaction)
  If bMakePlayerTeammate
    myTarget.SetPlayerTeammate(False, False, False)
  EndIf
EndEvent
