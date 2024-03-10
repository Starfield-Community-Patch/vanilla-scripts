ScriptName Fragments:Quests:QF_RI03_0029EB12 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_StanleyFile Auto Const mandatory
ReferenceAlias Property Alias_StanleyAudio Auto Const mandatory
ReferenceAlias Property Alias_DataDisk Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Malai Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property RI01 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
Scene Property RI03_350_Malai_HailingScene Auto Const mandatory
GlobalVariable Property RI03_TESTHailGlobal Auto Const mandatory
ReferenceAlias Property Alias_MalaiGun Auto Const mandatory
Scene Property RI03_100_Ularu_OfficeScene Auto Const mandatory
ReferenceAlias Property Alias_TESTStartRef Auto Const mandatory
Scene Property RI03_1200_Masako_MeetingScene Auto Const mandatory
ReferenceAlias Property Alias_SlateProjectDominion Auto Const mandatory
Quest Property RI03_SpaceEncounter Auto Const mandatory
ReferenceAlias Property Alias_MalaiShip Auto Const mandatory
Keyword Property RI03_SayCustom_ImogeneToUlaru_Keyword Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_StanleyAccessCard Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_StanleyMarker Auto Const mandatory
GlobalVariable Property RI03_PlayerMentionsSimon Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Quest Property RI04 Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_Genevieve Auto Const mandatory
ReferenceAlias Property Alias_GenevieveOfficeSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeSceneMarker Auto Const mandatory
Scene Property RI03_100_Maeve_CalloutScene Auto Const mandatory
GlobalVariable Property RI03_PlayerMetStanley Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_SimonMarker Auto Const mandatory
Weapon Property RI03_Eon_MalaiLiskovaGun Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property RI03_StanleyBribe Auto Const mandatory
GlobalVariable Property RI03_Simon_Credits Auto Const mandatory
GlobalVariable Property RI03_Simon_MoreCredits Auto Const mandatory
GlobalVariable Property RI03_Simon_AndrejaCredits Auto Const mandatory
GlobalVariable Property RI03_Simon_LessCredits Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ActorValue Property RI03_Foreknowledge_MetUlaruAV Auto Const mandatory
ActorValue Property RI03_Foreknowledge_KnowsProjectDominionAV Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_GenevieveOfficeWaitMarker Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_RI03_Ember Auto Const mandatory
GlobalVariable Property RI03_MalaiDead Auto Const mandatory
RefCollectionAlias Property Alias_MalaiShipTurrets Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_InfinityLTDMarker Auto Const mandatory
ReferenceAlias Property Alias_StanleyTerminal Auto Const mandatory
ReferenceAlias Property Alias_Simon Auto Const mandatory
ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property RI03_MalaiBoardingFaction Auto Const mandatory
GlobalVariable Property RI03_SimonDead Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Quest Property BE_RI03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_TESTStartRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0002_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_SimonMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0003_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0004_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_SimonMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(600)
  Self.SetStage(650)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0005_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Alias_UlaruOfficeDoor.GetRef().Lock(False, False, True)
  Alias_UlaruOfficeDoor.GetRef().SetOpen(True)
  Self.SetStage(1100)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_Ularu.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(360)
  Self.SetStage(500)
  Self.SetStage(525)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  RI03_SpaceEncounter.Start()
EndFunction

