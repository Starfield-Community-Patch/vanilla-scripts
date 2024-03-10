ScriptName MissionCargoQuestScript Extends MissionCargoParentScript conditional
{ cargo delivery quest script }

;-- Variables ---------------------------------------
Int startupTimerID = 1 Const

;-- Properties --------------------------------------
Group CargoMissionData
  sq_parentscript Property SQ_Parent Auto Const
  { optional - to get contraband confiscated events }
  RefCollectionAlias Property SourceCollection Auto Const mandatory
  { collection holding all valid source refs }
  ReferenceAlias Property DestinationCargo Auto Const mandatory
  { alias holding cargo destination ref - counterpart to what is in PrimaryRef alias }
  RefCollectionAlias Property CargoCollection Auto Const mandatory
  { alias holding cargo items }
  LocationAlias Property CargoSourceLocation Auto Const mandatory
  { alias with source location }
  Message Property MissionBoardCargoNoSpaceMessage Auto Const mandatory
  { if you don't have space on your ship for this cargo }
  Message Property MissionBoardContrabandWarningAcceptMessage Auto Const mandatory
  { accept message to use if you don't have enough shielded space on your ship for this contraband cargo }
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { for now holds player ship }
  Keyword Property MissionStoryKeywordCargoDestination Auto Const mandatory
  { keyword to use to start this quest's cargo destination finder quest }
  GlobalVariable Property MissionBoardCargoValueMult Auto Const mandatory
  { multiplier on cargo value reward }
  Bool Property Contraband = False Auto Const
  { set to TRUE if this mission involves contraband - if TRUE, accept will warn player if their ship doesn't have enough shielded cargo space for this cargo }
  Int Property CargoItems = 5 Auto hidden
  { Number of cargo items created for this mission - set in GetActualReward() }
  Bool Property PickOnlyCargoThatWillFit = False Auto Const
  { by default, will pick randomly from all cargo - some of which may be too heavy for player's current ship 
	  set this to TRUE to pick only form cargo that can fit in the player's current ship }
  Float Property DestinationCheckDistance = 50000.0 Auto Const
  { if UseDistanceCheckForDestinationCheck = true, count as "at destination" if destination marker is within this distance }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestTimerStart(Int aiReason)
  ; Empty function
EndEvent

Event OnQuestStarted()
  Self.StartTimer(0.5, startupTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID
    Self.InitializeCargo()
  EndIf
EndEvent

Function InitializeCargo()
  Bool foundValidDestination = False
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  missionparentscript:missionlocreftype[] cargoTypes = new missionparentscript:missionlocreftype[0]
  If PlayerShipRef
    Float cargoSpaceTotal = PlayerShipRef.GetShipMaxCargoWeight()
    Int I = 0
    While I < SourceCollection.GetCount()
      missionboardcargocontainerscript sourceRef = SourceCollection.GetAt(I) as missionboardcargocontainerscript
      If sourceRef
        MiscObject theCargoMiscObject = sourceRef.CargoMiscObject
        Float cargoWeightBase = theCargoMiscObject.GetWeight()
        Float minCargoWeight = cargoWeightBase * sourceRef.CargoWeightMultMin as Float
        If PickOnlyCargoThatWillFit == False || minCargoWeight <= cargoSpaceTotal
          Int cargoTypeIndex = MissionParent.cargoTypes.findstruct("CargoSourceBase", sourceRef.GetBaseObject(), 0)
          If cargoTypeIndex > -1
            missionparentscript:missionlocreftype theCargoType = MissionParent.cargoTypes[cargoTypeIndex]
            cargoTypes.add(theCargoType, 1)
          EndIf
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
  If cargoTypes.Length > 0
    missiondestinationfinderscript finderQuest = None
    missiondestinationfinderscript[] startedQuests = MissionStoryKeywordCargoDestination.SendStoryEventAndWait(CargoSourceLocation.GetLocation(), SourceCollection.GetAt(0), None, 0, 0) as missiondestinationfinderscript[]
    If startedQuests.Length > 0
      finderQuest = startedQuests[0]
      While finderQuest.IsStarting()
        
      EndWhile
      foundValidDestination = finderQuest.FindMatchingDestination(cargoTypes, SourceCollection, PrimaryRef, DestinationCargo, TargetLocation)
      TargetSystemLocation.RefillAlias()
      TargetPlanetLocation.RefillAlias()
      finderQuest.Stop()
    EndIf
    If foundValidDestination
      Parent.OnQuestStarted()
    Else
      Self.Stop()
    EndIf
  Else
    Self.Stop()
  EndIf
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForCargoUnloading()
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForCargoUnloading()
EndFunction

Function CheckForCargoUnloading()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  Location currentShipLocation = PlayerShipRef.GetCurrentLocation()
  If PlayerAcceptedQuest as Bool && PlayerFailedQuest == False
    If currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), None) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarStation) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarstationExterior)
      Self.MissionComplete()
    Else
      ObjectReference destinationMarkerRef = DestinationCargo.GetRef()
      If PlayerShipRef.GetDistance(destinationMarkerRef) < DestinationCheckDistance
        Self.MissionComplete()
      EndIf
    EndIf
  EndIf
EndFunction

missionboardcargocontainerscript Function GetCargoContainer()
  Return PrimaryRef.GetRef() as missionboardcargocontainerscript
EndFunction

Function HandleOnMissionAccepted()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  If PlayerShipRef
    missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript
    If cargoContainerRef
      Self.UpdatePlayerCargoSpace()
      If hasCargoSpace
        If Contraband && hasShieldedCargoSpace == False
          If MissionBoardContrabandWarningAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
            Self.MissionAccepted(True)
          Else
            Self.MissionAccepted(False)
          EndIf
        ElseIf MissionParent.MissionBoardAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
          Self.MissionAccepted(True)
        Else
          Self.MissionAccepted(False)
        EndIf
      EndIf
    EndIf
  EndIf
  If hasCargoSpace == False
    MissionBoardCargoNoSpaceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted)
  If bAccepted
    spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
    If PlayerShipRef
      missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript
      If cargoContainerRef
        PlayerShipRef.AddAliasedItem(cargoContainerRef.CargoMiscObject as Form, CargoCollection as Alias, CargoItems, True)
      EndIf
      If Contraband && SQ_Parent as Bool
        Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_ContrabandConfiscated")
      EndIf
    EndIf
    MissionParent.UpdateMissions()
  EndIf
EndFunction

Function MissionComplete()
  Self.UnloadCargo()
  Parent.MissionComplete()
EndFunction

Int Function GetActualReward()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer()
  Float rewardBase = RewardAmountGlobal.GetValue()
  Float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight()
  CargoItems = Utility.RandomInt(cargoContainerRef.CargoWeightMultMin, cargoContainerRef.CargoWeightMultMax)
  Float cargoWeight = cargoWeightBase * CargoItems as Float
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  If PlayerShipRef
    Float cargoSpaceMax = PlayerShipRef.GetShipMaxCargoWeight() - PlayerShipRef.GetWeightInContainer()
    If cargoSpaceMax < cargoWeight
      Int minWeight = cargoContainerRef.CargoWeightMultMin * cargoWeightBase as Int
      If minWeight as Float < cargoSpaceMax
        Int maxCount = (cargoSpaceMax / cargoWeightBase) as Int
        CargoItems = Utility.RandomInt(cargoContainerRef.CargoWeightMultMin, maxCount)
      EndIf
    EndIf
  EndIf
  cargoWeight = cargoWeightBase * CargoItems as Float
  MissionIntValue01.SetValue((cargoWeight as Int) as Float)
  Float cargoValue = (cargoContainerRef.CargoMiscObject.GetGoldValue() * CargoItems) as Float
  ActorValue rewardMultAV = MissionParent.MissionRewardMultiplier
  Float valueMult = MissionBoardCargoValueMult.GetValue()
  Float sourceMult = 1.0 + PrimaryRef.GetRef().GetValue(rewardMultAV)
  Float destMult = 1.0 + DestinationCargo.GetRef().GetValue(rewardMultAV)
  Float reward = rewardBase + cargoValue * valueMult * sourceMult * destMult
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01)
  Return reward as Int
