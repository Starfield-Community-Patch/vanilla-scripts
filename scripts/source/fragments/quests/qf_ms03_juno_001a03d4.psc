ScriptName Fragments:Quests:QF_MS03_Juno_001A03D4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MS03_Juno_Arrival Auto Const mandatory
Scene Property MS03_Juno_Space_PostCombat Auto Const mandatory
ReferenceAlias Property Alias_RyujinOperative1 Auto Const mandatory
ReferenceAlias Property Alias_RyujinOperative2 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Perk Property MS03_JunoActivationPromptPerk Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_RyujinShip Auto Const mandatory
ReferenceAlias Property Alias_JunoMysteriousName Auto Const mandatory
RefCollectionAlias Property Alias_EclipticShips Auto Const mandatory
ReferenceAlias Property Alias_InsideShipStartMarker Auto Const mandatory
Scene Property MS03_Space_Initial Auto Const mandatory
ReferenceAlias Property Alias_SceneStartMarker Auto Const mandatory
ReferenceAlias Property Alias_JunoShip Auto Const mandatory
ReferenceAlias Property Alias_JunoHoldingCellMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Scene Property MS03_Juno_JumpAway_Switchboard Auto Const mandatory
ReferenceAlias Property Alias_ControlBoard Auto Const mandatory
GlobalVariable Property MS03Outcome Auto Const
ObjectReference Property SoundMarkerEnabler Auto Const
wwiseevent Property JunoShutdownEvent Auto Const
ObjectReference Property Juno00 Auto Const
ActorValue Property DockingPermission Auto Const
ObjectReference Property JunoActivationVolume Auto Const
ObjectReference Property JunoDoor Auto Const
Faction Property RyujinFaction Auto Const
GlobalVariable Property SE_Player_FAB19a_Timestamp Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB19b_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_RyujinShip.GetShipRef().Kill(None)
  Alias_RyujinOperative1.GetActorReference().SetEssential(True)
  Alias_RyujinOperative2.GetActorReference().SetEssential(True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Player.GetActorReference().AddPerk(MS03_JunoActivationPromptPerk, False)
  Self.SetObjectiveCompleted(10, True)
  MS03_Juno_Space_PostCombat.Start()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0101_Item_00()
  Self.SetStage(10)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Alias_EclipticShips.KillAll(None)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  MS03_Juno_Arrival.Start()
  Self.SetObjectiveDisplayed(110, True, False)
  JunoActivationVolume.BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0111_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Game.GetPlayer().MoveTo(Alias_InsideShipStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_PlayerShip.GetShipReference().InstantDock(Alias_JunoShip.GetShipReference() as ObjectReference)
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0112_Item_00()
  Juno00.PlayAnimation("Play01")
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_RyujinOperative2.GetActorRef().EvaluatePackage(False)
  Alias_RyujinOperative1.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0201_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Game.GetPlayer().MoveTo(Alias_SceneStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Alias_RyujinOperative1.GetRef().RemoveItem(Alias_ControlBoard.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_ControlBoard.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0301_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveDisplayed(350, True, False)
  Alias_JunoMysteriousName.ForceRefTo(None)
  JunoActivationVolume.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0351_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  Self.SetStage(301)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Self.SetStage(350)
EndFunction

Function Fragment_Stage_0355_Item_00()
  Alias_RyujinOperative1.GetActorReference().SetEssential(False)
  Alias_RyujinOperative2.GetActorReference().SetEssential(False)
  Alias_RyujinOperative1.GetActorReference().SetGhost(False)
  Alias_RyujinOperative2.GetActorReference().SetGhost(False)
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(352, True, False)
  Self.SetObjectiveDisplayed(355, True, False)
EndFunction

Function Fragment_Stage_0356_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  Self.SetStage(301)
  Self.SetStage(351)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Self.SetStage(355)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveSkipped(300)
  Self.SetObjectiveCompleted(355, True)
  Self.SetStage(550)
  Alias_RyujinOperative1.GetActorReference().SetEssential(True)
  Alias_RyujinOperative2.GetActorReference().SetEssential(True)
  Game.GetPlayer().RemoveItem(Alias_ControlBoard.GetRef() as Form, 1, False, None)
  Alias_RyujinOperative1.GetActorRef().AddItem(Alias_ControlBoard.GetRef() as Form, 1, False)
  Alias_RyujinOperative1.GetActorReference().SetGhost(True)
  Alias_RyujinOperative2.GetActorReference().SetGhost(True)
EndFunction

Function Fragment_Stage_0401_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  Self.SetStage(301)
  Self.SetStage(351)
  Self.SetStage(356)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.GetStageDone(420)
    Self.SetStage(490)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(410)
    Self.SetStage(490)
  EndIf
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.SetObjectiveCompleted(355, True)
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0491_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  Self.SetStage(301)
  Self.SetStage(351)
  Self.SetStage(356)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Alias_RyujinOperative1.TryToKill(None)
  Alias_RyujinOperative2.TryToKill(None)
  Self.SetStage(490)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Player.GetActorReference().RemovePerk(MS03_JunoActivationPromptPerk)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(352, True)
  Self.SetObjectiveDisplayed(500, True, False)
  If Self.IsObjectiveDisplayed(350)
    Self.SetObjectiveDisplayed(350, False, False)
  EndIf
  Game.GetPlayer().AddToFaction(RyujinFaction)
  Alias_RyujinOperative1.GetActorReference().SetEssential(True)
  Alias_RyujinOperative2.GetActorReference().SetEssential(True)
  Alias_RyujinOperative1.GetActorReference().IgnoreFriendlyHits(True)
  Alias_RyujinOperative2.GetActorReference().IgnoreFriendlyHits(True)
  Game.GetPlayer().RemoveItem(Alias_ControlBoard.GetRef() as Form, 1, False, None)
  MS03Outcome.SetValue(1.0)
  Juno00.BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0501_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  Self.SetStage(301)
  Self.SetStage(351)
  Self.SetStage(356)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveSkipped(300)
  Self.SetObjectiveDisplayed(550, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveCompleted(550, True)
  Self.SetObjectiveDisplayed(600, True, False)
  If Self.IsObjectiveDisplayed(350)
    Self.SetObjectiveDisplayed(350, False, False)
  EndIf
  JunoDoor.Unlock(False)
  JunoDoor.SetOpen(True)
  If Self.GetStageDone(400)
    Self.SetObjectiveDisplayed(400, True, False)
    kmyQuest.AddPassenger(Alias_RyujinOperative1)
    kmyQuest.AddPassenger(Alias_RyujinOperative2)
  EndIf
  Juno00.BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0601_Item_00()
  Self.SetStage(10)
  Self.SetStage(101)
  Self.SetStage(111)
  Self.SetStage(201)
  Self.SetStage(301)
  Self.SetStage(351)
  Self.SetStage(356)
  Self.SetStage(401)
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Alias_JunoShip.GetShipRef().SetValue(DockingPermission, 4.0)
  MS03_Juno_JumpAway_Switchboard.Start()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Alias_JunoShip.GetShipRef().SetGhost(False)
  Alias_JunoShip.GetShipRef().IsEssential(False)
  spaceshipreference shipRef = Alias_JunoShip.GetShipReference()
  shipRef.DisableWithGravJump()
  shipRef.MoveTo(Alias_JunoHoldingCellMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(400) == False
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.GetStageDone(400) == False
    Self.SetStage(9999)
  EndIf
  Float currentGameTime = Utility.GetCurrentGameTime()
  SE_Player_FAB19a_Timestamp.SetValue(currentGameTime + cooldownDays)
  SE_Player_FAB19b_Timestamp.SetValue(currentGameTime + cooldownDays)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Alias_RyujinOperative1.GetActorRef().Disable(False)
  Alias_RyujinOperative2.GetActorRef().Disable(False)
  Self.Stop()
EndFunction
