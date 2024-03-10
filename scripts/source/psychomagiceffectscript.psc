ScriptName PsychoMagicEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PlayerConsumePsycho Auto mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer()
  If akTarget == PlayerREF as ObjectReference
    PlayerREF.SayCustom(PlayerConsumePsycho, None, False, None)
  EndIf
EndEvent
