ScriptName Fragments:Quests:QF_City_ER_Exorcism_0016B466 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ER_Exorcism_BountyHunterFaction_Enemy Auto Const mandatory
ReferenceAlias Property Alias_Tracker01 Auto Const mandatory
ReferenceAlias Property Alias_Tracker02 Auto Const mandatory
ObjectReference Property City_ER_Ghost_DebugMarker01 Auto Const mandatory
ObjectReference Property City_ER_Ghost_DebugMarker02 Auto Const mandatory
Message Property ER_DEBUG_Exorcism_OptionalPaths Auto Const mandatory
Quest Property City_ER_Peace Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerKilledTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStartedTrackersNegotiation Auto Const mandatory
GlobalVariable Property ER_Exorcism_NevanBribeCredits Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
ReferenceAlias Property Alias_DungeonDebugMarker Auto Const mandatory
GlobalVariable Property ER_Dead_KilmansReturned Auto Const mandatory
Quest Property City_ER_Ghost Auto Const mandatory
Perk Property BackgroundBountyHunter Auto Const mandatory
ReferenceAlias Property Alias_HunterSpawn01 Auto Const mandatory
ReferenceAlias Property Alias_HunterSpawn02 Auto Const mandatory
Message Property DEBUG_Exorcism_SitError Auto Const mandatory
ReferenceAlias Property Alias_DungeonDebugMarker02 Auto Const mandatory
ReferenceAlias Property Alias_WaitChair Auto Const mandatory
Message Property ER_Exorcism_ChairDisplayNameOverride Auto Const mandatory
GlobalVariable Property ER_Exorcism_HunterBribeCredits Auto Const mandatory
ActorValue Property City_ER_Exorcism_Foreknowledge_IntimidatedTrackersAV Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerBribedTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStarbornedTrackers Auto Const mandatory
Scene Property City_ER_Exorcism_145_SloanResponse Auto Const mandatory
Scene Property City_ER_Exorcism_0310_Trackers_SpotPlayer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19)
  Game.GetPlayer().MoveTo(City_ER_Ghost_DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19)
  Game.GetPlayer().MoveTo(Alias_DungeonDebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(19)
  Self.SetStage(500)
  Game.GetPlayer().MoveTo(City_ER_Ghost_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_DungeonDebugMarker02.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(300)
  Utility.Wait(100.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(140)
  Game.GetPlayer().AddPerk(BackgroundBountyHunter, False)
EndFunction

Function Fragment_Stage_0019_Item_00()
  ER_Dead_KilmansReturned.SetValue(1.0)
  DialogueEleosRetreat.SetStage(900)
  City_ER_Ghost.SetStage(1000)
  DialogueEleosRetreat.SetStage(25)
  DialogueEleosRetreat.SetStage(40)
  DialogueEleosRetreat.SetStage(50)
  DialogueEleosRetreat_OpeningScene.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetObjectiveDisplayed(110, True, False)
  Self.SetActive(True)
  Alias_WaitChair.GetRef().SetActivateTextOverride(ER_Exorcism_ChairDisplayNameOverride)
EndFunction

Function Fragment_Stage_0110_Item_00()
  If Self.GetStageDone(330)
    Self.SetStage(350)
  EndIf
  If Self.GetStageDone(120) && Self.GetStageDone(130) && Self.GetStageDone(140)
    Self.SetStage(150)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  If Self.GetStageDone(110) && Self.GetStageDone(130) && Self.GetStageDone(140)
    Self.SetStage(150)
  EndIf
EndFunction

Function Fragment_Stage_0130_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, ER_Exorcism_NevanBribeCredits.GetValueInt(), False)
  If Self.GetStageDone(120) && Self.GetStageDone(110) && Self.GetStageDone(140)
    Self.SetStage(150)
  EndIf
EndFunction

Function Fragment_Stage_0140_Item_00()
  If Self.GetStageDone(120) && Self.GetStageDone(130) && Self.GetStageDone(110)
    Self.SetStage(150)
  EndIf
  Self.SetStage(145)
EndFunction

Function Fragment_Stage_0145_Item_00()
  City_ER_Exorcism_145_SloanResponse.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(290, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.FadeOutGame(True, True, 0.5, 1.0, True)
  Utility.Wait(2.0)
  Self.SetStage(305)
EndFunction

Function Fragment_Stage_0305_Item_00()
  ObjectReference TrackRef01 = Alias_Tracker01.GetRef()
  ObjectReference TrackRef02 = Alias_Tracker02.GetRef()
  TrackRef01.MoveTo(Alias_HunterSpawn01.GetRef(), 0.0, 0.0, 0.0, True, False)
  TrackRef02.MoveTo(Alias_HunterSpawn02.GetRef(), 0.0, 0.0, 0.0, True, False)
  TrackRef01.Enable(False)
  TrackRef02.Enable(False)
  Game.FadeOutGame(False, True, 0.5, 1.0, False)
  Self.SetStage(310)
EndFunction

Function Fragment_Stage_0307_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(310, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  City_ER_Exorcism_0310_Trackers_SpotPlayer.Start()
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
  Alias_WaitChair.GetRef().SetActivateTextOverride(None)
  Utility.Wait(1.0)
  Alias_Tracker01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0315_Item_00()
  City_ER_Exorcism_0310_Trackers_SpotPlayer.Stop()
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStageDone(110)
    Self.SetStage(350)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0405_Item_00()
  ER_Exorcism_PlayerStartedTrackersNegotiation.SetValue(1.0)
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, ER_Exorcism_HunterBribeCredits.GetValueInt(), False, None)
  Self.SetObjectiveCompleted(300, True)
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddToFaction(ER_Exorcism_BountyHunterFaction_Enemy)
  Alias_Tracker01.GetActorRef().StartCombat(PlayACT as ObjectReference, False)
  Alias_Tracker02.GetActorRef().StartCombat(PlayACT as ObjectReference, False)
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0470_Item_00()
  If Self.GetStageDone(480)
    Self.SetStage(490)
  EndIf
EndFunction

Function Fragment_Stage_0480_Item_00()
  If Self.GetStageDone(470)
    Self.SetStage(490)
  EndIf
EndFunction

Function Fragment_Stage_0490_Item_00()
  ER_Exorcism_PlayerKilledTrackers.SetValue(1.0)
  Self.SetObjectiveCompleted(300, True)
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().SetValue(City_ER_Exorcism_Foreknowledge_IntimidatedTrackersAV, 1.0)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(310, True)
  Self.SetObjectiveDisplayed(500, True, False)
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110)
    Self.SetObjectiveDisplayed(110, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0550_Item_00()
  Actor TrackRef01 = Alias_Tracker01.GetActorRef()
  Actor TrackRef02 = Alias_Tracker02.GetActorRef()
  If !TrackRef01.IsDead()
    TrackRef01.Disable(False)
  EndIf
  If !TrackRef02.IsDead()
    TrackRef02.Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  If !Self.GetStageDone(490)
    If Self.GetStageDone(420)
      ER_Exorcism_PlayerBribedTrackers.SetValue(1.0)
    ElseIf Self.GetStageDone(430)
      ER_Exorcism_PlayerStarbornedTrackers.SetValue(1.0)
    EndIf
  EndIf
  City_ER_Peace.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
