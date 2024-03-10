ScriptName Fragments:Quests:QF_COM_Quest_Barrett_Q02_00002FAE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_companionsscript Property SQ_Companions Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
Perk Property StarbornPerk Auto Const mandatory
Scene Property Scene_HelloBarrett Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_LandingPad Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_OtherBarrett Auto Const mandatory
ReferenceAlias Property Alias_MapMarker_Temple Auto Const mandatory
ReferenceAlias Property Alias_OtherBarrett Auto Const mandatory
ReferenceAlias Property Alias_Activator_Temple_Puzzle Auto Const mandatory
ReferenceAlias Property Alias_Actor_Starborn Auto Const mandatory
ReferenceAlias Property Alias_Spaceship_Starborn Auto Const mandatory
ReferenceAlias Property Alias_Marker_HoldingCell Auto Const mandatory
Scene Property Scene_ArrivedAtTemple Auto Const mandatory
Scene Property Scene_InsideTemple Auto Const mandatory
Scene Property Scene_SolvedPuzzle Auto Const mandatory
Scene Property Scene_BarrettUsesPower Auto Const mandatory
Scene Property Scene_OtherBarrettAppears Auto Const mandatory
Scene Property Scene_BarrettReplies Auto Const mandatory
Scene Property Scene_LosingPower Auto Const mandatory
Scene Property Scene_OtherBarrettExitWarning Auto Const mandatory
Scene Property Scene_CherishThem Auto Const mandatory
Scene Property Scene_AlreadyDo Auto Const mandatory
Quest Property BarrettQuest Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_Player Auto Const mandatory
ReferenceAlias Property Alias_Activator_Temple_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Activator_Temple_TriggerEntry Auto Const mandatory
Explosion Property BE_KT02_ExplosionHavok Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
Scene Property BQ01_Scene_GREET_8700_TalkToBarretts Auto Const mandatory
ActorValue Property COM_Quest_Barrett_Q01_Complete_AV Auto Const mandatory
Message Property BQ02CompanionLockInMSG Auto Const mandatory
Message Property BQ02CompanionLockInOverMSG Auto Const mandatory
Scene Property SceneThankYou Auto Const mandatory
Scene Property ScenePuzzleSolved Auto Const mandatory
LocationAlias Property BarrettTempleLocationAlias Auto Const mandatory
LocationAlias Property Alias_Location_Temple Auto Const mandatory
Scene Property BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved Auto Const mandatory
ActorValue Property COM_Quest_Barrett_Q02_Complete_AV Auto Const mandatory
Spell Property BarrettSpell Auto Const mandatory
RefCollectionAlias Property Alias_CollisionMarkers Auto Const mandatory
Spell Property AbStarbornTeleportAlt Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_Starborn Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Spell Property AIPower_ParallelSelf Auto Const mandatory
Armor[] Property BarrettSpacesuitForms Auto Const mandatory
GlobalVariable Property COM_BQ01_WaitToggle Auto Const mandatory
ReferenceAlias Property Alias_PlayerPilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0002_Item_00()
  (Alias_Activator_Temple_Trigger.GetRef() as sbringpuzzlenewscript).CompletePuzzle()
  BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved.Start()
EndFunction

Function Fragment_Stage_0011_Item_00()
  Alias_OtherBarrett.GetRef().MoveTo(Alias_Marker_HoldingCell.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_OtherBarrett.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_7401_Item_00()
  Self.SetStage(8300)
EndFunction

Function Fragment_Stage_8000_Item_00()
  If !Self.GetStageDone(8010)
    Self.SetStage(8100)
  Else
    Self.SetStage(8300)
  EndIf
EndFunction

Function Fragment_Stage_8001_Item_00()
  Self.SetStage(8401)
EndFunction

Function Fragment_Stage_8010_Item_00()
  Self.SetStage(8120)
  Self.SetStage(8301)
EndFunction

Function Fragment_Stage_8100_Item_00()
  Self.SetObjectiveDisplayed(8100, True, False)
EndFunction

Function Fragment_Stage_8101_Item_00()
  If Self.GetStageDone(8120) && !Self.GetStageDone(8110)
    Self.SetObjectiveSkipped(8100)
  Else
    Self.SetObjectiveCompleted(8100, True)
  EndIf
  Self.SetStage(8300)
EndFunction

Function Fragment_Stage_8111_Item_00()
  Self.SetStage(8120)
EndFunction

Function Fragment_Stage_8112_Item_00()
  Self.SetStage(8120)
EndFunction

Function Fragment_Stage_8120_Item_00()
  Self.SetStage(8101)
EndFunction

Function Fragment_Stage_8200_Item_00()
  Self.SetStage(8300)
EndFunction

Function Fragment_Stage_8300_Item_00()
  Quest __temp = Self as Quest
  bq01_questscript kmyQuest = __temp as bq01_questscript
  Self.SetObjectiveCompleted(7500, True)
  Self.SetObjectiveDisplayed(8300, True, False)
  kmyQuest.TempleDiscovered()
  BarrettTempleLocationAlias.ForceLocationTo(Alias_Location_Temple.GetLocation())
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, True, BQ02CompanionLockInMSG, None)
  COM_BQ01_WaitToggle.SetValue(1.0)
  SQ_Followers.CommandFollow(BarrettRef)
