ScriptName ArtifactPower_Advancement Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PowerPerk Auto Const mandatory
Spell Property PowerSpell Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.RemoveSpell(PowerSpell)
  PlayerREF.AddPerk(PowerPerk, False)
  PlayerREF.AddSpell(PowerSpell, False)
EndEvent
