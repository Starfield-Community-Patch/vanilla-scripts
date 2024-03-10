ScriptName Fragments:Quests:QF_BQ01_Barrett_Quest Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_companionsscript Property SQ_Companions Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
Perk Property StarbornPerk Auto Const mandatory
GlobalVariable Property SmallCredits Auto Const mandatory
GlobalVariable Property MediumCredits Auto Const mandatory
GlobalVariable Property LargeCredits Auto Const mandatory
LocationAlias Property Alias_Location_GagarinSettlement Auto Const mandatory
ReferenceAlias Property Alias_Trigger_Gagarin_LandingPad Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_Exterior_Player Auto Const mandatory
ReferenceAlias Property Alias_Door_ErvinApartment_Exterior Auto Const mandatory
ReferenceAlias Property Alias_Marker_ErvinApartment_Interior Auto Const mandatory
ReferenceAlias Property Alias_Safe_ErvinApartment Auto Const mandatory
Scene Property Scene_GoToErvinApartment Auto Const mandatory
Scene Property Scene_ApartmentExterior Auto Const mandatory
Scene Property Scene_EnteredApartment Auto Const mandatory
Scene Property Scene_NearSafe Auto Const mandatory
Scene Property Scene_NearTerminal Auto Const mandatory
Scene Property Scene_OpenSafe Auto Const mandatory
Scene Property Scene_PlayerFoundContract Auto Const mandatory
Scene Property Scene_FoundLicense Auto Const mandatory
Scene Property Scene_MyKey Auto Const mandatory
Scene Property Scene_BarrettUsesKey Auto Const mandatory
Scene Property Scene_ErvinApartmentEntrance Auto Const mandatory
Key Property Key_ErvinsApartment Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
Scene Property Scene_TownHallArrival Auto Const mandatory
Scene Property Scene_TownHall_FoundLicense Auto Const mandatory
ReferenceAlias Property Alias_Terminal_TownHall Auto Const mandatory
ReferenceAlias Property Alias_Marker_Gagarin_LawOfficeInterior Auto Const mandatory
ReferenceAlias Property Alias_goto_LawOffice_Barrett Auto Const mandatory
ReferenceAlias Property Alias_goto_LawOffice Auto Const mandatory
Scene Property Scene_NearLawOffice Auto Const mandatory
Scene Property Scene_Vignette_HelloEllie Auto Const mandatory
Scene Property Scene_Vignette_ReturnedFromMine Auto Const mandatory
Key Property Key_Employee Auto Const mandatory
Key Property Key_ErvinFoundry Auto Const mandatory
Scene Property Scene_GoToFoundry Auto Const mandatory
Scene Property Scene_TryYourAccount Auto Const mandatory
Scene Property Scene_FoundryCyberRunner Auto Const mandatory
Scene Property Scene_FoundryTheftTrack Auto Const mandatory
Scene Property Scene_FoundryGeologyTrack Auto Const mandatory
Scene Property Scene_AccessedPlayerAccount Auto Const mandatory
Scene Property Scene_AccessedErvinAccount Auto Const mandatory
Scene Property Scene_TheftTrack Auto Const mandatory
Scene Property Scene_AccessPlayerAccount Auto Const mandatory
Scene Property Scene_FoundryErvinTrack Auto Const mandatory
Scene Property Scene_FoundryNormalTrack Auto Const mandatory
Scene Property Scene_FoundryEmployeeTrack Auto Const mandatory
Scene Property Scene_FoundryTrackCyberRunner Auto Const mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_FoundryKey Auto Const mandatory
ReferenceAlias Property Alias_Marker_GoTo_Foundry Auto Const mandatory
ReferenceAlias Property Alias_Terminal_Mine_Lab_ErvinStation Auto Const mandatory
ReferenceAlias Property Alias_Terminal_Mine_Cave_HelgiStation Auto Const mandatory
Scene Property Scene_Mine_Comment01_LandingPad Auto Const mandatory
Scene Property Scene_Mine_Comment02_Exterior Auto Const mandatory
Scene Property Scene_Mine_Comment03_Interior Auto Const mandatory
Scene Property Scene_Mine_Comment04_Office Auto Const mandatory
Scene Property Scene_Cave_Comment01_NearElevator Auto Const mandatory
Scene Property Scene_Cave_Comment02_Entrance Auto Const mandatory
Scene Property Scene_Cave_Comment03_Eggs Auto Const mandatory
Scene Property Scene_Cave_Comment04_Tunnels Auto Const mandatory
Scene Property Scene_Cave_Comment05_HelgiLab Auto Const mandatory
Scene Property Scene_Cave_Comment06_Nest Auto Const mandatory
Scene Property Scene_FoundEvidence_Helgi Auto Const mandatory
Scene Property Scene_FoundEvidence_Ervin Auto Const mandatory
Scene Property Scene_FoundEvidence_Admin Auto Const mandatory
Scene Property Scene_DalitsoEndConvo Auto Const mandatory
ReferenceAlias Property Alias_Actor_Helgi Auto Const mandatory
ReferenceAlias Property Alias_Marker_HoldingCell Auto Const mandatory
ReferenceAlias Property Alias_Marker_Spawn_Helgi Auto Const mandatory
Scene Property Scene_ErvinDoorUnlocked Auto Const mandatory
GlobalVariable Property PlayerPaycheck Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Potion Property Addichrone Auto Const mandatory
ReferenceAlias Property Alias_Marker_Clinic Auto Const mandatory
ReferenceAlias Property Alias_Marker_Store_Clint Auto Const mandatory
ReferenceAlias Property Alias_Actor_Security Auto Const mandatory
Scene Property Scene_WentToApartmentFirst Auto Const mandatory
ReferenceAlias Property Alias_Marker_ErvinApartment_Exterior Auto Const mandatory
Scene Property Scene_NearPasscodeCrate Auto Const mandatory
LocationAlias Property Alias_Location_ErvinApartment Auto Const mandatory
ReferenceAlias Property Alias_Marker_TownHall Auto Const mandatory
Key Property BQ01_Key_ErvinsApartment Auto Const mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_Cactus Auto Const mandatory
Scene Property BQ01_Scene_GREET_1107_ErvinApt_InteriorScene Auto Const mandatory
ReferenceAlias Property Alias_Trigger_ErvinApartment_Exterior Auto Const mandatory
ReferenceAlias Property Alias_Trigger_ErvinApartment_Plant_Exterior Auto Const mandatory
Quest Property SpeechChallengeQuest Auto Const mandatory
Scene Property BQ01_Scene_Vignette_1601_Barrett_Mine_Leave Auto Const mandatory
GlobalVariable Property BQ01_Global_DetectivePoints Auto Const mandatory
Quest Property BarrettQuest Auto Const mandatory
Scene Property BQ01_Scene_BARK_7400_Barrett_BackToShip Auto Const mandatory
Book Property BQ01_ErvinPlant_Slate Auto Const mandatory
Scene Property BQ01_Scene_Vignette_6659_Barrett_Dalitso_Distraction Auto Const mandatory
ReferenceAlias Property Alias_Door_ErvinApartment_Key Auto Const mandatory
ActorValue Property COM_Quest_Barrett_Q01_Complete_AV Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Chair_Helgi Auto Const mandatory
ReferenceAlias Property Alias_Marker_GagarinLandingPad Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Door_Mine_LockEntry Auto Const mandatory
Quest Property DialogueGagarin_UC_GG Auto Const mandatory
ReferenceAlias Property Alias_Door_Mine_LockEntry01 Auto Const mandatory
com_companionquestscript Property Com_Companion_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_TerminalErvin Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_TerminalHelgi Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_TerminalMain Auto Const mandatory
ReferenceAlias Property Alias_Door_EllieApt Auto Const mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_EnableMarker Auto Const mandatory
Scene Property BQ01_Scene_BARK_1107_ErvinApt_InteriorScene Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_Barret Auto Const mandatory
GlobalVariable Property COM_BQ01_WaitToggle Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01_SpeechChallenge Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0177_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0002_Item_00()
  Scene_EnteredApartment.Stop()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(11)
  Self.SetStage(200)
  Alias_Door_EllieApt.GetRef().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Alias_Actor_Helgi.GetRef().MoveTo(Alias_Marker_HoldingCell.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Actor_Helgi.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_0021_Item_00()
  If !Self.GetStageDone(1)
    Self.SetStage(1)
    Alias_Barrett.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0022_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Trigger_Gagarin_LandingPad.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0023_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_Mine_Exterior_Player.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0024_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_GoTo_Foundry.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference PlayerMarker = Alias_goto_LawOffice.GetRef()
  ObjectReference BarrettMarker = Alias_goto_LawOffice_Barrett.GetRef()
  player.MoveTo(PlayerMarker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(BarrettMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0026_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_Clinic.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0027_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_Store_Clint.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0028_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Actor_Security.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0029_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_ErvinApartment_Exterior.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_ErvinApartment_Interior.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0031_Item_00()
  Actor player = Game.GetPlayer()
  Actor Barrett = Alias_Barrett.GetActorRef()
  ObjectReference Marker = Alias_Marker_TownHall.GetRef()
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetStage(116)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetStage(160)
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetStage(2501)
EndFunction

Function Fragment_Stage_0133_Item_00()
  Self.SetObjectiveCompleted(2140, True)
  Actor player = Game.GetPlayer()
  Location Apartment = Alias_Location_ErvinApartment.GetLocation()
  If Game.GetPlayer().GetItemCount(Key_Employee as Form) < 1
    Game.GetPlayer().AddItem(Key_Employee as Form, 1, False)
  EndIf
  If player.GetCurrentLocation() == Apartment
    Self.SetStage(2065)
  ElseIf Game.GetPlayer().IsSneaking()
    Self.SetStage(2055)
  Else
    Self.SetStage(2060)
  EndIf
EndFunction

Function Fragment_Stage_0134_Item_00()
  If Game.GetPlayer().GetItemCount(Key_ErvinFoundry as Form) < 1
    Game.GetPlayer().AddItem(Key_ErvinFoundry as Form, 1, False)
  EndIf
  Self.SetStage(2450)
EndFunction

Function Fragment_Stage_0150_Item_00()
  If !Self.GetStageDone(401)
    Self.SetStage(400)
  Else
    Self.SetStage(2000)
  EndIf
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetStage(185)
EndFunction

Function Fragment_Stage_0181_Item_00()
  Self.SetStage(185)
EndFunction

Function Fragment_Stage_0182_Item_00()
  Self.SetStage(185)
EndFunction

Function Fragment_Stage_0184_Item_00()
  Self.SetObjectiveDisplayed(7100, True, False)
EndFunction

Function Fragment_Stage_0185_Item_00()
  Self.SetObjectiveCompleted(7100, True)
EndFunction

Function Fragment_Stage_0186_Item_00()
  Self.SetStage(185)
EndFunction

Function Fragment_Stage_0188_Item_00()
  BQ01_Global_DetectivePoints.Mod(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Barret)
  COM_BQ01_WaitToggle.SetValue(1.0)
  SQ_Followers.CommandFollow(BarrettRef)
  If !Self.GetStageDone(201)
    If Game.GetPlayer().GetCurrentLocation() == Alias_Location_GagarinSettlement.GetLocation()
      Self.SetStage(201)
    Else
      Self.SetStage(210)
    EndIf
  EndIf
  BarrettQuest.SetStage(50)
  SpeechChallengeQuest.Start()
EndFunction

Function Fragment_Stage_0201_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Alias_Trigger_Gagarin_LandingPad.GetRef().DisableNoWait(False)
  Alias_Marker_GagarinLandingPad.Clear()
  Self.SetStage(231)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  If !Self.GetStageDone(231)
    Self.SetObjectiveDisplayed(230, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0231_Item_00()
  Self.SetObjectiveCompleted(230, True)
EndFunction

Function Fragment_Stage_0235_Item_00()
  Self.SetStage(210)
  Self.SetStage(231)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetStage(231)
  Self.SetStage(8000)
EndFunction

Function Fragment_Stage_0251_Item_00()
  DialogueGagarin_UC_GG.SetStage(200)
  Self.SetStage(6502)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(231)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0301_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Alias_Trigger_ErvinApartment_Exterior.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0305_Item_00()
  If !Self.GetStageDone(1)
    Self.SetStage(1)
    Self.SetStage(235)
    Self.SetStage(22)
  EndIf
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Barret)
EndFunction

Function Fragment_Stage_0315_Item_00()
  Self.SetStage(301)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetStage(301)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0401_Item_00()
  Self.SetObjectiveCompleted(400, True)
  If Self.GetStageDone(436)
    Self.SetStage(2701)
    Self.SetStage(2801)
    Self.SetStage(5000)
  ElseIf Self.GetStageDone(434)
    Self.SetStage(1000)
  Else
    Self.SetStage(2000)
  EndIf
  If Self.GetStageDone(1107)
    Self.SetStage(177)
  EndIf
EndFunction

Function Fragment_Stage_0404_Item_00()
  If !Self.GetStageDone(409)
    Scene_NearLawOffice.Start()
  EndIf
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetStage(404)
EndFunction

Function Fragment_Stage_0407_Item_00()
  If Alias_Barrett.GetRef().GetCurrentLocation() != Alias_Marker_Gagarin_LawOfficeInterior.GetRef().GetCurrentLocation()
    Alias_Barrett.GetRef().MoveTo(Alias_Marker_Gagarin_LawOfficeInterior.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0409_Item_00()
  Alias_Barrett.GetRef().MoveTo(Alias_Marker_Gagarin_LawOfficeInterior.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(301)
  Self.SetStage(215)
  Self.SetStage(407)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0434_Item_00()
  Self.SetStage(455)
EndFunction

Function Fragment_Stage_0436_Item_00()
  Self.SetObjectiveSkipped(2000)
  Self.SetObjectiveSkipped(2100)
  Self.SetObjectiveSkipped(2120)
  Self.SetObjectiveSkipped(2130)
  Self.SetObjectiveSkipped(2140)
  Self.SetObjectiveSkipped(2155)
  Self.SetObjectiveSkipped(2160)
  Self.SetObjectiveSkipped(2300)
  Self.SetObjectiveSkipped(2400)
  Self.SetObjectiveSkipped(2500)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(401)
EndFunction

Function Fragment_Stage_0455_Item_00()
  Scene_GoToErvinApartment.Start()
EndFunction

Function Fragment_Stage_10001_Item_00()
  If !Self.GetStageDone(1116)
    (Alias_Barrett.GetRef() as Actor).EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  If !Self.GetStageDone(1025) && !Self.GetStageDone(1001)
    Self.SetObjectiveDisplayed(1000, True, False)
  EndIf
  Alias_Trigger_ErvinApartment_Exterior.GetRef().EnableNoWait(False)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1001_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetStage(1000)
  Self.SetStage(1015)
EndFunction

Function Fragment_Stage_1005_Item_00()
  If !Self.GetStageDone(1)
    Self.SetStage(1)
    Self.SetStage(305)
    Self.SetStage(405)
    Self.SetStage(1000)
    Self.SetStage(29)
  EndIf
EndFunction

Function Fragment_Stage_1010_Item_00()
  Game.GetPlayer().AddAliasedItem(BQ01_Key_ErvinsApartment as Form, Alias_Door_ErvinApartment_Key as Alias, 1, True)
EndFunction

Function Fragment_Stage_1015_Item_00()
  If Self.GetStageDone(1000)
    Self.SetStage(1020)
  Else
    Self.SetStage(1025)
  EndIf
EndFunction

Function Fragment_Stage_1016_Item_00()
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_1020_Item_00()
  Actor Barrett = Alias_Barrett.GetActorRef()
  Scene_BarrettUsesKey.Start()
  Barrett.EvaluatePackage(False)
  Utility.Wait(3.0)
  Self.SetStage(1016)
EndFunction

Function Fragment_Stage_1025_Item_00()
  Actor Barrett = Alias_Barrett.GetActorRef()
  Scene_BarrettUsesKey.Start()
  Barrett.EvaluatePackage(False)
  Utility.Wait(3.0)
  Self.SetStage(1016)
EndFunction

Function Fragment_Stage_1030_Item_00()
  If !Self.GetStageDone(401)
    Self.SetStage(400)
  Else
    Self.SetStage(2000)
  EndIf
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveSkipped(1000)
  Self.SetObjectiveSkipped(1100)
  If Game.GetPlayer().GetItemCount(Key_ErvinsApartment as Form) > 0
    Game.GetPlayer().RemoveItem(Key_ErvinsApartment as Form, 1, False, None)
  EndIf
  If Alias_Barrett.GetRef().GetItemCount(Key_ErvinsApartment as Form) > 0
    Alias_Barrett.GetRef().RemoveItem(Key_ErvinsApartment as Form, 1, False, None)
  EndIf
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_1055_Item_00()
  Self.SetObjectiveSkipped(1000)
  Self.SetObjectiveSkipped(1100)
  If Game.GetPlayer().GetItemCount(Key_ErvinsApartment as Form) > 0
    Game.GetPlayer().RemoveItem(Key_ErvinsApartment as Form, 1, False, None)
  EndIf
  If Alias_Barrett.GetRef().GetItemCount(Key_ErvinsApartment as Form) > 0
    Alias_Barrett.GetRef().RemoveItem(Key_ErvinsApartment as Form, 1, False, None)
  EndIf
  Self.SetStage(2000)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveDisplayed(1100, True, False)
  Self.SetStage(1016)
EndFunction

Function Fragment_Stage_1101_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveCompleted(1100, True)
  Self.SetStage(1200)
  If Self.GetStageDone(136) && !Self.GetStageDone(1060)
    Self.SetStage(1106)
  Else
    Self.SetStage(1105)
  EndIf
  If Self.GetStageDone(115)
    Self.SetStage(1102)
  EndIf
EndFunction

Function Fragment_Stage_1101_Item_01()
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  BarrettRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  BarrettRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1102_Item_00()
  ObjectReference PasscodeCrate = Alias_Container_ErvinApartment_FoundryKey.GetRef()
  PasscodeCrate.Enable(False)
  PasscodeCrate.Unlock(False)
EndFunction

Function Fragment_Stage_1105_Item_00()
  Scene_EnteredApartment.Start()
EndFunction

Function Fragment_Stage_1107_Item_00()
  BQ01_Scene_BARK_1107_ErvinApt_InteriorScene.Start()
EndFunction

Function Fragment_Stage_1108_Item_00()
  ObjectReference CactusRef = Alias_Container_ErvinApartment_Cactus.GetRef()
  Game.GetPlayer().RemoveItem(CactusRef as Form, 1, True, None)
  CactusRef.DisableNoWait(False)
  Self.SetStage(125)
EndFunction

Function Fragment_Stage_1109_Item_00()
  BQ01_Scene_GREET_1107_ErvinApt_InteriorScene.Start()
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveDisplayed(1200, True, False)
EndFunction

Function Fragment_Stage_1201_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetStage(1300)
EndFunction

Function Fragment_Stage_1205_Item_00()
  Self.SetStage(1)
  Self.SetStage(1005)
  Self.SetStage(1200)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_1220_Item_00()
  Self.SetStage(1221)
EndFunction

Function Fragment_Stage_1221_Item_00()
  Scene_NearSafe.Start()
EndFunction

Function Fragment_Stage_1225_Item_00()
  ObjectReference Safe = Alias_Safe_ErvinApartment.GetRef()
  Safe.Unlock(False)
  Safe.SetOpen(True)
  Self.SetStage(1226)
EndFunction

Function Fragment_Stage_1226_Item_00()
  Scene_OpenSafe.Start()
EndFunction

Function Fragment_Stage_1228_Item_00()
  Self.SetStage(130)
  Self.SetStage(1229)
  If Self.GetStageDone(131)
    Self.SetStage(1201)
  EndIf
  BQ01_Global_DetectivePoints.Mod(1.0)
EndFunction

Function Fragment_Stage_1229_Item_00()
  Scene_PlayerFoundContract.Start()
EndFunction

Function Fragment_Stage_1230_Item_00()
  Self.SetStage(1231)
EndFunction

Function Fragment_Stage_1231_Item_00()
  Scene_NearTerminal.Start()
EndFunction

Function Fragment_Stage_1235_Item_00()
  Game.GetPlayer().AddItem(Digipick as Form, 3, False)
EndFunction

Function Fragment_Stage_1238_Item_00()
  Self.SetStage(131)
  Self.SetStage(159)
  Self.SetStage(1239)
  Self.SetStage(1500)
  If Self.GetStageDone(130)
    Self.SetStage(1201)
  EndIf
EndFunction

Function Fragment_Stage_1239_Item_00()
  Scene_FoundLicense.Start()
EndFunction

Function Fragment_Stage_1240_Item_00()
  Scene_NearPasscodeCrate.Start()
EndFunction

Function Fragment_Stage_1241_Item_00()
  Self.SetStage(1241)
  Self.SetStage(1300)
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetStage(1300)
  If Self.GetStageDone(1107)
    Self.SetStage(1108)
  EndIf
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False)
  Alias_Trigger_ErvinApartment_Plant_Exterior.GetRef().EnableNoWait(False)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
  Alias_Container_ErvinApartment_EnableMarker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_1301_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  Alias_Trigger_ErvinApartment_Plant_Exterior.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_1305_Item_00()
  Self.SetStage(1228)
  Self.SetStage(1238)
  Self.SetStage(1205)
  Self.SetStage(31)
  Self.SetStage(1300)
  Self.SetStage(1600)
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveDisplayed(1500, True, False)
EndFunction

Function Fragment_Stage_1501_Item_00()
  Self.SetObjectiveCompleted(1500, True)
  Self.SetStage(1301)
  Self.SetStage(1502)
  Self.SetStage(1510)
EndFunction

Function Fragment_Stage_1502_Item_00()
  Scene_TownHallArrival.Start()
EndFunction

Function Fragment_Stage_1505_Item_00()
  Self.SetStage(1305)
  Self.SetStage(1301)
  Self.SetStage(1500)
  Self.SetStage(31)
EndFunction

Function Fragment_Stage_1510_Item_00()
  Self.SetStage(150)
  Self.SetStage(1501)
  Self.SetObjectiveDisplayed(1510, True, False)
EndFunction

Function Fragment_Stage_1515_Item_00()
  Self.SetObjectiveCompleted(1510, True)
  Self.SetStage(159)
  Self.SetStage(1520)
  Self.SetStage(1600)
  BQ01_Global_DetectivePoints.Mod(1.0)
EndFunction

Function Fragment_Stage_1520_Item_00()
  Scene_TownHall_FoundLicense.Start()
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveDisplayed(1600, True, False)
EndFunction

Function Fragment_Stage_1601_Item_00()
  Self.SetObjectiveCompleted(1600, True)
  Self.SetStage(2000)
  If Self.GetStageDone(1107)
    Self.SetStage(177)
  EndIf
EndFunction

Function Fragment_Stage_1605_Item_00()
  Self.SetStage(1505)
  Self.SetStage(1515)
  Self.SetStage(1600)
  Self.SetStage(25)
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2000, True, False)
  EndIf
  Self.SetStage(2002)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_2001_Item_00()
  Self.SetObjectiveCompleted(2000, True)
  Self.SetStage(401)
  Self.SetStage(2100)
EndFunction

Function Fragment_Stage_2002_Item_00()
  Scene_GoToFoundry.Start()
EndFunction

Function Fragment_Stage_2005_Item_00()
  Self.SetStage(10)
  Self.SetStage(182)
  Self.SetStage(351)
  Self.SetStage(301)
  Self.SetStage(401)
  If !Self.GetStageDone(2805)
    Self.SetStage(2000)
    Self.SetStage(24)
  EndIf
EndFunction

Function Fragment_Stage_2055_Item_00()
  Self.SetObjectiveCompleted(2140, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2060_Item_00()
  Self.SetObjectiveCompleted(2140, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2065_Item_00()
  Self.SetObjectiveCompleted(2140, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2100_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2155, True, False)
  EndIf
  If Game.GetPlayer().GetItemCount(Key_ErvinFoundry as Form) > 0
    Self.SetStage(2120)
  ElseIf Game.GetPlayer().GetItemCount(Key_Employee as Form) > 0
    Self.SetStage(2130)
  ElseIf Self.GetStageDone(433)
    Self.SetStage(2160)
  ElseIf Self.GetStageDone(431)
    Self.SetStage(2140)
  ElseIf Self.GetStageDone(432)
    Self.SetStage(2150)
  Else
    Self.SetStage(2110)
  EndIf
EndFunction

Function Fragment_Stage_2101_Item_00()
  Self.SetObjectiveCompleted(2155, True)
  Self.SetObjectiveSkipped(2110)
  Self.SetObjectiveSkipped(2120)
  Self.SetObjectiveSkipped(2130)
  Self.SetObjectiveSkipped(2140)
  Self.SetObjectiveSkipped(2160)
  Self.SetStage(2302)
  Self.SetObjectiveSkipped(2400)
  Self.SetStage(2501)
  Self.SetStage(2800)
EndFunction

Function Fragment_Stage_2110_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2100, True, False)
  EndIf
  Self.SetStage(2115)
EndFunction

Function Fragment_Stage_2111_Item_00()
  Self.SetObjectiveCompleted(2100, True)
  Self.SetStage(2300)
EndFunction

Function Fragment_Stage_2112_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, PlayerPaycheck.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_2115_Item_00()
  Scene_FoundryNormalTrack.Start()
EndFunction

Function Fragment_Stage_2120_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2120, True, False)
  EndIf
  Self.SetStage(2125)
EndFunction

Function Fragment_Stage_2121_Item_00()
  Self.SetObjectiveCompleted(2120, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2125_Item_00()
  Scene_FoundryErvinTrack.Start()
EndFunction

Function Fragment_Stage_2130_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2130, True, False)
  EndIf
  Self.SetStage(2135)
EndFunction

Function Fragment_Stage_2131_Item_00()
  Self.SetObjectiveCompleted(2130, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2132_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, PlayerPaycheck.GetValue() as Int, False)
EndFunction

Function Fragment_Stage_2135_Item_00()
  Scene_FoundryEmployeeTrack.Start()
EndFunction

Function Fragment_Stage_2140_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2140, True, False)
  EndIf
  Self.SetStage(2145)
EndFunction

Function Fragment_Stage_2141_Item_00()
  Self.SetObjectiveCompleted(2140, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2145_Item_00()
  Scene_FoundryTheftTrack.Start()
EndFunction

Function Fragment_Stage_2150_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2110, True, False)
  EndIf
  Self.SetStage(2155)
EndFunction

Function Fragment_Stage_2155_Item_00()
  Scene_FoundryGeologyTrack.Start()
EndFunction

Function Fragment_Stage_2160_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2160, True, False)
  EndIf
  Self.SetStage(2165)
EndFunction

Function Fragment_Stage_2161_Item_00()
  Self.SetObjectiveCompleted(2160, True)
  Self.SetStage(2500)
EndFunction

Function Fragment_Stage_2165_Item_00()
  Scene_FoundryTrackCyberRunner.Start()
EndFunction

Function Fragment_Stage_2300_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2300, True, False)
  EndIf
