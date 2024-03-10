ScriptName SocialSkill_Manipulation_ForceCommand Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CharmFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor
  myTarget.AddToFaction(CharmFaction)
  myTarget.SetCanDoCommand(True)
  myTarget.SetCommandState(True)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor
  myTarget.RemoveFromFaction(CharmFaction)
  myTarget.SetCanDoCommand(False)
  myTarget.SetCommandState(False)
EndEvent
