ScriptName FFCydoniaZ04PostersQuestScript Extends Quest

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
  Int TurnOffStageDone = -1
  { OPTIONAL - If stage TurnOffStageDone is set, this script's functionality is ignored }
  Bool CheckPlayerShip = True
  { if true (default), also check when player's ship changes location }
  Bool RequireExactLocation = True
  { if true (default), set stage when player enters/exits the exact target location
	  if false, set stage when player enters/exits target location or a child of the target location }
  GlobalVariable Visit02Time
  { The Global to set and check against the global time in the game for the purpose of enabling more posters }
  RefCollectionAlias RefCollectionAliasToEnable
  { If set, Enable this RefCollectionAlias }
EndStruct


;-- Variables ---------------------------------------
Int iStageDoneTotal = 0

;-- Properties --------------------------------------
GlobalVariable Property GameDaysPassed Auto Const mandatory
GlobalVariable Property FFCydoniaZ04_Visit01_Time Auto Const mandatory
GlobalVariable Property FFCydoniaZ04_TimeToPass Auto Const mandatory
Int Property EndQuestStage = 1000 Auto Const
ffcydoniaz04postersquestscript:changelocationstage[] Property ChangeLocationStages Auto Const
{ array of stage/location data }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange")
  FFCydoniaZ04_Visit01_Time.SetValue(Utility.GetCurrentGameTime() + FFCydoniaZ04_TimeToPass.GetValue())
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    Self.CheckLocationStages(akOldLoc, akNewLoc, False)
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == SQ_PlayerShip.PlayerShip
    Self.CheckLocationStages(akOldLoc, akNewLoc, True)
  EndIf
EndEvent

Function CheckLocationStages(Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Int I = 0
  While I < ChangeLocationStages.Length
    ffcydoniaz04postersquestscript:changelocationstage changeLocData = ChangeLocationStages[I]
    If changeLocData.TargetLocation
      If changeLocData.Visit02Time == None || GameDaysPassed.GetValue() >= changeLocData.Visit02Time.GetValue()
        Self.CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
      EndIf
    EndIf
    If changeLocData.TargetLocationAlias
      If changeLocData.Visit02Time == None || GameDaysPassed.GetValue() >= changeLocData.Visit02Time.GetValue()
        Location TargetLocation = changeLocData.TargetLocationAlias.GetLocation()
        Self.CheckLocation(TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function CheckLocation(Location TargetLocation, ffcydoniaz04postersquestscript:changelocationstage changeLocData, Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Location locationToCheck = None
  Location otherLocation = None
  If changeLocData.SetStageOnEnterLocation
    locationToCheck = akNewLoc
    otherLocation = akOldLoc
  Else
    locationToCheck = akOldLoc
    otherLocation = akNewLoc
  EndIf
  If TargetLocation == locationToCheck || changeLocData.RequireExactLocation == False && TargetLocation.IsChild(locationToCheck) && TargetLocation.IsChild(otherLocation) == False
    If isPlayerShip == False || changeLocData.CheckPlayerShip
      If Self.GetStageDone(changeLocData.StageToSet) == False && (changeLocData.PrereqStage == -1 || Self.GetStageDone(changeLocData.PrereqStage)) && (changeLocData.TurnOffStageDone == -1 || !Self.GetStageDone(changeLocData.TurnOffStageDone))
        Self.SetStage(changeLocData.StageToSet)
        If changeLocData.RefCollectionAliasToEnable != None
          changeLocData.RefCollectionAliasToEnable.EnableAll(False)
        EndIf
        iStageDoneTotal += 1
        If changeLocData.Visit02Time != None
          changeLocData.Visit02Time.SetValue(Utility.GetCurrentGameTime() + FFCydoniaZ04_TimeToPass.GetValue())
        EndIf
        If iStageDoneTotal == ChangeLocationStages.Length
          Self.SetStage(EndQuestStage)
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction
