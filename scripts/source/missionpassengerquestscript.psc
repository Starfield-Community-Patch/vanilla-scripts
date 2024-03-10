ScriptName MissionPassengerQuestScript Extends MissionQuestScript conditional
{ passenger delivery quest script }

;-- Variables ---------------------------------------
Int startupTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard passengerChangeGuard

;-- Properties --------------------------------------
Group MissionTypeData
  RefCollectionAlias Property SourceCollection Auto Const mandatory
  { collection holding all valid source refs }
  RefCollectionAlias Property Passengers Auto Const mandatory
  { collection holding passengers }
  ReferenceAlias Property PassengerMarker Auto Const mandatory
  { alias holding marker in player's ship where passengers will be created }
  ReferenceAlias Property DestinationMarker Auto Const mandatory
  { alias holding marker where passengers will path to when disembarking }
  ReferenceAlias Property DisembarkMarker Auto Const mandatory
  { alias for finding nearby disembark marker when player lands (for failed missions) }
  LocationAlias Property SourceLocation Auto Const mandatory
  { alias with source location }
  ActorValue Property MissionBoardDisembark Auto Const mandatory
  { flags passengers to run disembark package }
  Message Property MissionBoardPassengerNoSpaceMessage Auto Const mandatory
  { if you don't have space on your ship for these passengers }
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { holds player home ship }
  Keyword Property MissionStoryKeywordPassengerDestination Auto Const mandatory
  { keyword to use to start this quest's passenger destination finder quest }
  Keyword Property LocTypeStarStation Auto Const mandatory
  { for checking for docking }
  Keyword Property LocTypeStarstationExterior Auto Const mandatory
  { keyword to check if you've docked with a starstation }
  Float Property DestinationCheckDistance = 50000.0 Auto Const
  { if UseDistanceCheckForDestinationCheck = true, count as "at destination" if destination marker is within this distance }
  GlobalVariable Property PlayerPassengerSpaceCurrent Auto Const mandatory
  { used for text replacement - needs to be updated when player ship passengers changes }
  GlobalVariable Property PlayerPassengerSpaceTotal Auto Const mandatory
  { used for text replacement }
  Bool Property hasPassengerSpace = False Auto hidden
  { updated by UpdatePlayerPassengerSpace }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestTimerStart(Int aiReason)
  ; Empty function
EndEvent

Function debugQuestTimeRemaining()
  ; Empty function
EndFunction

Event OnQuestStarted()
  Self.StartTimer(0.5, startupTimerID)
EndEvent

Function InitializePassengers()
  Bool foundValidDestination = False
  If DestinationMarker.GetRef()
    foundValidDestination = True
  Else
    missionparentscript:missionlocreftype[] passengerTypes = new missionparentscript:missionlocreftype[MissionParent.passengerTypes.Length]
    Int I = 0
    While I < MissionParent.passengerTypes.Length
      passengerTypes[I] = MissionParent.passengerTypes[I]
      I += 1
    EndWhile
    missiondestinationfinderscript finderQuest = None
    missiondestinationfinderscript[] startedQuests = MissionStoryKeywordPassengerDestination.SendStoryEventAndWait(SourceLocation.GetLocation(), SourceCollection.GetAt(0), None, 0, 0) as missiondestinationfinderscript[]
    If startedQuests.Length > 0
      finderQuest = startedQuests[0]
      While finderQuest.IsStarting()
        
      EndWhile
      foundValidDestination = finderQuest.FindMatchingDestination(passengerTypes, SourceCollection, PrimaryRef, DestinationMarker, TargetLocation)
      TargetSystemLocation.RefillAlias()
      TargetPlanetLocation.RefillAlias()
      DisembarkMarker.ClearAndRefillAlias()
      finderQuest.Stop()
    EndIf
  EndIf
  If foundValidDestination
    missionboardpassengersourcescript passengerTypeRef = PrimaryRef.GetRef() as missionboardpassengersourcescript
    Int passengerCountMax = passengerTypeRef.passengerCountMax
    ObjectReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetRef()
    If PlayerShipRef
      Int currentPassengerSlots = SQ_PlayerShip.GetPassengerSlots(False)
      If currentPassengerSlots < passengerCountMax && currentPassengerSlots >= passengerTypeRef.PassengerCountMin
        passengerCountMax = currentPassengerSlots
      EndIf
    EndIf
    Int passengerCount = Utility.RandomInt(passengerTypeRef.PassengerCountMin, passengerCountMax)
    MissionIntValue01.SetValue(passengerCount as Float)
    Self.UpdateCurrentInstanceGlobal(MissionIntValue01)
    Parent.OnQuestStarted()
  Else
    Self.Stop()
  EndIf
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForPassengerUnloading()
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForPassengerUnloading()
EndFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
  If Self.IsInTargetLocation(akNewLoc)
    Self.CheckForPassengerUnloading()
  EndIf
EndFunction

Function CheckForPassengerUnloading()
  Guard passengerChangeGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If PlayerCompletedQuest == False
      spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
      Location currentShipLocation = PlayerShipRef.GetCurrentLocation()
      If PlayerFailedQuest
        TargetLocation.ForceLocationTo(currentShipLocation)
        DisembarkMarker.ClearAndRefillAlias()
        ObjectReference disembarkRef = DisembarkMarker.GetRef()
        If disembarkRef
          DestinationMarker.ForceRefTo(disembarkRef)
          Self.HandlePassengersDisembark()
        EndIf
      ElseIf PlayerAcceptedQuest
        If Self.IsInTargetLocation(currentShipLocation)
          Self.HandlePassengersDisembark()
        Else
          ObjectReference destinationMarkerRef = DestinationMarker.GetRef()
          If PlayerShipRef.GetDistance(destinationMarkerRef) < DestinationCheckDistance
            Self.HandlePassengersDisembark()
          EndIf
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Bool Function IsInTargetLocation(Location locationToCheck)
  Location theTargetLocation = TargetLocation.GetLocation()
  Bool returnVal = locationToCheck.IsSameLocation(theTargetLocation, None) || locationToCheck.IsSameLocation(theTargetLocation, LocTypeStarStation) || locationToCheck.IsSameLocation(theTargetLocation, LocTypeStarstationExterior)
  Return returnVal
EndFunction

Function HandlePlayerShipTakeOff()
  Passengers.SetValue(MissionBoardDisembark, 0.0)
  Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_AboardShipValue.GetValueInt() as Float)
  Self.CheckForShutdown()
EndFunction

Function HandleOnQuestRejected()
  Self.CheckForPassengerUnloading()
  Parent.HandleOnQuestRejected()
EndFunction

Function UpdatePlayerPassengerSpace()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  If PlayerShipRef
    Int totalPassengerSlots = SQ_PlayerShip.GetPassengerSlots(True)
    Int availablePassengerSlots = SQ_PlayerShip.GetPassengerSlots(False)
    Int usedPassengerSlots = totalPassengerSlots - availablePassengerSlots
    Int newPassengers = MissionIntValue01.GetValueInt()
    hasPassengerSpace = newPassengers <= availablePassengerSlots
    PlayerPassengerSpaceCurrent.SetValue(usedPassengerSlots as Float)
    PlayerPassengerSpaceTotal.SetValue(totalPassengerSlots as Float)
    Self.UpdateCurrentInstanceGlobal(PlayerPassengerSpaceCurrent)
    Self.UpdateCurrentInstanceGlobal(PlayerPassengerSpaceTotal)
  EndIf
EndFunction

Function HandleOnMissionAccepted()
  ObjectReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetRef()
  If PlayerShipRef
    Self.UpdatePlayerPassengerSpace()
    If hasPassengerSpace
      Parent.HandleOnMissionAccepted()
    Else
      MissionBoardPassengerNoSpaceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  Else
    MissionBoardPassengerNoSpaceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    missionboardpassengersourcescript passengerSourceRef = PrimaryRef.GetRef() as missionboardpassengersourcescript
    If passengerSourceRef
      Int newPassengers = MissionIntValue01.GetValueInt()
      passengerSourceRef.CreatePassengers(Passengers, PassengerMarker.GetRef(), newPassengers)
      Self.RegisterForRemoteEvent(Passengers as ScriptObject, "OnExitShipInterior")
      Self.RegisterForRemoteEvent(Passengers as ScriptObject, "OnUnload")
      Self.RegisterForRemoteEvent(Passengers as ScriptObject, "OnDeath")
      If MissionTimeHoursActual as Bool && MissionTimeHoursActual.GetValue() > 0.0
        Self.StartQuestTimer(MissionTimeHoursActual.GetValue())
      EndIf
      SQ_PlayerShip.AddPassengers(Passengers)
      Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_AboardShipValue.GetValueInt() as Float)
    EndIf
  EndIf
  Parent.MissionAccepted(bAccepted)
EndFunction

Function MissionShutdown()
  Self.CheckForShutdown()
EndFunction

Int Function GetActualReward()
  missionboardpassengersourcescript passengerSourceRef = PrimaryRef.GetRef() as missionboardpassengersourcescript
  ActorValue rewardMultAV = MissionParent.MissionRewardMultiplier
  Float reward = (RewardAmountGlobal.GetValue() + (MissionIntValue01.GetValue() * passengerSourceRef.ExtraRewardPerPassenger as Float)) * (1.0 + PrimaryRef.GetRef().GetValue(rewardMultAV))
  Return reward as Int
EndFunction

Function SetActualMissionTime()
  missionboardpassengersourcescript passengerSourceRef = PrimaryRef.GetRef() as missionboardpassengersourcescript
  If passengerSourceRef
    If (MissionTimeHours as Bool && MissionTimeHoursActual as Bool) && MissionTimeHours.GetValue() > 0.0
      MissionTimeHoursActual.SetValue(MissionTimeHours.GetValue() * passengerSourceRef.MissionTimeMult)
    EndIf
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID
    Self.InitializePassengers()
  EndIf
EndEvent

Event OnQuestTimerEnd(Int aiReason)
  If aiReason == 0
    Self.MissionFailed()
  EndIf
EndEvent

Function debugStartQuestTimer(Float questtime)
  If questtime <= 0.0
    Self.StartQuestTimer(-1.0)
  Else
    Self.StartQuestTimer(questtime)
  EndIf
EndFunction

Function HandlePassengersDisembark()
  Passengers.SetValue(MissionBoardDisembark, 1.0)
  Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_DepartingShipValue.GetValueInt() as Float)
  Passengers.EvaluateAll()
  Self.CheckForCompletion()
EndFunction

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSender, ObjectReference akSenderRef)
  If Self.CheckForPassengerDisembark(akSenderRef as Actor)
    akSenderRef.Disable(False)
    Self.CheckForCompletion()
  EndIf
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  Self.MissionFailed()
  Self.CheckForShutdown()
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  If Self.CheckForPassengerDisembark(akSenderRef as Actor)
    Self.CheckForCompletion()
  EndIf
