ScriptName DefaultMessageOnEffectStart Extends ActiveMagicEffect default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MessageToShow Auto Const mandatory
{ The message to show when this effect starts. }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndEvent
