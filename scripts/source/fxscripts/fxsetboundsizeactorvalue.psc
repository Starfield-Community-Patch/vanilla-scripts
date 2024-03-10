ScriptName FXScripts:FXSetBoundSizeActorValue Extends ActiveMagicEffect
{ Script for play a visual effect that connects one actor to another. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property VFXActorBoundSize Auto
Float Property ScaleFactor = 2.002199888 Auto
{ Scale Value to modify bound volume.  Default will result in ~1.0 for human NPC }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Float x = akTarget.GetWidth()
  Float y = akTarget.GetLength()
  Float z = akTarget.GetHeight()
  Float Volume = x * x + y * y + z * z
  Float Diagonal = Math.sqrt(Volume)
  akTarget.SetValue(VFXActorBoundSize, Diagonal / ScaleFactor)
EndEvent
