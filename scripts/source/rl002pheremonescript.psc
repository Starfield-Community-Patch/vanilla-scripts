ScriptName RL002PheremoneScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionName Auto Const mandatory
Float Property duration Auto Const
ImageSpaceModifier Property ImageSpaceEnd Auto Const
ImageSpaceModifier Property ImageSpaceStart Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.AddToFaction(FactionName)
  akCaster.StopCombat()
  ImageSpaceStart.Apply(1.0)
  Utility.Wait(15.0)
  Utility.Wait(5.0)
  ImageSpaceStart.Remove()
  ImageSpaceEnd.Apply(1.0)
  akCaster.RemoveFromFaction(FactionName)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.RemoveFromFaction(FactionName)
EndEvent