EndFunction

Function Fragment_Stage_8301_Item_00()
  Self.SetObjectiveCompleted(8300, True)
  Self.SetStage(8400)
  Self.SetStage(8310)
EndFunction

Function Fragment_Stage_8310_Item_00()
  Scene_ArrivedAtTemple.Start()
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_8400_Item_00()
  Self.SetObjectiveDisplayed(8400, True, False)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_8401_Item_00()
  Self.SetObjectiveCompleted(8400, True)
EndFunction

Function Fragment_Stage_8405_Item_00()
  Alias_Marker_Temple_OtherBarrett.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_8410_Item_00()
  Self.SetStage(8415)
  Self.SetStage(8500)
EndFunction

Function Fragment_Stage_8415_Item_00()
  ObjectReference BarrettRef = Alias_Barrett.GetRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  If PlayerRef.GetDistance(BarrettRef) > 10.0
    BarrettRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  EndIf
  Scene_InsideTemple.Start()
EndFunction

Function Fragment_Stage_8500_Item_00()
  Quest __temp = Self as Quest
  bq01_questscript kmyQuest = __temp as bq01_questscript
  kmyQuest.BQ01_Enablelayer = inputenablelayer.Create()
  kmyQuest.BQ01_Enablelayer.EnableFastTravel(False)
  kmyQuest.BQ01_Enablelayer.EnableGravJump(False)
  kmyQuest.BQ01_Enablelayer.EnableFarTravel(False)
  Alias_PlayerPilotSeat.RefillAlias()
  Alias_PlayerPilotSeat.GetRef().BlockActivation(True, True)
EndFunction