EndFunction

Function Fragment_Stage_2301_Item_00()
  If !Self.GetStageDone(2302)
    Self.SetObjectiveCompleted(2300, True)
  EndIf
EndFunction

Function Fragment_Stage_2302_Item_00()
  If !Self.GetStageDone(2301)
    Self.SetObjectiveSkipped(2300)
  EndIf
EndFunction

Function Fragment_Stage_2310_Item_00()
  Self.SetStage(2301)
  Self.SetStage(2350)
EndFunction

Function Fragment_Stage_2330_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MediumCredits.GetValue() as Int, False, None)
  Self.SetStage(2301)
  Self.SetStage(2350)
EndFunction

Function Fragment_Stage_2340_Item_00()
  Self.SetStage(2301)
  Self.SetStage(2350)
EndFunction

Function Fragment_Stage_2350_Item_00()
  Self.SetStage(2600)
  Self.SetStage(133)
EndFunction

Function Fragment_Stage_2400_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2400, True, False)
  EndIf
EndFunction

Function Fragment_Stage_2401_Item_00()
  Self.SetObjectiveCompleted(2400, True)
EndFunction

Function Fragment_Stage_2420_Item_00()
  Int BribeAmount = MediumCredits.GetValue() as Int
  Int MinimumAmount = SmallCredits.GetValue() as Int
  Int PlayerHas = Game.GetPlayer().GetItemCount(Credits as Form)
  Int DonationAmount = BribeAmount - PlayerHas
  If DonationAmount > BribeAmount
    DonationAmount = BribeAmount
  ElseIf DonationAmount > 0
    Game.GetPlayer().AddItem(Credits as Form, DonationAmount, False)
  Else
    Game.GetPlayer().AddItem(Credits as Form, MinimumAmount, False)
  EndIf
