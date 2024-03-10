ScriptName Fragments:Quests:QF_SG02_001E7332 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SG02_0100_DistressCall Auto Const mandatory
ReferenceAlias Property Alias_AlbanLopez Auto Const mandatory
ReferenceAlias Property Alias_AlbanMarker Auto Const mandatory
Scene Property SG02_0300_FixedAlbanSatellite Auto Const mandatory
ReferenceAlias Property Alias_WenSatellite Auto Const mandatory
ReferenceAlias Property Alias_LemaireSatellite Auto Const mandatory
ReferenceAlias Property Alias_BandaSatellite Auto Const mandatory
ReferenceAlias Property Alias_AlbanSatellite Auto Const mandatory
Scene Property SG02_0400_FixedLemaireSatellite Auto Const mandatory
Scene Property SG02_0500_FixedBandaSatellite Auto Const mandatory
Scene Property SG02_0600_FixedWenSatellite Auto Const mandatory
ReferenceAlias Property Alias_LemaireCaptainMarker Auto Const mandatory
ReferenceAlias Property Alias_ChandaBanda Auto Const mandatory
ReferenceAlias Property Alias_JacquelynLemaire Auto Const mandatory
Scene Property SG02_0775_ApproachOverhear Auto Const mandatory
RefCollectionAlias Property Alias_Spacers01 Auto Const mandatory
RefCollectionAlias Property Alias_Spacers02 Auto Const mandatory
RefCollectionAlias Property Alias_SpacerContact01Group Auto Const mandatory
RefCollectionAlias Property Alias_SpacerContact02Group Auto Const mandatory
ReferenceAlias Property Alias_ChandaMarker Auto Const mandatory
ReferenceAlias Property Alias_JackieMarker Auto Const mandatory
Keyword Property SG02FamilyShipMeetupKeyword Auto Const mandatory
RefCollectionAlias Property Alias_Spacers01_Allies Auto Const mandatory
RefCollectionAlias Property Alias_Spacers02_Allies Auto Const mandatory
LocationRefType Property AutofillGeneric03 Auto Const mandatory
RefCollectionAlias Property Alias_SpacersStation_Allies Auto Const mandatory
LocationRefType Property AutofillGeneric04 Auto Const mandatory
RefCollectionAlias Property Alias_SpacersStation Auto Const mandatory
Keyword Property SG02FinaleKeyword Auto Const mandatory
Scene Property SG02_1210_JackieBark Auto Const mandatory
Scene Property SG02_1500a_ChandaJackieConflict Auto Const mandatory
LocationAlias Property Alias_AlbanFarmLocation Auto Const mandatory
RefCollectionAlias Property Alias_AlbanSatelliteEnemies Auto Const mandatory
RefCollectionAlias Property Alias_BandaSatelliteEnemies Auto Const mandatory
RefCollectionAlias Property Alias_LemaireSatelliteEnemies Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Alban Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Banda Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Lemaire Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Wen Auto Const mandatory
ReferenceAlias Property Alias_MapMarker_Rendezvous Auto Const mandatory
ReferenceAlias Property Alias_SpacersStation_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Spacers02_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Spacers01_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_LemaireShip Auto Const mandatory
ReferenceAlias Property Alias_LemaireShipMarker Auto Const mandatory
ReferenceAlias Property Alias_Starstation Auto Const mandatory
ReferenceAlias Property Alias_StarstationPlacementMarker Auto Const mandatory
ActorValue Property SG02_ForeknowledgeAV Auto Const mandatory
Scene Property SG02_Reaction_1175_Reinforcements Auto Const mandatory
Scene Property SG02_Reaction_1200_StationShipsKilled Auto Const mandatory
Scene Property SG02_Reaction_1010_Spacers01Killed Auto Const mandatory
Scene Property SG02_Reaction_1020_Spacers02Killed Auto Const mandatory
Quest Property SG02_AlbanFarmDialogue Auto Const mandatory
Quest Property SG02_AlbanFarm Auto Const mandatory
ReferenceAlias Property Alias_LemaireStationMarker Auto Const mandatory
ReferenceAlias Property Alias_BandaStationMarker Auto Const mandatory
ReferenceAlias Property Alias_AlbanStationMarker Auto Const mandatory
Keyword Property LinkCustom09 Auto Const mandatory
wwiseevent Property QST_SG02_SatelliteRepair Auto Const mandatory
RefCollectionAlias Property Alias_StationNPCs_Settlers Auto Const mandatory
Faction Property SG02_PlayerAllyFaction Auto Const mandatory
ReferenceAlias Property Alias_AlbanInitialMarker Auto Const mandatory
RefCollectionAlias Property Alias_StationSpacers_Group02 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
RefCollectionAlias Property Alias_InteriorEnemiesUpperFloor Auto Const mandatory
ReferenceAlias Property Alias_AlbanFightMarker Auto Const mandatory
ReferenceAlias Property Alias_BandaFightMarker Auto Const mandatory
ReferenceAlias Property Alias_JackieFightMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1210_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor AlACT = Alias_AlbanLopez.GetActorRef()
  ObjectReference AlMarker = Alias_AlbanInitialMarker.GetRef()
  AlACT.MoveTo(AlMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(100)
  Alias_Spacers01_MapMarker.GetRef().Disable(False)
  Alias_Spacers02_MapMarker.GetRef().Disable(False)
  Alias_SpacersStation_MapMarker.GetRef().Disable(False)
  Alias_SatelliteMapMarker_Alban.GetRef().Disable(False)
  Alias_SatelliteMapMarker_Banda.GetRef().Disable(False)
  Alias_SatelliteMapMarker_Lemaire.GetRef().Disable(False)
  Alias_SatelliteMapMarker_Wen.GetRef().Disable(False)
  Alias_MapMarker_Rendezvous.GetRef().Disable(False)
  Alias_LemaireShip.GetRef().MoveTo(Alias_LemaireShipMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  SG02_AlbanFarmDialogue.Start()
  SG02_AlbanFarm.Start()
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_WenSatellite.RefillAlias()
  Alias_AlbanMarker.RefillAlias()
  Alias_ChandaMarker.RefillAlias()
  Alias_JackieMarker.RefillAlias()
EndFunction

Function Fragment_Stage_0003_Item_00()
  Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  SG02_0775_ApproachOverhear.Stop()
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(1000)
  Game.GetPlayer().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  SG02_0100_DistressCall.Start()
  Alias_AlbanFarmLocation.GetLocation().SetExplored(True)
EndFunction

Function Fragment_Stage_0125_Item_00()
  SG02_0100_DistressCall.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_BandaSatellite.RefillAlias()
  Alias_LemaireSatellite.RefillAlias()
  Alias_WenSatellite.RefillAlias()
  Alias_AlbanSatellite.RefillAlias()
  Alias_AlbanSatelliteEnemies.EnableAll(False)
  Alias_BandaSatelliteEnemies.EnableAll(False)
  Alias_SatelliteMapMarker_Alban.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Self.SetObjectiveDisplayed(500, True, False)
  Self.SetObjectiveDisplayed(600, True, False)
  Alias_AlbanSatellite.GetRef().ClearDestruction()
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_AlbanSatellite.GetRef().BlockActivation(True, False)
  SG02_0300_FixedAlbanSatellite.Start()
  Alias_SatelliteMapMarker_Banda.GetRef().Enable(False)
  Alias_SatelliteMapMarker_Lemaire.GetRef().Enable(False)
  Alias_SatelliteMapMarker_Wen.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  SG02_0500_FixedBandaSatellite.Stop()
  SG02_0600_FixedWenSatellite.Stop()
  Self.SetObjectiveCompleted(400, True)
  Alias_LemaireSatellite.GetRef().ClearDestruction()
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_LemaireSatellite.GetRef().BlockActivation(True, False)
  If Self.GetStageDone(500) && Self.GetStageDone(600)
    Self.SetStage(700)
  EndIf
  SG02_0400_FixedLemaireSatellite.Start()
EndFunction

Function Fragment_Stage_0425_Item_00()
  Int I = 0
  While I < Alias_LemaireSatelliteEnemies.GetCount()
    ObjectReference theRef = Alias_LemaireSatelliteEnemies.GetAt(I)
    If theRef
      (theRef as spaceshipreference).EnableWithGravJump()
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0500_Item_00()
  SG02_0400_FixedLemaireSatellite.Stop()
  SG02_0600_FixedWenSatellite.Stop()
  Self.SetObjectiveCompleted(500, True)
  Alias_BandaSatellite.GetRef().ClearDestruction()
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_BandaSatellite.GetRef().BlockActivation(True, False)
  If Self.GetStageDone(400) && Self.GetStageDone(600)
    Self.SetStage(700)
  EndIf
  SG02_0500_FixedBandaSatellite.Start()
EndFunction

Function Fragment_Stage_0600_Item_00()
  SG02_0400_FixedLemaireSatellite.Stop()
  SG02_0500_FixedBandaSatellite.Stop()
  Self.SetObjectiveCompleted(600, True)
  Alias_WenSatellite.GetRef().ClearDestruction()
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_WenSatellite.GetRef().BlockActivation(True, False)
  If Self.GetStageDone(400) && Self.GetStageDone(500)
    Self.SetStage(700)
  EndIf
  SG02_0600_FixedWenSatellite.Start()
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False)
  ObjectReference oTarg = Alias_AlbanLopez.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword), 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_ChandaBanda.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword), 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_JacquelynLemaire.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword), 0.0, 0.0, 0.0, True, False)
  Alias_MapMarker_Rendezvous.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0775_Item_00()
  SG02_0775_ApproachOverhear.Start()
  Self.SetObjectiveDisplayed(780, True, False)
  Self.SetObjectiveDisplayed(700, False, False)
