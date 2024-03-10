ScriptName City_Neon_Drug02_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
city_neon_druggamescript Property City_Neon_Drug_Game Auto Const mandatory
Location Property CityNeonLegrandesLiquorsLocation Auto Const mandatory
Cell Property CityNeonLegrandesLiquors Auto Const mandatory
Int Property iStageToMoveBayu Auto Const mandatory
Int Property iStageDoneWithBayu Auto Const mandatory
ReferenceAlias Property BenjaminBayu Auto Const mandatory
ReferenceAlias Property BayuFurniture Auto Const mandatory
ReferenceAlias Property LegrandesLoadDoor Auto Const mandatory
ReferenceAlias Property Alias_IngredientHopper Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ActorValue Property Assistance Auto Const mandatory
Int Property maxRefills = 3 Auto Const
{ how many "refills" will player get on retries, per round }

;-- Functions ---------------------------------------

Function ReplayGame()
  City_Neon_Drug_Game.Stop()
  City_Neon_Drug_Game.Reset()
  City_Neon_Drug_Game.Start()
EndFunction

Function AddItemsToHopper()
  ObjectReference hopperRef = Alias_IngredientHopper.GetRef()
  Int I = 0
  While I < City_Neon_Drug_Game.HopperItems.Length
    city_neon_druggamescript:hopperitem theHopperItem = City_Neon_Drug_Game.HopperItems[I]
    hopperRef.AddItem(theHopperItem.hopperIngredient as Form, theHopperItem.countGiven, False)
    I += 1
  EndWhile
EndFunction

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    If Self.GetStageDone(iStageToMoveBayu) && !Self.GetStageDone(iStageDoneWithBayu)
      If akNewLoc == CityNeonLegrandesLiquorsLocation
        Actor BayuRef = BenjaminBayu.GetActorRef()
        BayuRef.MoveTo(BayuFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
        BayuRef.SetValue(Assistance, 0.0)
        ObjectReference DoorRef = LegrandesLoadDoor.GetRef()
        DoorRef.SetFactionOwner(PlayerFaction, False)
        DoorRef.Lock(True, False, True)
        DoorRef.SetLockLevel(254)
        CityNeonLegrandesLiquors.EnableFastTravel(False)
      EndIf
      If akOldLoc == CityNeonLegrandesLiquorsLocation
        Self.ReleasePlayer()
      EndIf
    EndIf
  EndIf
EndEvent

Function ReleasePlayer()
  ObjectReference DoorRef = LegrandesLoadDoor.GetRef()
  DoorRef.Lock(False, False, True)
  DoorRef.SetFactionOwner(None, False)
  CityNeonLegrandesLiquors.EnableFastTravel(True)
  BenjaminBayu.GetActorRef().SetValue(Assistance, 1.0)
EndFunction
