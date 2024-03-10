ScriptName MQ204StateChangeHandlerPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityNewAtlantisLocation Auto Const mandatory
MusicType Property _MUSExplore_WwiseSilence Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == CityNewAtlantisLocation
    _MUSExplore_WwiseSilence.Add()
  ElseIf akOldLoc == CityNewAtlantisLocation
    If Game.GetPlayer().IsInLocation(CityNewAtlantisLocation) == False
      _MUSExplore_WwiseSilence.Remove()
    EndIf
  EndIf
EndEvent
