ScriptName LC082_VigilanceQuestScript Extends Quest
{ Quest script for LC082. Manages the Vigilance's movement. }

;-- Structs -----------------------------------------
Struct VigilanceLocationDatum
  String LocationName
  LocationAlias SpaceLocation
  Location ReserveOrbitLocation
  Cell SpaceCell
  ReferenceAlias EnableMarker
  ReferenceAlias MapMarker
  ReferenceAlias MoveToMarker
  ReferenceAlias TrafficManagerMarker
  Int StageToSet
EndStruct


;-- Variables ---------------------------------------
Int CONST_AILevelMod_Hard = 2 Const
Int CONST_Brig_ReleasedPrisonerStageToSet = 210 Const
Int CONST_DockingPermission_Neutral = 0
Int CONST_DockingPermission_Never = 4 Const
Int CONST_Global_SysDefShutdownTriggered = 1 Const
Int CONST_LC082_SysDefFail = 250 Const
Int CONST_LC082_SysDefFail_StartKickoutScene = 251 Const
Int CONST_LC088_CFMainBattleStart = 160 Const
Int CONST_LC088_SDMainBattleStart = 260 Const
spaceshipreference VigilanceShipRef
ObjectReference currentEnableMarkerRef
String currentLocationName
ObjectReference currentMoveToMarkerRef
Cell currentSpaceCell
Location currentSpaceLoc
Int currentStageToSet
ObjectReference currentTrafficManagerMarker
Int newLocationIndex = -1
ObjectReference pilotSeatRef
Location vigilanceInteriorLoc
Bool waitingForPlayerToSit

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard LocationDataGuard

;-- Properties --------------------------------------
Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  LocationAlias Property VigilanceInteriorLocation Auto Const mandatory
  LocationAlias Property VigilanceReservedOrbitLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property VigilanceShip Auto Const mandatory
  ReferenceAlias Property PilotSeat Auto Const mandatory
  RefCollectionAlias Property VigilanceMainActors Auto Const mandatory
  RefCollectionAlias Property VigilanceMainActors_Protected Auto Const mandatory
  RefCollectionAlias Property VigilanceMainTurrets Auto Const mandatory
  spaceshipbase Property DEBUG_PlayerShipCF Auto Const mandatory
  Keyword Property LC082_VigilanceTravelTargetKeyword Auto Const mandatory
  Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory
  GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
  ActorValue Property DockingPermission Auto Const mandatory
  ActorValue Property ShieldHealth Auto Const mandatory
  ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
  FormList Property LC088_Space_QuickstartCrewList Auto Const mandatory
  ObjectReference Property VigilanceMarkerRef Auto Const mandatory
  ObjectReference Property scDebugStartOriginMarker Auto Const mandatory
  Message Property LC082_PilotSeatNotAuthorizedMessage Auto Const mandatory
  Quest Property LC088_Space Auto Const mandatory
  Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
  Potion Property ShipRepairKit Auto Const mandatory
EndGroup

lc082_vigilancequestscript:vigilancelocationdatum[] Property VigilanceLocationData Auto Const mandatory
{ List of locations the Vigilance will be, ordered from the first to the last. }

;-- Functions ---------------------------------------

Event OnQuestInit()
  VigilanceShipRef = VigilanceShip.GetShipRef()
  vigilanceInteriorLoc = VigilanceInteriorLocation.GetLocation()
  pilotSeatRef = PilotSeat.GetRef()
  pilotSeatRef.BlockActivation(True, False)
  Self.RegisterForRemoteEvent(pilotSeatRef as ScriptObject, "OnActivate")
EndEvent

Function UpdateVigilanceLocation(String proposedLocationName)
  Self.Start()
  Guard LocationDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If currentLocationName == proposedLocationName
      
    ElseIf currentLocationName == "Shutdown"
      
    Else
      If newLocationIndex >= 0
        
      EndIf
      newLocationIndex = VigilanceLocationData.findstruct("LocationName", proposedLocationName, 0)
      If newLocationIndex < 0
        
      Else
        Self.Private_UpdateVigilanceLocation()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function DEBUG_ForceUpdateVigilanceLocation(String proposedLocationName)
  Self.Start()
  Guard LocationDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    newLocationIndex = VigilanceLocationData.findstruct("LocationName", proposedLocationName, 0)
    Self.Private_UpdateVigilanceLocation()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Private_UpdateVigilanceLocation()
  If Game.GetPlayer().GetCurrentLocation() == vigilanceInteriorLoc || PlayerShip.GetShipRef() != None && PlayerShip.GetShipRef().GetCurrentLocation() == currentSpaceLoc
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  ElseIf VigilanceLocationData[newLocationIndex].LocationName == "Shutdown"
    If LC088_Space.GetStageDone(CONST_LC088_CFMainBattleStart) || LC088_Space.GetStageDone(CONST_LC088_SDMainBattleStart)
      
    Else
      currentLocationName = "Shutdown"
      currentSpaceLoc = None
      currentSpaceCell = None
      currentEnableMarkerRef.DisableNoWait(False)
      currentTrafficManagerMarker.DisableNoWait(False)
      currentEnableMarkerRef = None
      currentMoveToMarkerRef = None
      currentTrafficManagerMarker = None
      VigilanceShipRef.DisableNoWait(False)
      VigilanceReservedOrbitLocation.Clear()
    EndIf
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  ElseIf newLocationIndex == -1
    
  Else
    lc082_vigilancequestscript:vigilancelocationdatum newDatum = VigilanceLocationData[newLocationIndex]
    newLocationIndex = -1
    Location newLoc = newDatum.SpaceLocation.GetLocation()
    If currentSpaceLoc != None
      currentEnableMarkerRef.Disable(False)
      currentTrafficManagerMarker.Disable(False)
    EndIf
    currentLocationName = newDatum.LocationName
    currentSpaceLoc = newLoc
    currentSpaceCell = newDatum.SpaceCell
    currentEnableMarkerRef = newDatum.EnableMarker.GetRef()
    currentMoveToMarkerRef = newDatum.MoveToMarker.GetRef()
    currentTrafficManagerMarker = newDatum.TrafficManagerMarker.GetRef()
    currentStageToSet = newDatum.StageToSet
    VigilanceShipRef.Disable(False)
    VigilanceShipRef.SetLinkedRef(currentMoveToMarkerRef, LC082_VigilanceTravelTargetKeyword, True)
    VigilanceShipRef.MoveTo(currentMoveToMarkerRef, 0.0, 0.0, 0.0, True, False)
    VigilanceShipRef.EvaluatePackage(True)
    VigilanceShipRef.Enable(False)
    ObjectReference mapMarkerHeadingRef = newDatum.MapMarker.GetRef().GetLinkedRef(None)
    If mapMarkerHeadingRef != None
      VigilanceMarkerRef.MoveTo(mapMarkerHeadingRef, 0.0, 0.0, 0.0, True, False)
    EndIf
    currentEnableMarkerRef.EnableNoWait(False)
    currentTrafficManagerMarker.EnableNoWait(False)
    VigilanceReservedOrbitLocation.ForceLocationTo(newDatum.ReserveOrbitLocation)
    If currentStageToSet
      Self.SetStage(currentStageToSet)
    EndIf
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  EndIf
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  If akSource == Game.GetPlayer() && akNewLoc != vigilanceInteriorLoc && akNewLoc != currentSpaceLoc
    Guard LocationDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      Self.Private_UpdateVigilanceLocation()
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Function SetEscortShipsEnabled(Bool shouldBeEnabled)
  If currentEnableMarkerRef != None
    If shouldBeEnabled
      currentEnableMarkerRef.EnableNoWait(False)
    Else
      currentEnableMarkerRef.DisableNoWait(False)
    EndIf
  EndIf
EndFunction

Function ActivateTurrets()
  Actor[] vigilanceTurrets = VigilanceMainTurrets.GetArray() as Actor[]
  Int I = 0
  While I < vigilanceTurrets.Length
    vigilanceTurrets[I].SetUnconscious(False)
    I += 1
  EndWhile
EndFunction

Function SetAllowDockingWithVigilance(Bool shouldAllowDocking)
  If shouldAllowDocking
    VigilanceShipRef.SetValue(DockingPermission, CONST_DockingPermission_Neutral as Float)
  Else
    VigilanceShipRef.SetValue(DockingPermission, CONST_DockingPermission_Never as Float)
  EndIf
EndFunction

Function TryToStartKickoutScene()
  Self.SetAllowDockingWithVigilance(False)
  If Game.GetPlayer().GetCurrentLocation() == vigilanceInteriorLoc || PlayerShip.GetShipRef().IsDocked()
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock")
  ElseIf PlayerShip.GetShipRef().GetCurrentLocation() == currentSpaceLoc
    Self.SetStage(CONST_LC082_SysDefFail_StartKickoutScene)
  EndIf
EndFunction

Event ReferenceAlias.OnShipUndock(ReferenceAlias akShip, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If abComplete && akShip == PlayerShip && Self.GetStageDone(CONST_LC082_SysDefFail)
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock")
    Self.SetStage(CONST_LC082_SysDefFail_StartKickoutScene)
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  If akSource == pilotSeatRef && (akActivator == Game.GetPlayer() as ObjectReference)
    LC082_PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Function ProtectVigilanceMainActors(Bool shouldBeProtected)
  If shouldBeProtected
    VigilanceMainActors_Protected.AddRefCollection(VigilanceMainActors)
    Int I = 0
    Int count = VigilanceMainActors_Protected.GetCount()
    While I < count
      VigilanceMainActors_Protected.GetAt(I).IgnoreFriendlyHits(True)
      I += 1
    EndWhile
  Else
    Int i = 0
    Int count = VigilanceMainActors_Protected.GetCount()
    While i < count
      VigilanceMainActors_Protected.GetAt(i).IgnoreFriendlyHits(False)
      i += 1
    EndWhile
    VigilanceMainActors_Protected.RemoveAll()
  EndIf
EndFunction

Function DEBUG_SetupVigilanceCombatDemo()
  Self.DEBUG_GoToSpaceAndWait()
  Self.UpdateVigilanceLocation("DEBUG_CombatDemo")
  VigilanceShipRef.RemovePerk(LC088_Space_VigilanceDamageImmunityPerk)
  VigilanceShipRef.RemoveKeyword(DisallowAsCombatTargetKeyword)
  VigilanceShipRef.DamageValue(ShieldHealth, 100000.0)
  VigilanceShipRef.DamageValue(ShipSystemShieldsHealth, 100000.0)
  VigilanceShipRef.SetValue(Game.GetAggressionAV(), 1.0)
  VigilanceShipRef.RemoveFromAllFactions()
  Self.SetStage(210)
  PlayerShip.GetShipRef().MoveTo(VigilanceMarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DEBUG_SetupBatteryCombatDemo()
  Self.DEBUG_GoToSpaceAndWait()
  PlayerShip.GetShipRef().MoveTo(VigilanceMarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DEBUG_GoToSpaceAndWait()
  inputenablelayer myEnableLayer = inputenablelayer.Create()
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  spaceshipreference testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipCF as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True)
  SQ_PlayerShip.ResetPlayerShip(testShip)
  SQ_PlayerShip.ResetHomeShip(testShip)
  testShip.AddItem(ShipRepairKit as Form, 20, False)
  Game.GetPlayer().MoveTo(testShip as ObjectReference, 0.0, 0.0, 0.0, True, False)
  SQ_PlayerShip.HandleShipTakeOff(True, False)
  PlayerShipPilotSeat.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
  myEnableLayer.Delete()
  waitingForPlayerToSit = True
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit")
  While waitingForPlayerToSit
    Utility.Wait(0.5)
  EndWhile
  SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, testShip)
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False
EndEvent