EndFunction

Function Fragment_Stage_2500_Item_00()
  If !Self.GetStageDone(436)
    Self.SetObjectiveDisplayed(2500, True, False)
  EndIf
EndFunction

Function Fragment_Stage_2501_Item_00()
  Self.SetObjectiveCompleted(2500, True)
  Self.SetStage(160)
  Self.SetStage(2101)
  Self.SetStage(2800)
EndFunction

Function Fragment_Stage_2800_Item_00()
  Self.SetObjectiveCompleted(2500, True)
  Self.SetObjectiveDisplayed(2800, True, False)
  Self.SetStage(2101)
  Self.SetStage(2401)
  Self.SetStage(2501)
EndFunction

Function Fragment_Stage_2801_Item_00()
  Self.SetObjectiveCompleted(2800, True)
  Self.SetStage(5000)
EndFunction

Function Fragment_Stage_2805_Item_00()
  Self.SetStage(2005)
  Self.SetStage(2101)
  Self.SetStage(2801)
  If !Self.GetStageDone(5005) && !Self.GetStageDone(6005)
    Self.SetStage(5000)
    Self.SetStage(23)
  EndIf
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.SetObjectiveDisplayed(5000, True, False)
  Alias_Door_Mine_LockEntry.GetRef().Lock(False, False, True)
  Alias_Door_Mine_LockEntry01.GetRef().Lock(False, False, True)
  ObjectReference MapRef = Alias_Marker_Mine_MapMarker.GetRef()
  MapRef.EnableNoWait(False)
  MapRef.AddToMapScanned(False)
  Self.SetStage(2801)
