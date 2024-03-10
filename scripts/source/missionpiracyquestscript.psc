ScriptName MissionPiracyQuestScript Extends MissionCargoParentScript conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group PiracyMissionData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  ReferenceAlias Property CargoTargetRef Auto Const mandatory
  { alias holding cargo marker ref - used for text replacement and getting cargo data }
  RefCollectionAlias Property CargoCollection Auto Const mandatory
  { alias holding cargo items }
  Int Property CargoWeightMultMin = 3 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoWeightMultMax = 20 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoItems = 5 Auto hidden
  { Number of cargo items created for this mission - set in GetActualReward() }
  Message Property MissionBoardPiracyWarningAcceptMessage Auto Const mandatory
  { if you don't have space on your ship for this cargo }
  Int Property PlayerHasPiratedStage = 35 Auto
  { if this stage is done, the player has pirated/attacked the target ship }
  Int Property PlayerHasCargoStage = 40 Auto
  { if this stage is done, the player has the cargo }
  Keyword Property ObjectTypeMissionCargo Auto Const mandatory
  { keyword for what to watch for being removed from target ship }
  GlobalVariable Property MissionBoardPiracy_EscortChance Auto Const mandatory
  { percent chance that escorts appear on this mission }
  RefCollectionAlias Property Escorts Auto Const
  { optional - holds escorts to randomly enable }
  GlobalVariable Property MissionBoardCargoValueMult Auto Const mandatory
  { multiplier on cargo value reward }
EndGroup


;-- Functions ---------------------------------------

Function HandleOnMissionAccepted()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  If PlayerShipRef
    missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer()
    If cargoContainerRef
      Self.UpdatePlayerCargoSpace()
      If hasCargoSpace == False
        If MissionBoardPiracyWarningAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
          Self.MissionAccepted(True)
        Else
          Self.MissionAccepted(False)
        EndIf
      Else
        Parent.HandleOnMissionAccepted()
      EndIf
    EndIf
  EndIf
EndFunction

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted)
  If bAccepted
    spaceshipreference cargoShipRef = PrimaryRef.GetShipRef()
    Int I = 0
    While I < CargoCollection.GetCount()
      ObjectReference cargoRef = CargoCollection.GetAt(I)
      cargoShipRef.AddItem(cargoRef as Form, 1, False)
      I += 1
    EndWhile
    cargoShipRef.RemoveItem(Self.GetCargoContainer() as Form, 1, False, None)
    Self.RegisterForRemoteEvent(PrimaryRef as ScriptObject, "OnItemRemoved")
    Self.AddInventoryEventFilter(ObjectTypeMissionCargo as Form)
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PiracyEvent")
    Actor PlayerREF = Game.GetPlayer()
    Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnHomeShipSet")
    If Game.GetDieRollSuccess(MissionBoardPiracy_EscortChance.GetValueInt(), 1, 100, -1, -1)
      If Escorts as Bool && Escorts.GetCount() > 0
        Int numToEnable = Utility.RandomInt(1, Escorts.GetCount())
        If numToEnable > 0
          I = 0
          While I < numToEnable
            spaceshipreference escortRef = Escorts.GetShipAt(I)
            If escortRef
              escortRef.Enable(False)
            EndIf
            I += 1
          EndWhile
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForCargoUnloading()
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForCargoUnloading()
EndFunction

Function CheckForCargoUnloading()
  Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation()
  If (PlayerAcceptedQuest as Bool && PlayerFailedQuest == False) && Self.GetStageDone(PlayerHasCargoStage) && (currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), None) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarStation) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarstationExterior))
    Self.MissionComplete()
  EndIf
EndFunction

Function MissionComplete()
  ObjectReference PlayerShipRef = PlayerShip.GetRef()
  Self.RemoveCargo()
  Parent.MissionComplete()
EndFunction

Function MissionFailed()
  Self.RemoveCargo()
  Parent.MissionFailed()
EndFunction

Function RemoveCargo()
  Int I = CargoCollection.GetCount() - 1
  While I > -1
    ObjectReference cargoRef = CargoCollection.GetAt(I)
    ObjectReference cargoContainerRef = cargoRef.GetContainer()
    CargoCollection.RemoveRef(cargoRef)
    cargoContainerRef.RemoveItem(cargoRef as Form, 1, False, None)
    I += -1
  EndWhile
EndFunction

missionboardcargocontainerscript Function GetCargoContainer()
  Return CargoTargetRef.GetRef() as missionboardcargocontainerscript
EndFunction

Int Function GetActualReward()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer()
  spaceshipreference cargoShipRef = PrimaryRef.GetShipRef()
  Float rewardBase = RewardAmountGlobal.GetValue()
  Float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight()
  CargoItems = Utility.RandomInt(CargoWeightMultMin, CargoWeightMultMax)
  Float cargoWeight = cargoWeightBase * CargoItems as Float
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef()
  If PlayerShipRef
    Float cargoSpaceMax = PlayerShipRef.GetValue(MissionParent.CarryWeight) - PlayerShipRef.GetWeightInContainer()
    If cargoSpaceMax < cargoWeight
      Int minWeight = CargoWeightMultMin * cargoWeightBase as Int
      Int maxCount = (cargoSpaceMax / cargoWeightBase) as Int
      maxCount = Math.Max(maxCount as Float, CargoWeightMultMin as Float) as Int
      CargoItems = Utility.RandomInt(CargoWeightMultMin, maxCount)
    EndIf
  EndIf
  cargoWeight = cargoWeightBase * CargoItems as Float
  Self.InitializeCargo()
  MissionIntValue01.SetValue((cargoWeight as Int) as Float)
  Float cargoValue = (cargoContainerRef.CargoMiscObject.GetGoldValue() * CargoItems) as Float
  Float valueMult = MissionBoardCargoValueMult.GetValue()
  Float cargoValueReward = cargoValue * valueMult
  Float reward = rewardBase + cargoValueReward
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01)
  Return reward as Int
EndFunction

Function InitializeCargo()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer()
  spaceshipreference cargoShipRef = PrimaryRef.GetShipRef()
  If cargoContainerRef as Bool && cargoShipRef as Bool
    cargoShipRef.AddAliasedItem(cargoContainerRef.CargoMiscObject as Form, CargoCollection as Alias, CargoItems, True)
  Else
    Self.Stop()
  EndIf
EndFunction

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSender, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  If akSender == PrimaryRef
    spaceshipreference cargoShipRef = PrimaryRef.GetShipRef()
    If cargoShipRef.GetItemCount(ObjectTypeMissionCargo as Form) == 0
      Self.SetStage(PlayerHasCargoStage)
      Self.RemoveAllInventoryEventFilters()
    EndIf
  EndIf
EndEvent

Event SQ_ParentScript.SQ_PiracyEvent(sq_parentscript akSource, Var[] akArgs)
  spaceshipreference piratedShip = akArgs[0] as spaceshipreference
  spaceshipreference targetShip = PrimaryRef.GetShipRef()
  If piratedShip == targetShip && PlayerFailedQuest == False
    Self.SetStage(PlayerHasPiratedStage)
  EndIf
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, spaceshipreference akShip, spaceshipreference akPrevious)
  spaceshipreference targetShip = PrimaryRef.GetShipRef()
  If akShip == targetShip
    Self.SetStage(PlayerHasCargoStage)
    Self.RemoveAllInventoryEventFilters()
  EndIf
EndEvent
