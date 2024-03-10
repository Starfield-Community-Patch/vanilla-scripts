ScriptName DefaultIncActorValue Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Data
  ActorValue Property ValueToInc Auto Const mandatory
  Float Property AmountToInc = 1.0 Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ; Empty function
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Game.getPlayer().SetValue(ValueToInc, Game.getPlayer().GetValue(ValueToInc) + AmountToInc)
EndEvent
