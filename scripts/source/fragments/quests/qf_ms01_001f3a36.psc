ScriptName Fragments:Quests:QF_MS01_001F3A36 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MS01_0200_DistressCall Auto Const mandatory
Quest Property MS01SpaceEncounter01 Auto Const mandatory
Quest Property MS01SpaceEncounter02 Auto Const mandatory
ReferenceAlias Property Alias_FC_LtTorres Auto Const mandatory
ReferenceAlias Property Alias_FC_SargeDasari Auto Const mandatory
ReferenceAlias Property Alias_UC_CaptMyeong Auto Const mandatory
ReferenceAlias Property Alias_FC_PvtMahoney Auto Const mandatory
ReferenceAlias Property Alias_UC_CplLezama Auto Const mandatory
ReferenceAlias Property Alias_UC_PvtTsai Auto Const mandatory
RefCollectionAlias Property Alias_EndFightBaddies Auto Const mandatory
Quest Property MS01SpaceEncounter03 Auto Const mandatory
Scene Property MS01_0100_HaulerIntro Auto Const mandatory
ReferenceAlias Property Alias_ScientistMapMarker Auto Const mandatory
ReferenceAlias Property Alias_Hauler Auto Const mandatory
Key Property MS01_MedicalKey Auto Const mandatory
ObjectReference Property OutpostCOC Auto Const
Key Property MS01_SecurityKey Auto Const mandatory
RefCollectionAlias Property Alias_MyeongInitialEnemies Auto Const mandatory
Scene Property MS01_0475_PostCombatMyeongIntro Auto Const mandatory
ReferenceAlias Property Alias_InfirmaryDoor Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property MS01_0410_MahoneySaved Auto Const mandatory
Scene Property MS01_0422_DoctorDoorReact Auto Const mandatory
Scene Property MS01_0075_HaulerHail Auto Const mandatory
Scene Property MS01_0430_TorresDoorOpened Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Scene Property MS01_0900_MahoneyDistress Auto Const mandatory
ActorValue Property MS01_ForeknowledgeAV Auto Const mandatory
Location Property SAltair Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_EndFightBaddies_Wave02_Ship Auto Const mandatory
LocationAlias Property Alias_SpaceFightersLocation02 Auto Const mandatory
Keyword Property LocTypeSENotAllowed Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToCleanUp Auto Const mandatory
ReferenceAlias Property Alias_Rescue_Scientist Auto Const mandatory
ReferenceAlias Property Alias_Rescue_Soldier Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
ReferenceAlias Property Alias_FC_DrMoussa Auto Const mandatory
LocationAlias Property Alias_SpaceFightersLocation01 Auto Const mandatory
ReferenceAlias Property Alias_EndFightBaddies_Wave02_Ship02 Auto Const mandatory
GlobalVariable Property SE_FAB06_CooldownDays Auto Const mandatory
Float Property cooldownDays Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  If !Alias_PlayerShip.GetRef().IsInLocation(SAltair)
    MS01SpaceEncounter03.Start()
  Else
    Self.SetStage(200)
  EndIf
  Alias_ScientistMapMarker.GetRef().Disable(False)
  Alias_SpaceFightersLocation01.GetLocation().AddKeyword(LocTypeSENotAllowed)
  Alias_SpaceFightersLocation02.GetLocation().AddKeyword(LocTypeSENotAllowed)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(OutpostCOC, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  MS01SpaceEncounter03.Start()
  MS01_0100_HaulerIntro.Start()
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_ScientistMapMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  MS01_0075_HaulerHail.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Utility.Wait(3.0)
  spaceshipreference srHauler = Alias_Hauler.GetRef() as spaceshipreference
  srHauler.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  MS01_0200_DistressCall.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(475, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  MS01_0410_MahoneySaved.Start()
EndFunction

Function Fragment_Stage_0415_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(425, True, False)
  Alias_FC_PvtMahoney.GetActorRef().RemoveFromFaction(CaptiveFaction)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Alias_InfirmaryDoor.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0422_Item_00()
  If !Self.GetStageDone(415)
    Self.SetObjectiveDisplayed(425, True, False)
  EndIf
  MS01_0422_DoctorDoorReact.Start()
EndFunction

Function Fragment_Stage_0425_Item_00()
  Self.SetObjectiveCompleted(425, True)
  Self.SetObjectiveDisplayed(435, True, False)
  Game.GetPlayer().AddItem(MS01_MedicalKey as Form, 1, False)
  Alias_FC_DrMoussa.GetActorRef().RemoveFromFaction(CaptiveFaction)
  Alias_UC_CplLezama.GetActorRef().RemoveFromFaction(CaptiveFaction)
EndFunction

Function Fragment_Stage_0430_Item_00()
  MS01_0430_TorresDoorOpened.Start()
EndFunction

Function Fragment_Stage_0435_Item_00()
  Self.SetObjectiveCompleted(435, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Game.GetPlayer().AddItem(MS01_SecurityKey as Form, 1, False)
  Alias_FC_LtTorres.GetActorRef().EvaluatePackage(False)
  Alias_FC_SargeDasari.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Alias_MyeongInitialEnemies.EnableAll(False)
EndFunction

Function Fragment_Stage_0475_Item_00()
  Quest __temp = Self as Quest
  ms01script kmyQuest = __temp as ms01script
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(475, True, False)
  MS01_0475_PostCombatMyeongIntro.Start()
  Alias_FC_LtTorres.GetActorRef().EvaluatePackage(False)
  Alias_FC_SargeDasari.GetActorRef().EvaluatePackage(False)
  Alias_UC_CaptMyeong.GetActorRef().EvaluatePackage(False)
  Alias_UC_PvtTsai.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(475, True)
  Self.SetObjectiveDisplayed(490, True, False)
  Alias_ScientistMapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest
  ms01script kmyQuest = __temp as ms01script
  Self.SetObjectiveCompleted(490, True)
  Self.SetObjectiveDisplayed(500, True, False)
  kmyQuest.LockDoors(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  ms01script kmyQuest = __temp as ms01script
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  kmyQuest.LockDoors(False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
  Actor aTarg = Alias_FC_LtTorres.GetActorRef()
  aTarg.EvaluatePackage(False)
  aTarg.MoveTo(aTarg.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_UC_CaptMyeong.GetActorRef()
  aTarg.EvaluatePackage(False)
  aTarg.MoveTo(aTarg.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Self.SetObjectiveDisplayed(850, True, False)
EndFunction

Function Fragment_Stage_0820_Item_00()
  MS01SpaceEncounter01.Start()
EndFunction

Function Fragment_Stage_0830_Item_00()
  Self.SetObjectiveCompleted(800, True)
  If Self.GetStageDone(850)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0840_Item_00()
  MS01SpaceEncounter02.Start()
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(850, True)
  If Self.GetStageDone(830)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
  MS01_0900_MahoneyDistress.Start()
  Alias_SpaceFightersLocation01.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
  Alias_SpaceFightersLocation02.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_NPCsToCleanUp.DisableAll(False)
  Alias_Rescue_Scientist.GetRef().Disable(False)
  Alias_Rescue_Soldier.GetRef().Disable(False)
  Float currentGameTime = Utility.GetCurrentGameTime()
  SE_FAB06_CooldownDays.SetValue(currentGameTime + cooldownDays)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  Actor aTarg = None
  aTarg = Alias_FC_LtTorres.GetActorRef()
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_FC_PvtMahoney.GetActorRef()
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_FC_SargeDasari.GetActorRef()
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_UC_CaptMyeong.GetActorRef()
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_UC_CplLezama.GetActorRef()
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_UC_PvtTsai.GetActorRef()
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  Alias_EndFightBaddies.EnableAll(False)
EndFunction

Function Fragment_Stage_1010_Item_00()
  Alias_EndFightBaddies_Wave02_Ship.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1020_Item_00()
  Alias_EndFightBaddies_Wave02_Ship02.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
  Alias_FC_LtTorres.GetActorRef().EvaluatePackage(False)
  Alias_UC_CaptMyeong.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1190_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 1000, False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().SetValue(MS01_ForeknowledgeAV, 1.0)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
