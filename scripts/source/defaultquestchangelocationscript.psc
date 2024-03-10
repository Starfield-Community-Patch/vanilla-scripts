ScriptName DefaultQuestChangeLocationScript Extends Quest Const default
{ set a stage when the player enters or exits a location }

;-- Structs -----------------------------------------
Struct ChangeLocationStage
  Int StageToSet = -1
  { Stage to Set }
  Location TargetLocation
  { The location we're interested in. }
  LocationAlias TargetLocationAlias
  { The location alias we're interested in. }
  Bool SetStageOnEnterLocation = True
  { if true (default), set stage when player enters location. If false,  set stage when player exits location }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored }
  Bool CheckPlayerShip = True
  { if true (default), also check when player's ship changes location }
  Bool RequireExactLocation = True
  { if true (default), set stage when player enters/exits the exact target location
	  if false, set stage when:
	     SetStageOnEnterLocation = true: player enters target location or a child of the target location
	     SetStageOnEnterLocation = false: player exits target location or a child of the target location, and is no longer in the target location or any children }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultquestchangelocationscript:changelocationstage[] Property ChangeLocationStages Auto Const
{ array of stage/location data }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }
Int Property OverridePrereqStage = -1 Auto Const
{ if this is set to a value > -1, ChangeLocationStages will not be checked at all until this stage is set }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If OverridePrereqStage < 0 || Self.GetStageDone(OverridePrereqStage)
    If akSender == Game.GetPlayer()
      Self.CheckLocationStages(akOldLoc, akNewLoc, False)
    EndIf
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If OverridePrereqStage < 0 || Self.GetStageDone(OverridePrereqStage)
    If akSender == SQ_PlayerShip.PlayerShip
      Self.CheckLocationStages(akOldLoc, akNewLoc, True)
    EndIf
  EndIf
EndEvent

Function CheckLocationStages(Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Int I = 0
  While I < ChangeLocationStages.Length
    defaultquestchangelocationscript:changelocationstage changeLocData = ChangeLocationStages[I]
    If changeLocData.TargetLocation
      Self.CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
    EndIf
    If changeLocData.TargetLocationAlias
      Location TargetLocation = changeLocData.TargetLocationAlias.GetLocation()
      Self.CheckLocation(TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
    EndIf
    I += 1
  EndWhile
EndFunction

Function CheckLocation(Location TargetLocation, defaultquestchangelocationscript:changelocationstage changeLocData, Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Location locationToCheck = None
  Location otherLocation = None
  Bool bIsValidLocation = False
  If changeLocData.SetStageOnEnterLocation
    If TargetLocation == akNewLoc || changeLocData.RequireExactLocation == False && TargetLocation.IsChild(akNewLoc) && TargetLocation.IsChild(akOldLoc) == False
      bIsValidLocation = True
    EndIf
  ElseIf changeLocData.RequireExactLocation
    bIsValidLocation = TargetLocation == akOldLoc
  Else
    If isPlayerShip == False
      If akNewLoc == SQ_PlayerShip.playerShipInteriorLocation.GetLocation()
        akNewLoc = SQ_PlayerShip.PlayerShip.GetRef().GetCurrentLocation()
      EndIf
    EndIf
    If TargetLocation != akNewLoc && TargetLocation.IsChild(akNewLoc) == False && (TargetLocation == akOldLoc || TargetLocation.IsChild(akOldLoc))
      bIsValidLocation = True
    EndIf
  EndIf
  If bIsValidLocation
    If isPlayerShip == False || changeLocData.CheckPlayerShip
      If Self.GetStageDone(changeLocData.StageToSet) == False && (changeLocData.PrereqStage == -1 || Self.GetStageDone(changeLocData.PrereqStage)) && (changeLocData.TurnOffStage == -1 || Self.GetStage() < changeLocData.TurnOffStage)
        Self.SetStage(changeLocData.StageToSet)
      EndIf
    EndIf
  EndIf
EndFunction