EndEvent

Bool Function CheckForPassengerDisembark(Actor passengerRef)
  Bool disembark = False
  spaceshipreference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
  spaceshipreference passengerShipRef = passengerRef.GetCurrentShipRef()
  If passengerShipRef != PlayerShipRef
    SQ_PlayerShip.RemovePassenger(passengerRef)
    disembark = True
  EndIf
  Return disembark
EndFunction

Function CheckForCompletion()
  spaceshipreference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
  Bool disablePassengersOnShip = False
  If Game.GetPlayer().GetCurrentShipRef() != PlayerShipRef
    disablePassengersOnShip = True
  EndIf
  Int passengerCount = Passengers.GetCount()
  Int disembarkedCount = 0
  Int I = 0
  While I < passengerCount
    Actor passengerRef = Passengers.GetActorAt(I)
    If passengerRef.GetCurrentShipRef() != PlayerShipRef
      disembarkedCount += 1
    ElseIf disablePassengersOnShip
      passengerRef.Disable(False)
      SQ_PlayerShip.RemovePassenger(passengerRef)
      disembarkedCount += 1
    EndIf
    I += 1
  EndWhile
  If disembarkedCount >= passengerCount
    Self.MissionComplete()
  EndIf
  Self.CheckForShutdown()
EndFunction

Function CheckForShutdown()
  Int passengerCount = Passengers.GetCount()
  Int disabledCount = Passengers.GetCountDisabled()
  If disabledCount >= passengerCount
    Self.Stop()
  Else
    Int deadCount = Passengers.GetCountDead()
    If deadCount >= passengerCount
      Self.Stop()
    EndIf
  EndIf
EndFunction

Function MissionFailed()
  Parent.MissionFailed()
  If PlayerFailedQuest
    Passengers.SetValue(MissionParent.RQ_AV_Hello, 0.0)
  EndIf
EndFunction
