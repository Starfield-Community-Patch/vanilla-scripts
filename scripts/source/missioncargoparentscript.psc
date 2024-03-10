ScriptName MissionCargoParentScript Extends MissionQuestScript conditional
{ parent script for mission quests that involve player cargo space }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CargoParentData
  GlobalVariable Property PlayerCargoSpaceCurrent Auto Const mandatory
  { used for text replacement - needs to be updated when player ship inventory changes }
  GlobalVariable Property PlayerCargoSpaceTotal Auto Const mandatory
  { used for text replacement }
  Bool Property hasCargoSpace = False Auto hidden
  { updated by UpdatePlayerCargoSpace }
  Bool Property hasShieldedCargoSpace = True Auto hidden
  { updated by UpdatePlayerCargoSpace }
  Keyword Property LocTypeStarStation Auto Const mandatory
  { for checking for docking }
  Keyword Property LocTypeStarstationExterior Auto Const mandatory
  { keyword to check if you've docked with a starstation }
EndGroup


;-- Functions ---------------------------------------

Function UpdatePlayerCargoSpace()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  If PlayerShipRef
    missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer()
    If cargoContainerRef
      Float cargoWeight = MissionIntValue01.GetValue()
      Float cargoSpaceTotal = PlayerShipRef.GetShipMaxCargoWeight()
      Float cargoSpaceUsed = PlayerShipRef.GetWeightInContainer()
      Float cargoSpace = cargoSpaceTotal - cargoSpaceUsed
      Float cargoSpaceShielded = PlayerShipRef.GetValue(MissionParent.CarryWeightShielded) - PlayerShipRef.GetContrabandWeight(False)
      hasCargoSpace = cargoWeight <= cargoSpace
      hasShieldedCargoSpace = cargoWeight <= cargoSpaceShielded
      PlayerCargoSpaceCurrent.SetValue(Math.Floor(cargoSpaceUsed) as Float)
      PlayerCargoSpaceTotal.SetValue(cargoSpaceTotal)
      Self.UpdateCurrentInstanceGlobal(PlayerCargoSpaceCurrent)
      Self.UpdateCurrentInstanceGlobal(PlayerCargoSpaceTotal)
    EndIf
  EndIf
EndFunction

missionboardcargocontainerscript Function GetCargoContainer()
  Return None
EndFunction