EndFunction

Function Fragment_Stage_5001_Item_00()
  Self.SetObjectiveCompleted(5000, True)
  Self.SetObjectiveDisplayed(5100, True, False)
  Self.SetStage(2101)
  Self.SetStage(2801)
  Self.SetStage(5011)
EndFunction

Function Fragment_Stage_5005_Item_00()
  Self.SetStage(2805)
  If !Self.GetStageDone(6005)
    Self.SetStage(5000)
    Self.SetStage(23)
  EndIf
EndFunction

Function Fragment_Stage_5011_Item_00()
  Scene_Mine_Comment01_LandingPad.Start()
  Self.SetStage(5010)
EndFunction

Function Fragment_Stage_5012_Item_00()
  Scene_Mine_Comment02_Exterior.Start()
EndFunction

Function Fragment_Stage_5013_Item_00()
  Scene_Mine_Comment03_Interior.Start()
  Self.SetStage(5200)
EndFunction

Function Fragment_Stage_5014_Item_00()
  Scene_Mine_Comment04_Office.Start()
  Self.SetStage(5200)
EndFunction

Function Fragment_Stage_5031_Item_00()
  Scene_Cave_Comment01_NearElevator.Start()
  Self.SetStage(530)
EndFunction

Function Fragment_Stage_5032_Item_00()
  Scene_Cave_Comment02_Entrance.Start()
