ScriptName SpellEffectImodPlayerOnly Extends ActiveMagicEffect
{ Plays the selected Imod on begin effect }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ImageSpaceModifier Property myImod Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget == Game.GetPlayer() as ObjectReference
    myImod.Apply(1.0)
  EndIf
EndEvent