Function Fragment_Stage_0008_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(120)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_TESTStartRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(1000)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_SimonMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetActive(True)
  Alias_Stanley.GetRef().MoveTo(Alias_StanleyMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_StanleyTerminal.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_TESTStartRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Ularu.GetRef().MoveTo(Alias_UlaruOfficeSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(120)
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0100_Item_00()
  LC044.SetStage(1000)
  Self.SetObjectiveDisplayed(100, True, False)
  RIR05.Stop()
  Alias_UlaruChairSwapMarker.GetRef().Disable(False)
  Alias_Ularu.GetRef().MoveTo(Alias_UlaruOfficeSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveOfficeWaitMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  ObjectReference DoorRef = Alias_UlaruOfficeDoor.GetRef()
  DoorRef.SetOpen(False)
  DoorRef.Lock(True, False, True)
  DoorRef.SetLockLevel(254)
EndFunction

Function Fragment_Stage_0110_Item_00()
  RI03_100_Maeve_CalloutScene.Start()
  Self.SetObjectiveDisplayed(100, False, False)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
  Self.SetStage(125)
  Alias_Imogene.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_UlaruOfficeDoor.GetRef().Lock(False, False, True)
  Alias_UlaruOfficeDoor.GetRef().SetOpen(True)
  If !Self.GetStageDone(130)
    RI03_100_Ularu_OfficeScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
  Alias_Genevieve.GetActorRef().EvaluatePackage(False)
  Alias_Ularu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0135_Item_00()
  Alias_Ularu.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Imogene.GetActorRef().EvaluatePackage(False)
  Alias_Imogene.GetActorRef().SayCustom(RI03_SayCustom_ImogeneToUlaru_Keyword, None, False, None)
  Self.SetStage(170)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Alias_Imogene.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveDisplayed(170, True, False)
  Actor StanleyRef = Alias_Stanley.GetActorRef()
  StanleyRef.SetCrimeFaction(CrimeFactionUC)
  StanleyRef.MoveTo(Alias_StanleyMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor StanleyRef = Alias_Stanley.GetActorRef()
  StanleyRef.SetCrimeFaction(CrimeFactionUC)
  StanleyRef.MoveTo(Alias_StanleyMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetObjectiveDisplayed(200, False, False)
  Self.SetObjectiveDisplayed(300, False, False)
  Self.SetObjectiveDisplayed(400, False, False)
  Self.SetObjectiveDisplayed(500, False, False)
  Self.SetObjectiveDisplayed(525, False, False)
  Self.SetObjectiveDisplayed(550, False, False)
  Self.SetObjectiveDisplayed(600, False, False)
  Self.SetObjectiveDisplayed(700, False, False)
  If !Self.GetStageDone(800)
    Self.SetStage(710)
  EndIf
  RI03_SimonDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0229_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_AndrejaCredits.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_LessCredits.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0231_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_Credits.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0232_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_MoreCredits.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  RI03_SpaceEncounter.Start()
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 4.0)
  Utility.Wait(3.0)
  RI03_350_Malai_HailingScene.Start()
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0361_Item_00()
  RI03_PlayerMentionsSimon.SetValue(1.0)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetStage(400)
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 3.0)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(400, True, False)
  RI03_SpaceEncounter.SetStage(200)
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 3.0)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetStage(450)
EndFunction

Function Fragment_Stage_0420_Item_00()
  If !Self.GetStageDone(700) && Game.GetPlayer().GetItemCount(LL_Weapon_Reward_RI03_Ember as Form) == 0
    Alias_MalaiShip.GetShipRef().AddAliasedItem(LL_Weapon_Reward_RI03_Ember as Form, Alias_MalaiGun as Alias, 1, True)
    Self.SetStage(450)
  EndIf
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Self.GetStageDone(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
  Self.SetStage(600)
  RI03_MalaiDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0525_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(525, True, False)
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 0.0)
EndFunction

Function Fragment_Stage_0550_Item_00()
  If !Self.GetStageDone(410)
    Self.SetObjectiveDisplayed(550, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If Self.GetStageDone(400) && Alias_MalaiShip.GetShipRef().IsDead()
    Self.SetObjectiveCompleted(400, True)
  Else
    Self.SetObjectiveDisplayed(400, False, False)
  EndIf
  If Self.GetStageDone(500)
    Self.SetObjectiveCompleted(500, True)
  EndIf
  If Self.GetStageDone(525)
    Self.SetObjectiveCompleted(525, True)
  EndIf
  If Self.GetStageDone(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
  Self.SetObjectiveDisplayed(600, True, False)
  If Self.GetStageDone(430)
    Self.SetStage(620)
  EndIf
EndFunction

Function Fragment_Stage_0620_Item_00()
  If !Self.GetStageDone(650) && !Self.GetStageDone(450)
    Self.SetStage(550)
  EndIf
  Actor MalaiRef = Alias_Malai.GetActorRef()
  MalaiRef.SetValue(Aggression, 2.0)
  MalaiRef.AddToFaction(PlayerEnemyFaction)
  MalaiRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  Alias_MalaiShipTurrets.SetUnconscious(False)
EndFunction

Function Fragment_Stage_0625_Item_00()
  Alias_Malai.GetRef().AddAliasedItem(LL_Weapon_Reward_RI03_Ember as Form, Alias_MalaiGun as Alias, 1, True)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Game.GetPlayer().AddItem(Alias_MalaiGun.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
  If Self.GetStageDone(400)
    Self.SetObjectiveCompleted(400, True)
  EndIf
  If Self.GetStageDone(500)
    Self.SetObjectiveCompleted(500, True)
  EndIf
  If Self.GetStageDone(525)
    Self.SetObjectiveCompleted(525, True)
  EndIf
  If Self.GetStageDone(550)
    Self.SetObjectiveCompleted(550, True)
  EndIf
  Actor PlayerRef = Game.GetPlayer()
  If PlayerRef.GetItemCount(RI03_Eon_MalaiLiskovaGun as Form) == 0
    PlayerRef.AddItem(Alias_MalaiGun.GetRef() as Form, 1, False)
  EndIf
  BE_RI03.SetStage(150)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveDisplayed(710, True, False)
EndFunction

Function Fragment_Stage_0720_Item_00()
  If Self.GetStageDone(730) && Self.GetStageDone(740)
    Self.SetObjectiveCompleted(710, True)
    Self.SetStage(800)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0730_Item_00()
  If Self.GetStageDone(720) && Self.GetStageDone(740)
    Self.SetObjectiveCompleted(710, True)
    Self.SetStage(800)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0740_Item_00()
  If Self.GetStageDone(720) && Self.GetStageDone(730)
    Self.SetObjectiveCompleted(710, True)
    Self.SetStage(800)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0750_Item_00()
  If !Self.GetStageDone(700)
    Self.SetObjectiveCompleted(200, True)
  Else
    Self.SetObjectiveCompleted(700, True)
  EndIf
  Self.SetStage(800)
  Self.SetStage(900)
  ObjectReference MyPlayer = Game.GetPlayer() as ObjectReference
  MyPlayer.AddItem(Alias_StanleyFile.GetRef() as Form, 1, False)
  MyPlayer.AddItem(Alias_StanleyAudio.GetRef() as Form, 1, False)
  MyPlayer.AddItem(Alias_DataDisk.GetRef() as Form, 1, False)
  If Self.GetStageDone(700)
    Alias_MalaiGun.Clear()
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True)
  If Self.GetStageDone(950)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(900, True)
  If Self.GetStageDone(850)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_10000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  Self.SetObjectiveCompleted(1300, True)
  RI04.SetStage(100)
  kmyQuest.AddFinalValues()
  Game.GetPlayer().SetValue(RI03_Foreknowledge_MetUlaruAV, 1.0)
  Game.GetPlayer().SetValue(RI03_Foreknowledge_KnowsProjectDominionAV, 1.0)
  Actor StanleyRef = Alias_Stanley.GetActorRef()
  StanleyRef.RemoveFromFaction(CrimeFactionUC)
  StanleyRef.SetCrimeFaction(None)
  StanleyRef.MoveTo(Alias_InfinityLTDMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Simon.GetRef().Disable(False)
  Alias_StanleyTerminal.GetRef().Disable(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveDisplayed(1000, True, False)
  Alias_UlaruChairSwapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1010_Item_00()
  RI03_PlayerMetStanley.SetValue(1.0)
EndFunction

Function Fragment_Stage_1070_Item_00()
  Self.SetStage(1080)
EndFunction

Function Fragment_Stage_1080_Item_00()
  Alias_Stanley.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest
  ri03_questscript kmyQuest = __temp as ri03_questscript
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveDisplayed(300, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(400)
    Self.SetObjectiveDisplayed(400, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(500)
    Self.SetObjectiveDisplayed(500, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(525)
    Self.SetObjectiveDisplayed(525, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(550)
    Self.SetObjectiveDisplayed(550, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(600)
    Self.SetObjectiveDisplayed(600, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(700)
    Self.SetObjectiveDisplayed(700, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(710)
    Self.SetObjectiveDisplayed(710, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(1000)
    Self.SetObjectiveCompleted(1000, True)
  EndIf
  If Self.IsObjectiveDisplayed(800)
    Self.SetObjectiveDisplayed(800, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(900)
    Self.SetObjectiveDisplayed(900, False, False)
  EndIf
  Self.SetObjectiveDisplayed(1100, True, False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.RemoveItem(Alias_DataDisk.GetRef() as Form, 1, True, None)
  PlayerRef.AddItem(Alias_SlateProjectDominion.GetRef() as Form, 1, True)
EndFunction

Function Fragment_Stage_1110_Item_00()
  Alias_Ularu.GetRef().AddItem(Alias_SlateProjectDominion.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
  Alias_Ularu.GetActorRef().EvaluatePackage(False)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_Ularu.GetRef().RemoveItem(Alias_SlateProjectDominion.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1210_Item_00()
  RI03_1200_Masako_MeetingScene.Start()
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1300, True, False)
  Alias_Masako.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1310_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
