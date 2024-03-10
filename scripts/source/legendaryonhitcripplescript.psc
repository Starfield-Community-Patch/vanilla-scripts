ScriptName LegendaryOnHitCrippleScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CrippleChance = 20 Auto Const
{ % Chance to cripple a leg on hit }
ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int roll = Utility.RandomInt(1, 100)
  Int coinFlip = Utility.RandomInt(0, 1)
  If roll <= CrippleChance
    If coinFlip == 1
      akTarget.DamageValue(LeftMobilityCondition, 99999.0)
    Else
      akTarget.DamageValue(RightMobilityCondition, 99999.0)
    EndIf
  EndIf
EndEvent