Function Fragment_Stage_8501_Item_00()
  Quest __temp = Self as Quest
  bq01_questscript kmyQuest = __temp as bq01_questscript
  BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved.Stop()
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
  BarrettRef.MoveTo(Alias_Marker_Temple_Barrett.GetRef(), 0.0, 0.0, 0.0, True, False)
  BarrettRef.AddSpell(AbStarbornTeleport, True)
  BarrettRef.SetGhost(True)
  BarrettRef.SetRestrained(True)
  OtherBarrettRef.MoveTo(Alias_Marker_Temple_OtherBarrett.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_8502_Item_00()
  ScenePuzzleSolved.Start()
EndFunction

Function Fragment_Stage_8505_Item_00()
  Quest __temp = Self as Quest
  bq01_questscript kmyQuest = __temp as bq01_questscript
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  BarrettRef.EvaluatePackage(False)
  Utility.Wait(2.0)
  Self.SetStage(8510)
  Self.SetStage(8600)
  ObjectReference WaitMarkerRef = Alias_Marker_Temple_Barrett.GetRef()
  SQ_Followers.CommandWait(Alias_Barrett.GetActorRef(), WaitMarkerRef)
EndFunction

Function Fragment_Stage_8510_Item_00()
  Scene_BarrettUsesPower.Start()
EndFunction

Function Fragment_Stage_8600_Item_00()
  Self.SetObjectiveDisplayed(8600, True, False)
  Self.SetStage(8605)
EndFunction

Function Fragment_Stage_8601_Item_00()
  Self.SetObjectiveCompleted(8600, True)
  Self.SetStage(8700)
EndFunction

Function Fragment_Stage_8605_Item_00()
  Self.SetStage(8610)
  Self.SetStage(8001)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_8615_Item_00()
  Quest __temp = Self as Quest
  bq01_questscript kmyQuest = __temp as bq01_questscript
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  Scene_BarrettUsesPower.Stop()
  Utility.Wait(1.5)
  OtherBarrettRef.Enable(False)
  OtherBarrettRef.MoveTo(Alias_Marker_Temple_OtherBarrett.GetRef(), 0.0, 0.0, 0.0, True, False)
  OtherBarrettRef.AddSpell(AbStarbornTeleport, True)
  OtherBarrettRef.SetRestrained(True)
  OtherBarrettRef.SetGhost(True)
  Int I = 0
  While I < BarrettSpacesuitForms.Length
    If BarrettRef.IsEquipped(BarrettSpacesuitForms[I] as Form)
      OtherBarrettRef.EquipItem(BarrettSpacesuitForms[I] as Form, False, False)
    EndIf
    I += 1
  EndWhile
  BarrettRef.EvaluatePackage(False)
  kmyQuest.BQ01_Enablelayer.EnableMenu(True)
  Self.SetStage(8620)
EndFunction

Function Fragment_Stage_8620_Item_00()
  Scene_OtherBarrettAppears.Start()
EndFunction

Function Fragment_Stage_8625_Item_00()
  Scene_OtherBarrettAppears.Stop()
  Scene_BarrettReplies.Start()
  Self.SetStage(8700)
EndFunction

Function Fragment_Stage_8700_Item_00()
  Self.SetObjectiveDisplayed(8700, True, False)
  Alias_OtherBarrett.GetActorRef().SetGhost(False)
  Alias_Barrett.GetActorRef().SetGhost(False)
  Self.SetStage(8601)
EndFunction

Function Fragment_Stage_8701_Item_00()
  Self.SetObjectiveCompleted(8700, True)
  Self.SetStage(8800)
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
  BarrettRef.SetRestrained(False)
  BarrettRef.EvaluatePackage(False)
  OtherBarrettRef.SetRestrained(False)
  OtherBarrettRef.EvaluatePackage(False)
  SQ_Followers.CommandFollow(BarrettRef)
EndFunction

Function Fragment_Stage_8713_Item_00()
  spaceshipreference StarbornRef = Alias_Spaceship_Starborn.GetShipRef()
EndFunction

Function Fragment_Stage_8714_Item_00()
  spaceshipreference StarbornRef = Alias_Spaceship_Starborn.GetShipRef()
  StarbornRef.EnableNoWait(False)
  StarbornRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_8720_Item_00()
  BQ01_Scene_GREET_8700_TalkToBarretts.Stop()
  Self.SetStage(8701)
  If Self.GetStageDone(8812)
    Utility.Wait(2.0)
    Self.SetStage(8805)
  EndIf
EndFunction

Function Fragment_Stage_8800_Item_00()
  Self.SetObjectiveDisplayed(8800, True, False)
EndFunction

Function Fragment_Stage_8801_Item_00()
  Self.SetObjectiveCompleted(8800, True)
  Self.SetStage(8900)
EndFunction

Function Fragment_Stage_8805_Item_00()
  Utility.Wait(3.0)
  Actor StarbornRef = Alias_Actor_Starborn.GetActorRef()
  StarbornRef.Enable(False)
  StarbornRef.MoveTo(Alias_Marker_Temple_Starborn.GetRef(), 0.0, 0.0, 0.0, True, False)
  StarbornRef.AddSpell(AbStarbornTeleport, True)
EndFunction

Function Fragment_Stage_8812_Item_00()
  If Self.GetStageDone(8701) && Self.GetStageDone(8720)
    Self.SetStage(8805)
  EndIf
EndFunction

Function Fragment_Stage_8820_Item_00()
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  BarrettRef.EvaluatePackage(False)
  OtherBarrettRef.EvaluatePackage(False)
  BarrettRef.BlockActivation(False, True)
  Self.SetStage(8830)
  Self.SetStage(8801)
EndFunction

Function Fragment_Stage_8830_Item_00()
  Scene_LosingPower.Start()
EndFunction

Function Fragment_Stage_8850_Item_00()
  Utility.Wait(3.5)
  Alias_OtherBarrett.GetActorRef().AddSpell(AbStarbornDeath, True)
EndFunction

Function Fragment_Stage_8860_Item_00()
  ObjectReference OtherBarrettRef = Alias_OtherBarrett.GetRef()
  Utility.Wait(0.5)
  OtherBarrettRef.Disable(False)
  SceneThankYou.Start()
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.SetObjectiveDisplayed(8900, True, False)
  Alias_Barrett.GetActorRef().BlockActivation(False, False)
EndFunction

Function Fragment_Stage_8901_Item_00()
  Self.SetObjectiveCompleted(8900, True)
  If Self.GetStageDone(275)
    Self.SetStage(280)
  Else
    Self.SetStage(9000)
  EndIf
EndFunction

Function Fragment_Stage_8920_Item_00()
  Self.SetStage(8930)
  Self.SetStage(8901)
EndFunction

Function Fragment_Stage_8930_Item_00()
  If Self.GetStageDone(275) && !Self.GetStageDone(280)
    Self.SetStage(280)
  EndIf
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  bq01_questscript kmyQuest = __temp as bq01_questscript
  Actor BarrettRef = Alias_Barrett.GetActorRef()
  If !COM_Quest_Barrett_Q01.IsRunning()
    SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, False, BQ02CompanionLockInOverMSG, None)
    COM_BQ01_WaitToggle.SetValue(0.0)
  EndIf
  BarrettRef.RemoveSpell(AbStarbornTeleport)
  BarrettRef.AddSpell(AIPower_ParallelSelf, True)
  Game.GetPlayer().SetValue(COM_Quest_Barrett_Q02_Complete_AV, 1.0)
  Alias_CollisionMarkers.DisableAll(False)
  kmyQuest.BQ01_Enablelayer.Delete()
  Alias_PlayerPilotSeat.GetRef().BlockActivation(False, False)
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

Function Fragment_Stage_9999_Item_00()
  Self.SetStage(8860)
  Self.CompleteAllObjectives()
EndFunction
