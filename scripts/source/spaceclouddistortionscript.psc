ScriptName SpaceCloudDistortionScript Extends SpaceCloudManagerScript
{ Script for Space Distortion Clouds. Ships in these clouds are given a perk that reduces incoming damage. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group DistortionCloudProperties
  Perk Property EffectPerk Auto Const
  { Perk to apply to ships within the cloud. }
EndGroup


;-- Functions ---------------------------------------

Function ApplyCloudEffect(spaceshipreference target, Float currentTime)
  If target.GetValue(UpdateTimestampValue) == 0.0
    target.AddPerk(EffectPerk, False)
    If target == PlayerShip.GetShipRef()
      Game.GetPlayer().AddPerk(EffectPerk, False)
    EndIf
  EndIf
EndFunction

Function RemoveCloudEffect(spaceshipreference target)
  target.RemovePerk(EffectPerk)
  If target == PlayerShip.GetShipRef()
    Game.GetPlayer().RemovePerk(EffectPerk)
  EndIf
EndFunction
