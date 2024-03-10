ScriptName JetSlowTimeScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property UIJet Auto Const mandatory
Keyword Property PlayerConsumeJet Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer()
  UIJet.play(PlayerREF as ObjectReference, None, None)
  PlayerREF.SayCustom(PlayerConsumeJet, None, False, None)
EndEvent