EndFunction

Function Fragment_Stage_5033_Item_00()
  Scene_Cave_Comment03_Eggs.Start()
EndFunction

Function Fragment_Stage_5034_Item_00()
  Scene_Cave_Comment04_Tunnels.Start()
EndFunction

Function Fragment_Stage_5035_Item_00()
  Scene_Cave_Comment05_HelgiLab.Start()
EndFunction

Function Fragment_Stage_5036_Item_00()
  Scene_Cave_Comment06_Nest.Start()
EndFunction

Function Fragment_Stage_5200_Item_00()
  Self.SetObjectiveCompleted(5000, True)
  Self.SetObjectiveDisplayed(5100, True, False)
  Self.SetStage(5010)
EndFunction

Function Fragment_Stage_5201_Item_00()
  Self.SetObjectiveCompleted(5100, True)
  Self.SetStage(6000)
EndFunction

Function Fragment_Stage_5210_Item_00()
  Scene_FoundEvidence_Admin.Start()
  If Self.GetStageDone(5220) && Self.GetStageDone(5230)
    Self.SetStage(5201)
  EndIf
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference MarkerRef = Alias_Marker_Mine_TerminalMain.GetRef()
  If BarrettRef.GetDistance(MarkerRef) > 6.0
    BarrettRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_5220_Item_00()
  Scene_FoundEvidence_Helgi.Start()
  Self.SetStage(121)
  If Self.GetStageDone(5210) && Self.GetStageDone(5230)
    Self.SetStage(5201)
  EndIf
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference MarkerRef = Alias_Marker_Mine_TerminalHelgi.GetRef()
  If BarrettRef.GetDistance(MarkerRef) > 6.0
    BarrettRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_5225_Item_00()
  ObjectReference Computer = Alias_Terminal_Mine_Cave_HelgiStation.GetRef()
  Computer.Unlock(False)
  Computer.SetOpen(True)
  Self.SetStage(5211)
