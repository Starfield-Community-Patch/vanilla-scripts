ScriptName Artifact_Moonform_Stagger_Resist Extends ActiveMagicEffect
{ Awards a perk. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property StaggerResist_Perk Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.addPerk(StaggerResist_Perk, False)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.removePerk(StaggerResist_Perk)
EndEvent