EndFunction

Function Fragment_Stage_0780_Item_00()
  Self.SetObjectiveCompleted(780, True)
  Self.SetObjectiveDisplayed(700, True, False)
  Alias_ChandaBanda.GetActorRef().EvaluatePackage(False)
  Alias_JacquelynLemaire.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Actor ChandaACT = Alias_ChandaBanda.GetActorRef()
  Actor JackyACT = Alias_JacquelynLemaire.GetActorRef()
  ChandaACT.EvaluatePackage(False)
  JackyACT.EvaluatePackage(False)
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Self.SetObjectiveDisplayed(850, True, False)
EndFunction

Function Fragment_Stage_0825_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(875, True, False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(850, True)
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !Self.GetStageDone(850)
    Self.SetObjectiveDisplayed(850, False, False)
  EndIf
  Self.SetObjectiveCompleted(875, True)
  Self.SetObjectiveDisplayed(900, True, False)
  Self.SetObjectiveDisplayed(950, True, False)
  Alias_SpacerContact01Group.RefillAlias()
  Alias_Spacers01.RefillAlias()
  Alias_SpacerContact02Group.RefillAlias()
  Alias_Spacers02.RefillAlias()
  Alias_Spacers01_MapMarker.GetRef().Enable(False)
  Alias_Spacers02_MapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0910_Item_00()
  Self.SetObjectiveFailed(850, True)
EndFunction

Function Fragment_Stage_0930_Item_00()
  Self.SetStage(850)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_ChandaBanda.GetRef().MoveTo(Alias_ChandaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(850)
    Alias_JacquelynLemaire.GetRef().MoveTo(Alias_JackieMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1005_Item_00()
  Int I = 0
  If !Self.GetStageDone(950)
    I = 99
  EndIf
  Bool bLemaire = Self.GetStageDone(850)
  While I < Alias_Spacers01_Allies.GetCount()
    spaceshipreference theRef = Alias_Spacers01_Allies.GetAt(I) as spaceshipreference
    If theRef
      If bLemaire || !theRef.HasLocRefType(AutofillGeneric03)
        theRef.EnableWithGravJump()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1010_Item_00()
  Self.SetObjectiveCompleted(900, True)
  If Self.GetStageDone(1020)
    Self.SetStage(1000)
  EndIf
  If Self.GetStageDone(950) && Alias_Spacers01_Allies.GetCount() > 0
    SG02_Reaction_1010_Spacers01Killed.Start()
  EndIf
EndFunction

Function Fragment_Stage_1015_Item_00()
  Int I = 0
  If !Self.GetStageDone(950)
    I = 99
  EndIf
  Bool bLemaire = Self.GetStageDone(850)
  While I < Alias_Spacers02_Allies.GetCount()
    spaceshipreference theRef = Alias_Spacers02_Allies.GetAt(I) as spaceshipreference
    If theRef
      If bLemaire || !theRef.HasLocRefType(AutofillGeneric03)
        theRef.EnableWithGravJump()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1020_Item_00()
  Self.SetObjectiveCompleted(950, True)
  If Self.GetStageDone(1010)
    Self.SetStage(1000)
  EndIf
  If Self.GetStageDone(950) && Alias_Spacers02_Allies.GetCount() > 0
    SG02_Reaction_1020_Spacers02Killed.Start()
  EndIf
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
  (Alias_Starstation.GetRef() as spaceshipreference).SetValue(DockingPermission, 4.0)
  Alias_SpacersStation_MapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1150_Item_00()
  Int I = 0
  Bool bLemaire = Self.GetStageDone(850)
  Bool bNoReserves = Self.GetStageDone(950)
  Bool bEnable = False
  While I < Alias_SpacersStation_Allies.GetCount()
    spaceshipreference theRef = Alias_SpacersStation_Allies.GetAt(I) as spaceshipreference
    If theRef
      bEnable = True
      If !bLemaire && theRef.HasLocRefType(AutofillGeneric03)
        bEnable = False
      EndIf
      If bNoReserves && theRef.HasLocRefType(AutofillGeneric04)
        bEnable = False
      EndIf
      If bEnable
        theRef.EnableWithGravJump()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1175_Item_00()
  SG02_Reaction_1175_Reinforcements.Start()
  Int I = 0
  While I <= Alias_StationSpacers_Group02.GetCount()
    spaceshipreference theRef = Alias_SpacersStation.GetAt(I) as spaceshipreference
    If theRef
      If !theRef.IsEnabled()
        theRef.EnableWithGravJump()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
  SG02_Reaction_1200_StationShipsKilled.Start()
  Actor oTarg = Alias_AlbanLopez.GetActorRef()
  oTarg.MoveTo(Alias_AlbanFightMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_ChandaBanda.GetActorRef()
  oTarg.MoveTo(Alias_BandaFightMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  oTarg.IgnoreFriendlyHits(True)
  oTarg = Alias_AlbanLopez.GetActorRef()
  oTarg.IgnoreFriendlyHits(True)
  If Self.GetStageDone(850)
    oTarg = Alias_JacquelynLemaire.GetActorRef()
    oTarg.MoveTo(Alias_JackieFightMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
    oTarg.IgnoreFriendlyHits(True)
  EndIf
  Int I = 0
  Int iCount = Alias_StationNPCs_Settlers.GetCount()
  While I < iCount
    Actor currAct = Alias_StationNPCs_Settlers.GetAt(I) as Actor
    currAct.IgnoreFriendlyHits(True)
    I += 1
  EndWhile
  Game.GetPlayer().AddtoFaction(SG02_PlayerAllyFaction)
  (Alias_Starstation.GetRef() as spaceshipreference).SetValue(DockingPermission, 0.0)
EndFunction

Function Fragment_Stage_1220_Item_00()
  Self.SetStage(1240)
EndFunction

Function Fragment_Stage_1230_Item_00()
  Self.SetStage(1240)
  Self.SetObjectiveDisplayed(1250, True, False)
  Alias_AlbanLopez.GetActorRef().SetEssential(False)
EndFunction

Function Fragment_Stage_1240_Item_00()
  Self.SetObjectiveCompleted(1210, True)
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetObjectiveCompleted(1250, True)
EndFunction

Function Fragment_Stage_1300_Item_00()
  Game.GetPlayer().RemoveFromFaction(SG02_PlayerAllyFaction)
  Self.SetObjectiveCompleted(1200, True)
  If Self.GetStageDone(1250)
    Self.SetObjectiveDisplayed(1500, True, False)
  Else
    Self.SetObjectiveDisplayed(1400, True, False)
  EndIf
  If Self.GetStageDone(1230) && !Self.GetStageDone(1250)
    Alias_AlbanLopez.GetActorRef().SetEssential(True)
    Self.SetObjectiveDisplayed(1250, False, False)
  EndIf
  ObjectReference oTarg = Alias_AlbanLopez.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09), 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_ChandaBanda.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09), 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(850)
    oTarg = Alias_JacquelynLemaire.GetRef()
    oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.CompleteAllObjectives()
  SG02_1500a_ChandaJackieConflict.Start()
EndFunction

Function Fragment_Stage_9000_Item_00()
  If Self.GetStageDone(1400)
    Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
  Game.GetPlayer().SetValue(SG02_ForeknowledgeAV, 1.0)
  Self.Stop()
EndFunction
