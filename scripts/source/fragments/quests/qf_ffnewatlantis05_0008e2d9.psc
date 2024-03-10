ScriptName Fragments:Quests:QF_FFNewAtlantis05_0008E2D9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SmugglerShip Auto Const mandatory
RefCollectionAlias Property Alias_ShipCrew Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Book Property FFNewAtlantis05_Slate Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
GlobalVariable Property FFNewAtlantis05_Global Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
GlobalVariable Property FFNewAtlantis05_Credits_Small Auto Const mandatory
GlobalVariable Property FFNewAtlantis05_Credits_Medium Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Contraband Auto Const mandatory
ReferenceAlias Property Alias_Chest Auto Const mandatory
MiscObject Property FFNewAtlantis05_MissionCargoTypeContraband Auto Const mandatory
Scene Property FFNewAtlantis05_TL_Captain_Greet Auto Const mandatory
Quest Property FFNewAtlantis06 Auto Const mandatory
ReferenceAlias Property Alias_SpawnMarker Auto Const mandatory
Scene Property FFNewAtlantis05_070_Move_Captain Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory
ReferenceAlias Property Alias_Crew01 Auto Const mandatory
ReferenceAlias Property Alias_Crew02 Auto Const mandatory
Faction Property FFNewAtlantis05_LandingFactionShip Auto Const mandatory
ReferenceAlias Property Alias_landingMarker Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
LocationAlias Property Alias_ShipInterior Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Alias_landingMarker.GetRef().SetFactionOwner(None, False)
  Alias_SmugglerShip.GetRef().DisableNoWait(False)
  Alias_ShipCrew.DisableAll(False)
  Self.SetObjectiveCompleted(2, False)
  Self.SetObjectiveDisplayed(2, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetObjectiveCompleted(3, True)
  If Self.GetStageDone(30)
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_00()
  Actor[] ShipCrewRef = Alias_ShipCrew.GetActorArray()
  Int I = 0
  While I < ShipCrewRef.Length
    ShipCrewRef[I].IgnoreFriendlyHits(False)
    ShipCrewRef[I].SetEssential(False)
    I += 1
  EndWhile
  Alias_ShipCrew.RemovefromFaction(PlayerFriendFaction)
  Alias_ShipCrew.AddtoFaction(PlayerEnemyFaction)
  Alias_ShipCrew.SetValue(Aggression, 1.0)
  Alias_ShipCrew.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Self.SetObjectiveSkipped(70)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  FFNewAtlantis05_Global.SetValue(2.0)
EndFunction

Function Fragment_Stage_0007_Item_00()
  FFNewAtlantis05_Global.SetValue(1.0)
EndFunction

Function Fragment_Stage_0008_Item_00()
  FFNewAtlantis05_Global.SetValue(3.0)
EndFunction

Function Fragment_Stage_0009_Item_00()
  FFNewAtlantis05_Global.SetValue(4.0)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetObjectiveSkipped(60)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Game.GetPlayer().AddItem(Credits as Form, FFNewAtlantis05_Credits_Small.GetValueInt(), False)
  Game.GetPlayer().RemoveItem(FFNewAtlantis05_MissionCargoTypeContraband as Form, 1, False, None)
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetObjectiveSkipped(60)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
  Game.GetPlayer().AddItem(Credits as Form, FFNewAtlantis05_Credits_Medium.GetValueInt(), False)
  Game.GetPlayer().RemoveItem(FFNewAtlantis05_MissionCargoTypeContraband as Form, 1, False, None)
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetObjectiveSkipped(70)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Game.GetPlayer().AddItem(Alias_Contraband.GetRef() as Form, 1, False)
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetObjectiveCompleted(60, True)
  FFNewAtlantis05_TL_Captain_Greet.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  FFNewAtlantis02Misc.SetStage(40)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If !Self.GetStageDone(45)
    Self.SetObjectiveDisplayed(40, True, False)
  ElseIf Self.GetStageDone(3)
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_landingMarker.GetRef().SetFactionOwner(FFNewAtlantis05_LandingFactionShip, False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(3, True, False)
  Game.GetPlayer().AddAliasedItem(FFNewAtlantis05_Slate as Form, Alias_Slate as Alias, 1, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_SmugglerShip.TryToEnable()
  Alias_SmugglerShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
  ObjectReference CaptainRef = Alias_Captain.GetRef()
  Cell AnansiRef = CaptainRef.GetParentCell()
  AnansiRef.SetFactionOwner(EclipticFaction)
  AnansiRef.SetPublic(True)
  Alias_ShipCrew.AddRef(CaptainRef)
  Alias_ShipCrew.AddRef(Alias_Crew01.GetRef())
  Alias_ShipCrew.AddRef(Alias_Crew02.GetRef())
  Alias_ShipCrew.EnableAll(False)
  Self.SetObjectiveCompleted(2, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Alias_Chest.GetRef().SetFactionOwner(PlayerFaction, False)
  Alias_Contraband.GetRef().SetFactionOwner(PlayerFaction, False)
EndFunction

Function Fragment_Stage_0060_Item_01()
  Self.SetObjectiveCompleted(50, True)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveDisplayed(70, True, False)
  Game.GetPlayer().AddItem(Alias_Contraband.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Contraband.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  FFNewAtlantis06.Start()
  Alias_landingMarker.GetRef().SetFactionOwner(None, False)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Self.CompleteAllObjectives()
  Self.SetStage(2)
  FFNewAtlantis06.Start()
  Alias_landingMarker.GetRef().SetFactionOwner(None, False)
  Self.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop()
EndFunction
