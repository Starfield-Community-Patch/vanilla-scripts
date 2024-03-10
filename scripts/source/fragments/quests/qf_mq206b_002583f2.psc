ScriptName Fragments:Quests:QF_MQ206B_002583F2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ206B_001_IntroScene Auto Const mandatory
Scene Property MQ206B_003_KeeperAquilus Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ReferenceAlias Property Alias_MatteoKhatri Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_KeeperAquilus Auto Const mandatory
ObjectReference Property MQ206B_AquilusTravelMarker01 Auto Const mandatory
ObjectReference Property MQ206B_MatteoTravelMarker01 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Scene Property MQ206B_002_AquilusMatteoScene Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Scene Property MQ206B_004b_Matteo Auto Const mandatory
ObjectReference Property MQ206B_MatteoMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Mirza Auto Const mandatory
Quest Property MQ207 Auto Const mandatory
ReferenceAlias Property Alias_PilgrimDoor Auto Const mandatory
ObjectReference Property MQ206B_Quickstart1 Auto Const mandatory
ObjectReference Property LC134Start Auto Const mandatory
Perk Property TraitRaisedUniversal Auto Const mandatory
Perk Property TraitRaisedEnlightened Auto Const mandatory
Perk Property TraitSerpentsEmbrace Auto Const mandatory
Quest Property City_NA_Aquilus01 Auto Const mandatory
LeveledItem Property MQ206B_UniversalGift Auto Const mandatory
LeveledItem Property MQ206B_EnlightenedGift Auto Const mandatory
LeveledItem Property MQ206B_VaruunGift Auto Const mandatory
ObjectReference Property MQ206B_Hyla_PlayerMarker Auto Const mandatory
ReferenceAlias Property Alias_HylaBoss Auto Const mandatory
ObjectReference Property MQ206BPuzzleEnableMarker Auto Const mandatory
Scene Property MQ206B_004_Inside Auto Const mandatory
ObjectReference Property ScorpiusPuzzleMapMarkerREF Auto Const mandatory
ObjectReference Property PilgrimsRestMapMarkerREF Auto Const mandatory
Quest Property MQ204_NA_StateChangeHandler Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  MQ204.SetStage(620)
  PlayerREF.AddPerk(TraitRaisedUniversal, False)
  PlayerREF.AddPerk(TraitRaisedEnlightened, False)
  PlayerREF.AddPerk(TraitSerpentsEmbrace, False)
  PlayerREF.moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  Self.SetStage(100)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(200)
  PlayerREF.AddPerk(TraitRaisedUniversal, False)
  PlayerREF.AddPerk(TraitRaisedEnlightened, False)
  PlayerREF.AddPerk(TraitSerpentsEmbrace, False)
  PlayerREF.moveto(MQ206B_Quickstart1, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(670)
  Self.SetStage(680)
  Game.GetPlayer().moveto(LC134Start, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().moveto(MQ206B_Hyla_PlayerMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Mirza.GetActorRef().Enable(False)
  MQ206BPuzzleEnableMarker.Enable(False)
  ScorpiusPuzzleMapMarkerREF.Enable(False)
  PilgrimsRestMapMarkerREF.Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_MatteoKhatri.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_MatteoKhatri.GetActorRef().moveto(MQ206B_MatteoMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ204.SetStage(1000)
  MQ204_NA_StateChangeHandler.SetStageNoWait(100)
  Self.SetObjectiveDisplayed(10, True, False)
  Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
  MatteoREF.EvaluatePackage(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0110_Item_00()
  City_NA_Aquilus01.SetStage(200)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Actor KeeperAquilusREF = Alias_KeeperAquilus.GetActorRef()
  Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
  KeeperAquilusREF.EvaluatePackage(False)
  MatteoREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Actor KeeperAquilusREF = Alias_KeeperAquilus.GetActorRef()
  Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
  KeeperAquilusREF.moveto(MQ206B_AquilusTravelMarker01, 0.0, 0.0, 0.0, True, False)
  MatteoREF.moveto(MQ206B_MatteoTravelMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  MQ206B_004_Inside.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  MQ206B_004b_Matteo.Start()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().additem(MQ206B_UniversalGift as Form, 1, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Game.GetPlayer().additem(MQ206B_EnlightenedGift as Form, 1, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().additem(MQ206B_VaruunGift as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(40, True)
  If Self.GetStageDone(400)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(50, True)
  If Self.GetStageDone(300)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayed(60, True, False)
  Alias_MatteoKhatri.GetActorRef().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveDisplayed(75, True, False)
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveCompleted(74, True)
  Self.SetObjectiveCompleted(75, True)
  Self.SetObjectiveDisplayed(77, True, False)
  ObjectReference PilgrimDoorREF = Alias_PilgrimDoor.GetRef()
  PilgrimDoorREF.Lock(False, False, True)
  PilgrimDoorREF.SetOpen(True)
EndFunction

Function Fragment_Stage_0670_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(72, True, False)
EndFunction

Function Fragment_Stage_0680_Item_00()
  Self.SetObjectiveCompleted(72, True)
  Self.SetObjectiveDisplayed(74, True, False)
EndFunction

Function Fragment_Stage_0690_Item_00()
  Self.SetObjectiveCompleted(77, True)
  Self.SetObjectiveDisplayed(79, True, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(690)
  Self.SetObjectiveCompleted(79, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Alias_HylaBoss.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0720_Item_00()
  Self.SetObjectiveDisplayed(80, True, True)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
  MQ207.Start()
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(90, True, False)
  MQ207.Start()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(2000)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  MQ207.SetStage(10)
  Self.Stop()
EndFunction

Function Fragment_Stage_3000_Item_00()
  Alias_Mirza.GetActorRef().Disable(False)
EndFunction
