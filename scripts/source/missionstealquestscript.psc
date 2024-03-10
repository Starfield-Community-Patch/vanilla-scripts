ScriptName MissionStealQuestScript Extends MissionQuestScript conditional

;-- Variables ---------------------------------------
Int startupTimerID = 1 Const

;-- Properties --------------------------------------
Group StealMissionData
  ReferenceAlias Property TargetContainer Auto Const mandatory
  { alias where cargo items will be placed }
  RefCollectionAlias Property StealItemCollection Auto Const mandatory
  { alias holding cargo items }
  LocationAlias Property ReturnLocation Auto Const mandatory
  { location where items need to be delivered to }
  Int Property StealItemsStage = 50 Auto Const
  { stage set when player steals the target items }
  Int Property CargoItemCountMin = 1 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoItemCountMax = 10 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoItems = 5 Auto hidden
  { Number of cargo items created for this mission - set in GetActualReward() }
  Keyword Property LocTypeStarStation Auto Const mandatory
  { for checking for docking }
  Keyword Property LocTypeStarstationExterior Auto Const mandatory
  { keyword to check if you've docked with a starstation }
  GlobalVariable Property MissionBoardCargoValueMult Auto Const mandatory
  { multiplier on cargo value reward }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.StartTimer(0.5, startupTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID
    Self.InitializeCargo()
  EndIf
EndEvent

Int Function GetActualReward()
  missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript
  Float rewardBase = RewardAmountGlobal.GetValue()
  Float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight()
  Float cargoWeight = cargoWeightBase * CargoItems as Float
  MissionIntValue01.SetValue((cargoWeight as Int) as Float)
  Float cargoValue = (cargoContainerRef.CargoMiscObject.GetGoldValue() * CargoItems) as Float
  Float valueMult = MissionBoardCargoValueMult.GetValue()
  Float cargoValueReward = cargoValue * valueMult
  Float reward = rewardBase + cargoValueReward
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01)
  Return reward as Int
EndFunction

Function InitializeCargo()
  missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript
  ObjectReference targetContainerRef = TargetContainer.GetRef()
  If cargoContainerRef as Bool && targetContainerRef as Bool
    CargoItems = Utility.RandomInt(CargoItemCountMin, CargoItemCountMax)
    targetContainerRef.AddAliasedItem(cargoContainerRef.CargoMiscObject as Form, StealItemCollection as Alias, CargoItems, True)
    Parent.OnQuestStarted()
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
  If Self.GetStageDone(StealItemsStage)
    Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation()
    If (PlayerAcceptedQuest as Bool && PlayerFailedQuest == False) && (currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), None) || currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), LocTypeStarStation) || currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), LocTypeStarstationExterior))
      Self.MissionComplete()
    EndIf
  EndIf
EndFunction

Function MissionComplete()
  ObjectReference PlayerShipRef = PlayerShip.GetRef()
  Actor playerRef = Game.GetPlayer()
  Int I = StealItemCollection.GetCount() - 1
  While I > -1
    ObjectReference cargoRef = StealItemCollection.GetAt(I)
    StealItemCollection.RemoveRef(cargoRef)
    PlayerShipRef.RemoveItem(cargoRef as Form, 1, False, None)
    playerRef.RemoveItem(cargoRef as Form, 1, False, None)
    I += -1
  EndWhile
  Parent.MissionComplete()
EndFunction

Function MissionFailed()
  Self.RemoveCargo()
  Parent.MissionFailed()
EndFunction

Function RemoveCargo()
  Int I = StealItemCollection.GetCount() - 1
  While I > -1
    ObjectReference cargoRef = StealItemCollection.GetAt(I)
    ObjectReference cargoContainerRef = cargoRef.GetContainer()
    StealItemCollection.RemoveRef(cargoRef)
    cargoContainerRef.RemoveItem(cargoRef as Form, 1, False, None)
    I += -1
  EndWhile
EndFunction
