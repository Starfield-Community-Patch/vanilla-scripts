ScriptName ENV_DisableSprintEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
inputenablelayer InputLayer

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  InputLayer = inputenablelayer.Create()
  InputLayer.EnableSprinting(False)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  InputLayer.Delete()
EndEvent