EndFunction

Function MissionFailed()
  If PlayerCompletedQuest == False
    Self.UnloadCargo()
    Parent.MissionFailed()
  EndIf
EndFunction

Function UnloadCargo()
  Self.UnregisterForRemoteEvent(CargoCollection as ScriptObject, "OnContainerChanged")
  ObjectReference PlayerShipRef = PlayerShip.GetRef()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer()
  Int I = CargoCollection.GetCount() - 1
  While I > -1
    ObjectReference cargoRef = CargoCollection.GetAt(I)
    PlayerShipRef.RemoveItem(cargoRef as Form, 1, False, None)
    I += -1
  EndWhile
EndFunction

Event OnQuestTimerEnd(Int aiReason)
  If aiReason == 0
    Self.MissionFailed()
  EndIf
EndEvent

Event SQ_ParentScript.SQ_ContrabandConfiscated(sq_parentscript akSource, Var[] akArgs)
  Self.MissionFailed()
EndEvent

Function testShipCargoSpace()
  ObjectReference PlayerShipRef = PlayerShip.GetRef()
  Self.TestWeightInContainer(PlayerShipRef)
EndFunction

Function TestWeightInContainer(ObjectReference testRef)
  spaceshipreference ShipRef = testRef as spaceshipreference
  If ShipRef
    Float shipcarryweight = ShipRef.GetWeightInContainer()
    Float shipweight = testRef.GetWeightInContainer()
  EndIf
EndFunction