EndFunction

Function Fragment_Stage_5230_Item_00()
  Scene_FoundEvidence_Ervin.Start()
  If Self.GetStageDone(5220) && Self.GetStageDone(5210)
    Self.SetStage(5201)
  EndIf
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference MarkerRef = Alias_Marker_Mine_TerminalErvin.GetRef()
  If BarrettRef.GetDistance(MarkerRef) > 6.0
    BarrettRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_5235_Item_00()
  ObjectReference Computer = Alias_Terminal_Mine_Lab_ErvinStation.GetRef()
  Computer.Unlock(False)
  Computer.SetOpen(True)
  Self.SetStage(5212)
EndFunction

Function Fragment_Stage_6000_Item_00()
  Self.SetObjectiveSkipped(1600)
  Self.SetObjectiveDisplayed(6000, True, False)
EndFunction

Function Fragment_Stage_6001_Item_00()
  Self.SetObjectiveCompleted(6000, True)
  Self.SetStage(6300)
EndFunction

Function Fragment_Stage_6005_Item_00()
  Self.SetStage(5005)
  Self.SetStage(5201)
  Self.SetStage(5210)
  Self.SetStage(5220)
  Self.SetStage(5230)
  If !Self.GetStageDone(6305)
    Self.SetStage(25)
  EndIf
