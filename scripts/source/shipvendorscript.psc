ScriptName ShipVendorScript Extends Actor conditional

;-- Variables ---------------------------------------
shipvendorlistscript:shiptosell[] ShipsToSellAlways
shipvendorlistscript:shiptosell[] ShipsToSellRandom
shipvendorlistscript:shiptosell[] ShipsToSellUnique
Bool initialized = False
Float lastInventoryRefreshTimestamp
spaceshipreference[] shipsForSale

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard shipsForSaleGuard

;-- Properties --------------------------------------
Keyword Property LinkShipLandingMarker01 Auto Const mandatory
{ link vendor to landing marker }
Keyword Property SpaceshipStoredLink Auto Const mandatory
{ link ships to landing marker }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ The main Player Ship system quest }
Location Property ShipVendorLocation Auto Const
{ OPTIONAL - The location used to spawn vendor ships at for leveling purposes.
    If not filled in, script will use vendor's current location }
shipvendorlistscript Property ShipsToSellListRandomDataset Auto Const
{ The data set for random ships to sell. }
shipvendorlistscript Property ShipsToSellListAlwaysDataset Auto Const
{ The data set for ships that should always be available for sale. }
shipvendorlistscript Property ShipsToSellListUniqueDataset Auto Const
{ The data set for unique ships to make available for sale. (Never respawns) }
Int Property ShipsForSaleMin = 4 Auto Const
{ NOTE: if these are 0, the only ships for sale will be from ShipsToSellListAlwaysDataset }
Int Property ShipsForSaleMax = 8 Auto Const
ObjectReference Property myLandingMarker Auto hidden
{ landing marker, set by OnInit }
RefCollectionAlias Property PlayerShips Auto Const mandatory
{ from SQ_Playership - need to know when player sells ships }
Float Property DaysUntilInventoryRefresh = 7.0 Auto Const
{ how many days until next inventory refresh? }
Bool Property BuysShips = True Auto conditional
Bool Property SellsShips = True Auto conditional
Bool Property InitializeOnLoad = True Auto Const
{ if false, Initialize() needs to be called manually (e.g. for outpost ship vendor) }

;-- Functions ---------------------------------------

Function TestLinkedRefChildren(ObjectReference refToCheck, Keyword theKeyword)
  ; Empty function
EndFunction

Event OnLoad()
  Self.HandleOnLoad()
EndEvent

Function Initialize(ObjectReference landingMarkerRef)
  If initialized == False
    ShipsToSellRandom = Self.CopyShipToSellArray(ShipsToSellListRandomDataset.ShipList)
    ShipsToSellAlways = Self.CopyShipToSellArray(ShipsToSellListAlwaysDataset.ShipList)
    ShipsToSellUnique = Self.CopyShipToSellArray(ShipsToSellListUniqueDataset.ShipList)
    Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      myLandingMarker = landingMarkerRef
      shipsForSale = new spaceshipreference[0]
      initialized = True
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    Self.CheckForInventoryRefresh(False)
  EndIf
EndFunction

shipvendorlistscript:shiptosell[] Function CopyShipToSellArray(shipvendorlistscript:shiptosell[] arrayToCopy)
  shipvendorlistscript:shiptosell[] myShipsToSell = new shipvendorlistscript:shiptosell[arrayToCopy.Length]
  Int I = 0
  While I < arrayToCopy.Length
    myShipsToSell[I] = arrayToCopy[I]
    I += 1
  EndWhile
  Return myShipsToSell
EndFunction

Function HandleOnLoad()
  Self.RegisterForRemoteEvent(PlayerShips as ScriptObject, "OnShipSold")
  If initialized == False && InitializeOnLoad
    myLandingMarker = Self.GetLinkedRef(LinkShipLandingMarker01)
    Self.Initialize(myLandingMarker)
  EndIf
  If initialized
    Self.CheckForInventoryRefresh(False)
  EndIf
EndFunction

Event RefCollectionAlias.OnShipSold(RefCollectionAlias akSender, ObjectReference akSenderRef)
  spaceshipreference soldShip = akSenderRef as spaceshipreference
  If soldShip as Bool && soldShip.GetLinkedRef(SpaceshipStoredLink) == myLandingMarker
    Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      shipsForSale.add(soldShip, 1)
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Event SpaceshipReference.OnShipBought(spaceshipreference akSenderRef)
  Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int shipsForSaleIndex = shipsForSale.find(akSenderRef, 0)
    If shipsForSaleIndex > -1
      shipsForSale.remove(shipsForSaleIndex, 1)
      If ShipsToSellUnique.Length > 0
        leveledspaceshipbase soldLeveledSpaceshipBase = akSenderRef.GetBaseObject() as leveledspaceshipbase
        Int uniqueIndex = ShipsToSellUnique.findstruct("leveledShip", soldLeveledSpaceshipBase, 0)
        If uniqueIndex > -1
          ShipsToSellUnique.remove(uniqueIndex, 1)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function CheckForInventoryRefresh(Bool bForceRefresh)
  If SellsShips
    Float currentGameTime = Utility.GetCurrentGameTime()
    Float nextRefreshTime = lastInventoryRefreshTimestamp + DaysUntilInventoryRefresh
    If bForceRefresh || lastInventoryRefreshTimestamp == 0.0 || currentGameTime >= nextRefreshTime
      Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
        Self.RefreshInventoryList(myLandingMarker, shipsForSale)
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    EndIf
  EndIf
EndFunction

Function RefreshInventoryList(ObjectReference createMarker, spaceshipreference[] ShipList)
  If createMarker
    Actor playerRef = Game.GetPlayer()
    Int playerLevel = playerRef.GetLevel()
    Int i = ShipList.Length - 1
    While i > -1
      spaceshipreference theShip = ShipList[i]
      theShip.Delete()
      i += -1
    EndWhile
    ShipList.clear()
    Int totalShipsToCreateCount = Utility.RandomInt(ShipsForSaleMin, ShipsForSaleMax)
    Int nonRandomShipsToCreateCount = ShipsToSellAlways.Length + ShipsToSellUnique.Length
    If totalShipsToCreateCount < nonRandomShipsToCreateCount
      totalShipsToCreateCount = nonRandomShipsToCreateCount
    EndIf
    Int randomShipsToCreateCount = totalShipsToCreateCount - nonRandomShipsToCreateCount
    Self.CreateShipsForSale(ShipsToSellAlways, playerLevel, createMarker, ShipList)
    If randomShipsToCreateCount > 0
      shipvendorlistscript:shiptosell[] currentShipsRandom = new shipvendorlistscript:shiptosell[0]
      Int currentShipsRandomIndex = 0
      While currentShipsRandomIndex < ShipsToSellRandom.Length
        shipvendorlistscript:shiptosell theShipToSell = ShipsToSellRandom[currentShipsRandomIndex]
        If theShipToSell.minLevel <= playerLevel && ShipsToSellAlways.findstruct("leveledShip", theShipToSell.leveledShip, 0) == -1 && ShipsToSellUnique.findstruct("leveledShip", theShipToSell.leveledShip, 0) == -1
          currentShipsRandom.add(ShipsToSellRandom[currentShipsRandomIndex], 1)
        EndIf
        currentShipsRandomIndex += 1
      EndWhile
      i = 0
      While i < randomShipsToCreateCount && currentShipsRandom.Length > 0
        Int randomIndex = Utility.RandomInt(0, currentShipsRandom.Length - 1)
        Self.CreateShipForSale(currentShipsRandom[randomIndex].leveledShip, createMarker, ShipList)
        currentShipsRandom.remove(randomIndex, 1)
        i += 1
      EndWhile
    EndIf
    Self.CreateShipsForSale(ShipsToSellUnique, playerLevel, createMarker, ShipList)
    lastInventoryRefreshTimestamp = Utility.GetCurrentGameTime()
  EndIf
  Int I = 0
  While I < ShipList.Length
    I += 1
  EndWhile
EndFunction

Function CreateShipsForSale(shipvendorlistscript:shiptosell[] shipToSellList, Int playerLevel, ObjectReference createMarker, spaceshipreference[] ShipList)
  Int I = 0
  If shipToSellList.Length > 0
    While I < shipToSellList.Length
      shipvendorlistscript:shiptosell theShipToSell = shipToSellList[I]
      If playerLevel >= theShipToSell.minLevel
        Self.CreateShipForSale(theShipToSell.leveledShip, createMarker, ShipList)
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Function CreateShipForSale(leveledspaceshipbase leveledShipToCreate, ObjectReference landingMarker, spaceshipreference[] ShipList)
  ObjectReference createMarker = landingMarker
  spaceshipreference landingMarkerShipRef = landingMarker.GetCurrentShipRef()
  If landingMarkerShipRef
    createMarker = landingMarkerShipRef as ObjectReference
  EndIf
  Location encounterLocation = ShipVendorLocation
  If encounterLocation == None
    encounterLocation = Self.GetCurrentLocation()
  EndIf
  spaceshipreference newShip = createMarker.PlaceShipAtMe(leveledShipToCreate as Form, 2, True, False, True, True, None, None, encounterLocation, True)
  If newShip
    ShipList.add(newShip, 1)
    newShip.SetLinkedRef(landingMarker, SpaceshipStoredLink, True)
    newShip.SetActorRefOwner(Self as Actor, False)
    Self.RegisterForRemoteEvent(newShip as ScriptObject, "OnShipBought")
    newShip.RemoveAllItems(None, False, False)
  EndIf
EndFunction

spaceshipreference Function GetShipForSale(Int index)
  spaceshipreference shipforSale = None
  Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If shipsForSale.Length > 0
      If index > -1 && index < shipsForSale.Length
        shipforSale = shipsForSale[index]
      ElseIf index >= shipsForSale.Length
        shipforSale = shipsForSale[shipsForSale.Length - 1]
      Else
        shipforSale = shipsForSale[0]
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Return shipforSale
EndFunction

Function TestShowHangarMenu()
  myLandingMarker.ShowHangarMenu(0, Self as Actor, None, False)
EndFunction

Function TestOutputShipsForSale()
  Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int I = 0
    While I < shipsForSale.Length
      spaceshipreference theShip = shipsForSale[I]
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
