ScriptName RI01PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property RI01_Radio_JobAdNeonScene Auto Const mandatory
Scene Property RI01_Radio_JobAdNewAtlantisScene Auto Const mandatory
Scene Property RI01_Radio_JobAdRyujinTowerScene Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
Location Property CityNewAtlantisLocation Auto Const mandatory
GlobalVariable Property UC04_AttackActive Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RunSetup()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc == CityNewAtlantisLocation
    RI01_Radio_JobAdNewAtlantisScene.Stop()
  EndIf
  If akOldLoc == CityNeonLocation
    RI01_Radio_JobAdNeonScene.Stop()
    RI01_Radio_JobAdRyujinTowerScene.Stop()
  EndIf
  If akNewLoc == CityNeonLocation
    RI01_Radio_JobAdNeonScene.Start()
    RI01_Radio_JobAdRyujinTowerScene.Start()
  EndIf
  If akNewLoc == CityNewAtlantisLocation && UC04_AttackActive.GetValue() == 0.0
    RI01_Radio_JobAdNewAtlantisScene.Start()
  EndIf
EndEvent

Function RunSetup()
  Location CurrentLocation = Game.GetPlayer().GetCurrentLocation()
  If CurrentLocation == CityNeonLocation
    RI01_Radio_JobAdNeonScene.Start()
    RI01_Radio_JobAdRyujinTowerScene.Start()
  EndIf
  If CurrentLocation == CityNewAtlantisLocation && UC04_AttackActive.GetValue() == 0.0
    RI01_Radio_JobAdNewAtlantisScene.Start()
  EndIf
EndFunction