EndFunction

Function Fragment_Stage_6010_Item_00()
  Self.SetStage(6015)
EndFunction

Function Fragment_Stage_6015_Item_00()
  Scene_Vignette_ReturnedFromMine.Start()
EndFunction

Function Fragment_Stage_6112_Item_00()
  Self.SetStage(6001)
EndFunction

Function Fragment_Stage_6300_Item_00()
  Self.SetStage(121)
  Self.SetStage(6315)
  If Self.GetStageDone(6110)
    Self.SetStage(6500)
  ElseIf Self.GetStageDone(6111)
    Self.SetStage(6400)
  EndIf
EndFunction

Function Fragment_Stage_6301_Item_00()
  Self.SetObjectiveCompleted(6300, True)
  Self.SetObjectiveCompleted(6500, True)
  Self.SetStage(7000)
EndFunction

Function Fragment_Stage_6305_Item_00()
  Self.SetStage(6005)
  Self.SetStage(6001)
  Self.SetStage(6111)
  Self.SetStage(6300)
  If Self.GetStageDone(6405)
    Self.SetStage(27)
  ElseIf Self.GetStageDone(6705)
    Self.SetStage(28)
  ElseIf Self.GetStageDone(6605)
    Self.SetStage(29)
  EndIf
EndFunction

