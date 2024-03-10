ScriptName SpaceCloudStormScript Extends SpaceCloudManagerScript
{ Script for Space Storm Clouds. Ships in these clouds are periodically hit by SpaceStormBolt lightning spells. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StormCloudProperties
  Spell[] Property SpaceStormBolts Auto Const
  { Array of full-strength Space Storm Bolt spells to cast. Variants are used to vary the damage a bit. }
  Spell Property SpaceStormBolt_DamageVariantHalf Auto Const
  { A half-strength Space Storm Bolt, cast when we roll to have two bolts strike in quick succession. }
  ActorValue Property SpaceStormBoltTimestampValue Auto Const
  { Actor value used to timestamp when a bolt was last cast on each target. }
  Float Property SpaceStormBoltCastDelayMin = 1.0 Auto Const
  { Minimum delay between bolts. }
  Float Property SpaceStormBoltCastDelayMax = 2.0 Auto Const
  { Maximum delay between bolts. }
  Float Property SpaceStormBoltChanceTwoBolts = 0.200000003 Auto Const
  { Chance that, when we go to cast a SpaceStormBolt, we fire two half-strength bolts instead of a single full-strength bolt. }
  Float Property SpaceStormBoltTwoBoltDelayMin = 0.100000001 Auto Const
  { Minimum delay between double bolts. }
  Float Property SpaceStormBoltTwoBoltDelayMax = 0.5 Auto Const
  { Maximum delay between double bolts. }
EndGroup

Group Debug
  Spell Property Debug_SpaceStormBolt_DamageVariantRatio Auto Const
  ActorValue Property Debug_SpaceStormBolt_TestEffectRatioValue Auto Const
EndGroup


;-- Functions ---------------------------------------

Function ApplyCloudEffect(spaceshipreference target, Float currentTime)
  Float effectSpellTimestamp = target.GetValue(SpaceStormBoltTimestampValue)
  If effectSpellTimestamp == 0.0
    target.SetValue(SpaceStormBoltTimestampValue, currentTime + Utility.RandomFloat(0.0, SpaceStormBoltCastDelayMax))
  ElseIf currentTime > effectSpellTimestamp || currentTime < effectSpellTimestamp - SpaceStormBoltCastDelayMax
    If target.GetValue(Debug_SpaceStormBolt_TestEffectRatioValue)
      Debug_SpaceStormBolt_DamageVariantRatio.Cast(target as ObjectReference, target as ObjectReference)
    ElseIf Utility.RandomFloat(0.0, 1.0) < SpaceStormBoltChanceTwoBolts
      SpaceStormBolt_DamageVariantHalf.Cast(target as ObjectReference, target as ObjectReference)
      Utility.Wait(Utility.RandomFloat(SpaceStormBoltTwoBoltDelayMin, SpaceStormBoltTwoBoltDelayMax))
      SpaceStormBolt_DamageVariantHalf.Cast(target as ObjectReference, target as ObjectReference)
    Else
      Spell selectedBolt = SpaceStormBolts[Utility.RandomInt(0, SpaceStormBolts.Length - 1)]
      selectedBolt.Cast(target as ObjectReference, target as ObjectReference)
    EndIf
    target.SetValue(SpaceStormBoltTimestampValue, currentTime + Utility.RandomFloat(SpaceStormBoltCastDelayMin, SpaceStormBoltCastDelayMax))
  EndIf
EndFunction

Function RemoveCloudEffect(spaceshipreference target)
  target.SetValue(SpaceStormBoltTimestampValue, 0.0)
EndFunction
