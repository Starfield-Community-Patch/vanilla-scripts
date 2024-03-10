ScriptName ChemEffectDialogueScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PlayerConsumeChem Auto mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer()
  If akTarget == PlayerREF as ObjectReference
    PlayerREF.SayCustom(PlayerConsumeChem, None, False, None)
  EndIf
EndEvent