Function Fragment_Stage_6315_Item_00()
  Alias_Actor_Helgi.GetRef().MoveTo(Alias_Marker_Spawn_Helgi.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_6400_Item_00()
  Self.SetObjectiveDisplayed(6400, True, False)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_6401_Item_00()
  Self.SetObjectiveCompleted(6400, True)
  If Self.GetStageDone(6425)
    Self.SetStage(6500)
  Else
    Self.SetStage(6700)
  EndIf
EndFunction

Function Fragment_Stage_6405_Item_00()
  Self.SetStage(6305)
  Self.SetStage(6400)
EndFunction

Function Fragment_Stage_6415_Item_00()
  Self.SetStage(6430)
EndFunction

Function Fragment_Stage_6422_Item_00()
  Int PlayerAmount = Game.GetPlayer().GetItemCount(Addichrone as Form)
  If PlayerAmount >= 3
    Game.GetPlayer().RemoveItem(Addichrone as Form, 3, False, None)
  Else
    Game.GetPlayer().RemoveItem(Addichrone as Form, PlayerAmount, False, None)
  EndIf
EndFunction

Function Fragment_Stage_6425_Item_00()
  Self.SetStage(6430)
EndFunction

Function Fragment_Stage_6430_Item_00()
  Self.SetStage(6401)
EndFunction

Function Fragment_Stage_6500_Item_00()
  Self.SetObjectiveDisplayed(6500, True, False)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_6501_Item_00()
  If !Self.GetStageDone(6520) && !Self.GetStageDone(6521)
    Self.SetObjectiveCompleted(6500, True)
  Else
    Self.SetObjectiveSkipped(6500)
  EndIf
EndFunction

Function Fragment_Stage_6522_Item_00()
  Self.SetStage(6301)
  Self.SetStage(6501)
EndFunction

Function Fragment_Stage_6601_Item_00()
  Self.SetObjectiveCompleted(6720, True)
  Scene_DalitsoEndConvo.Start()
  Self.SetStage(6650)
EndFunction

Function Fragment_Stage_6605_Item_00()
  Self.SetStage(6305)
  Self.SetStage(6600)
EndFunction

Function Fragment_Stage_6650_Item_00()
  Self.SetObjectiveDisplayed(6650, True, False)
EndFunction

Function Fragment_Stage_6651_Item_00()
  If Self.GetStageDone(6650)
    Self.SetObjectiveCompleted(6650, True)
    Self.SetStage(6670)
  EndIf
EndFunction

Function Fragment_Stage_6652_Item_00()
  Self.SetObjectiveCompleted(6650, True)
  Self.SetObjectiveDisplayed(6652, True, False)
EndFunction

Function Fragment_Stage_6653_Item_00()
  Self.SetObjectiveCompleted(6650, True)
  If Self.GetStageDone(6652)
    Self.SetObjectiveFailed(6652, True)
  EndIf
  If !Self.GetStageDone(6656) && !Self.GetStageDone(7000)
    Self.SetObjectiveDisplayed(6653, True, False)
  EndIf
EndFunction

Function Fragment_Stage_6656_Item_00()
  Self.SetObjectiveCompleted(6652, True)
  Self.SetObjectiveCompleted(6656, True)
  Self.SetStage(6657)
EndFunction

Function Fragment_Stage_6657_Item_00()
  Self.SetObjectiveDisplayed(6657, True, False)
EndFunction

Function Fragment_Stage_6658_Item_00()
  Self.SetObjectiveCompleted(6657, True)
  Self.SetStage(7000)
EndFunction

Function Fragment_Stage_6659_Item_00()
  Self.SetObjectiveSkipped(6400)
  Self.SetObjectiveSkipped(6500)
  Self.SetObjectiveSkipped(6700)
  Self.SetObjectiveCompleted(6653, True)
  Self.SetStage(6657)
  If Self.GetStageDone(6653)
    BQ01_Scene_Vignette_6659_Barrett_Dalitso_Distraction.Start()
  EndIf
EndFunction

Function Fragment_Stage_6670_Item_00()
  If !Self.GetStageDone(6656) && !Self.GetStageDone(7000)
    Self.SetObjectiveDisplayed(6653, True, False)
  EndIf
EndFunction

Function Fragment_Stage_6671_Item_00()
  If Self.GetStageDone(6670)
    Self.SetObjectiveCompleted(6653, True)
  EndIf
  Self.SetStage(165)
EndFunction

Function Fragment_Stage_6700_Item_00()
  Self.SetObjectiveDisplayed(6700, True, False)
EndFunction

Function Fragment_Stage_6701_Item_00()
  Self.SetObjectiveCompleted(6700, True)
  If Self.GetStageDone(6715)
    Self.SetStage(6500)
  Else
    Self.SetStage(6600)
  EndIf
EndFunction

Function Fragment_Stage_6705_Item_00()
  Self.SetStage(6305)
  Self.SetStage(6700)
EndFunction

Function Fragment_Stage_6715_Item_00()
  Self.SetStage(6500)
  Self.SetStage(6750)
EndFunction

Function Fragment_Stage_6720_Item_00()
  Self.SetStage(6750)
  Self.SetStage(6600)
  Self.SetObjectiveDisplayed(6720, True, False)
EndFunction

Function Fragment_Stage_6725_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, LargeCredits.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_6726_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, LargeCredits.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_6750_Item_00()
  Self.SetStage(6701)
EndFunction

Function Fragment_Stage_7000_Item_00()
  Self.SetObjectiveSkipped(6400)
  Self.SetObjectiveSkipped(6500)
  Self.SetObjectiveSkipped(6700)
  Self.SetObjectiveSkipped(6652)
  Self.SetObjectiveSkipped(6653)
  Self.SetObjectiveSkipped(6657)
  Self.SetObjectiveDisplayed(7000, True, False)
  ObjectReference HelgiRef = Alias_Actor_Helgi.GetRef()
  ObjectReference BeanBagRef = Alias_Furniture_Chair_Helgi.GetRef()
  HelgiRef.EnableNoWait(False)
  If HelgiRef.GetDistance(BeanBagRef) > 10.0
    HelgiRef.MoveTo(BeanBagRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  Self.SetStage(165)
EndFunction

Function Fragment_Stage_7005_Item_00()
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_7009_Item_00()
  BQ01_Global_DetectivePoints.Mod(1.0)
EndFunction

Function Fragment_Stage_7010_Item_00()
  Self.SetObjectiveFailed(7000, True)
  Self.SetObjectiveFailed(7100, True)
EndFunction

Function Fragment_Stage_7101_Item_00()
  If Self.GetStageDone(7009)
    Self.SetObjectiveCompleted(7000, True)
  Else
    Self.SetObjectiveFailed(7000, True)
  EndIf
  Self.SetStage(7300)
EndFunction

Function Fragment_Stage_7300_Item_00()
  Self.SetObjectiveDisplayed(7300, True, False)
EndFunction

Function Fragment_Stage_7301_Item_00()
  Self.SetObjectiveSkipped(7100)
  Self.SetObjectiveCompleted(7300, True)
  Self.SetStage(7400)
  Int DetectivePoints = BQ01_Global_DetectivePoints.GetValueInt()
  If DetectivePoints >= 4
    BarrettQuest.SetStage(8)
  EndIf
  If DetectivePoints >= 2
    BarrettQuest.SetStage(7)
  EndIf
  BarrettQuest.SetStage(6)
EndFunction

Function Fragment_Stage_7400_Item_00()
  Self.SetObjectiveDisplayed(7400, True, False)
  BQ01_Scene_BARK_7400_Barrett_BackToShip.Start()
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_7401_Item_00()
  Self.CompleteAllObjectives()
  If !COM_Quest_Barrett_Q02.IsRunning()
    SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, None, None)
    COM_BQ01_WaitToggle.SetValue(0.0)
  EndIf
  Com_Companion_Barrett.FinishedPersonalQuest()
  Game.GetPlayer().SetValue(COM_Quest_Barrett_Q01_Complete_AV, 1.0)
  Game.GetPlayer().RemoveItem(BQ01_Key_ErvinsApartment as Form, 1, True, None)
  Alias_Door_ErvinApartment_Exterior.GetRef().Lock(True, False, True)
  COM_Quest_Barrett_Q01_SpeechChallenge.Stop()
  Self.Stop()
EndFunction

Function Fragment_Stage_7402_Item_00()
  Game.GetPlayer().AddItem(BQ01_ErvinPlant_Slate as Form, 1, False)
EndFunction

Function Fragment_Stage_8200_Item_00()
  Self.SetStage(8300)
EndFunction

Function Fragment_Stage_8930_Item_00()
  If Self.GetStageDone(275) && !Self.GetStageDone(280)
    Self.SetStage(280)
  EndIf
EndFunction

Function Fragment_Stage_9000_Item_00()
  If Self.GetStageDone(275)
    Self.SetStage(9100)
  Else
    Self.SetStage(9200)
  EndIf
EndFunction

Function Fragment_Stage_9100_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_9200_Item_00()
  Self.Stop()
EndFunction
