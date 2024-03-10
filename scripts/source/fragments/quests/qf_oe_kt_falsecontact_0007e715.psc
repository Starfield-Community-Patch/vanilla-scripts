ScriptName Fragments:Quests:QF_OE_KT_FalseContact_0007E715 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property OE_Credit_ExtortionMedium Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Smuggler Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_ShipContainer Auto Const mandatory
GlobalVariable Property OE_FalseContact_Global Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property OE_ShipOwnerFaction Auto Const mandatory
RefCollectionAlias Property Alias_Smugglers Auto Const mandatory
ReferenceAlias Property Alias_ShipA_CaptainFurniture Auto Const mandatory
ReferenceAlias Property Alias_ShipA_CaptainMarker Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingC Auto Const mandatory
Furniture Property NPCStanding_DataSlate Auto Const mandatory
GlobalVariable Property RQ_Hello_Calm_PostAcceptValue Auto Const mandatory
ActorValue Property RQ_AV_Hello Auto Const mandatory
GlobalVariable Property RQ_Hello_Calm_PreAcceptValue Auto Const mandatory
RefCollectionAlias Property Alias_CrewName Auto Const mandatory
ReferenceAlias Property Alias_NPC_Crew01 Auto Const mandatory
ReferenceAlias Property Alias_Marker_SceneB02 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Crew02 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  ObjectReference FurnitureRef = Alias_ShipA_CaptainMarker.GetRef().PlaceAtMe(NPCStanding_DataSlate as Form, 1, False, False, True, None, None, True)
  Actor SmugglerRef = Alias_NPC_Smuggler.GetActorRef()
  Alias_ShipA_CaptainFurniture.ForceRefTo(FurnitureRef)
  SmugglerRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Int RQValue = RQ_Hello_Calm_PostAcceptValue.GetValueInt()
  Alias_Smugglers.SetValue(RQ_AV_Hello, RQValue as Float)
  ObjectReference[] SmugRef = Alias_Smugglers.GetArray()
  Int I = 0
  While I < SmugRef.Length
    Alias_CrewName.AddRef(SmugRef[I])
    I += 1
  EndWhile
  Alias_Smugglers.SetValue(RQ_AV_Hello, RQValue as Float)
  Actor Captain = Alias_NPC_Smuggler.GetActorRef()
  Alias_Smugglers.AddRef(Captain as ObjectReference)
  Alias_Smugglers.AddRef(Alias_NPC_Crew01.GetRef())
  Alias_Smugglers.AddRef(Alias_NPC_Crew02.GetRef())
  Captain.SetValue(RQ_AV_Hello, 0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Actor SmugglerRef = Alias_NPC_Smuggler.GetActorRef()
  SmugglerRef.RemovefromFaction(REPlayerFriend)
  SmugglerRef.AddtoFaction(PlayerEnemyFaction)
  SmugglerRef.SetValue(Aggression, 1.0)
  SmugglerRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  Alias_Smugglers.RemovefromFaction(REPlayerFriend)
  Alias_Smugglers.AddtoFaction(PlayerEnemyFaction)
  Alias_Smugglers.SetValue(Aggression, 1.0)
  Alias_Smugglers.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_MapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Alias_ShipA.RefillDependentAliases()
  Self.setstage(80)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  ObjectReference MarkerB = Alias_Marker_ShipLandingB.GetRef()
  ObjectReference MarkerC = Alias_Marker_ShipLandingC.GetRef()
  If Alias_Marker_ShipLandingA.GetRef().IsFurnitureInUse(False) && MarkerB != None && !MarkerB.IsFurnitureInUse(False)
    Alias_Marker_ShipLandingA.ForceRefTo(MarkerB)
  ElseIf Alias_Marker_ShipLandingA.GetRef().IsFurnitureInUse(False) && MarkerB.IsFurnitureInUse(False) && MarkerC != None && !MarkerC.IsFurnitureInUse(False)
    Alias_Marker_ShipLandingA.ForceRefTo(MarkerC)
  EndIf
  kmyQuest.LandShip(-1)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False)
  OE_FalseContact_Global.SetValue(1.0)
  Int RQValue = RQ_Hello_Calm_PostAcceptValue.GetValueInt()
  Alias_NPC_Smuggler.GetActorRef().SetValue(RQ_AV_Hello, RQValue as Float)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(True)
  Utility.Wait(10.0)
  kmyQuest.LaunchShip(0, None, False)
  If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword)
    Alias_MapMarker.TryToDisable()
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
