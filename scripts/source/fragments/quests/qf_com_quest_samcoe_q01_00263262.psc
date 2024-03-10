ScriptName Fragments:Quests:QF_COM_Quest_SamCoe_Q01_00263262 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property COM_SamCoeQ01_0310_SamStallsForTime Auto Const mandatory
ReferenceAlias Property Alias_JaylenPryce Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
Scene Property COM_SamCoeQ01_0311_SamStallsEnds Auto Const mandatory
Scene Property COM_SamCoeQ01_0510_ArrivedOutsideCI Auto Const mandatory
Scene Property COM_SamCoeQ01_0520_CIDoorScene Auto Const mandatory
Scene Property COM_SamCoeQ01_0600_MurderScene Auto Const mandatory
ReferenceAlias Property Alias_CI_Door Auto Const mandatory
Scene Property COM_SamCoeQ01_0750_LillianAlert Auto Const mandatory
GlobalVariable Property COM_SamCoeRecruited Auto Const mandatory
Scene Property COM_SamCoeQ01_0920_DumasHailed Auto Const mandatory
Scene Property COM_SamCoeQ01_1000_DumasLooted Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
RefCollectionAlias Property Alias_FirstWaveEnemies Auto Const mandatory
RefCollectionAlias Property Alias_SecondWaveEnemies Auto Const mandatory
ReferenceAlias Property Alias_ValerieMosquera Auto Const mandatory
GlobalVariable Property COM_PlayerMet_LilianHart Auto Const mandatory
ObjectReference Property LC123LandingREF Auto Const mandatory
Scene Property COM_SamCoeQ01_0875_LillianCoraReunion Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01_SpaceEnc Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
ObjectReference Property COM_SC_CacheEntranceREF Auto Const mandatory
ReferenceAlias Property Alias_LillianHart Auto Const mandatory
ReferenceAlias Property Alias_LillianTempNonHostile Auto Const mandatory
Scene Property COM_SamCoeQ01_0825_LillianShedsCover Auto Const mandatory
ActorValue Property COM_StoryGatesCompleted Auto Const mandatory
GlobalVariable Property COM_StoryGate_AffinityRequired_07_Standard Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory
ActorValue Property COM_CurrentStoryGateTimerExpired Auto Const mandatory
ActorValue Property COM_TEMP_OnPlayerShip Auto Const mandatory
ActorValue Property COM_Quest_SamCoe_CoraState Auto Const mandatory
ReferenceAlias Property Alias_CI_Clue Auto Const mandatory
Scene Property COM_SamCoeQ01_1150_LillianRepeatsMission Auto Const mandatory
ReferenceAlias Property Alias_CacheMapMarker Auto Const mandatory
ReferenceAlias Property Alias_VictorMapMarker Auto Const mandatory
ReferenceAlias Property Alias_LillianSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_CoraSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipModule Auto Const mandatory
Outfit Property Outfit_FreestarRanger Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
ReferenceAlias Property Alias_VictorCompoundPapers Auto Const mandatory
ActorValue Property COM_Quest_SamCoe_JaylenBusy Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Message Property SamCoe_AlarmMessage Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
ReferenceAlias Property Alias_CacheSecurity Auto Const mandatory
ActorValue Property COM_Quest_SamCoe_Q01_Complete_AV Auto Const mandatory
ObjectReference Property COM_SCQ01_ApartmentOverrideMarker Auto Const mandatory
Cell Property CityNeonSamCoeCIApartment Auto Const mandatory
ReferenceAlias Property Alias_VictorCompoundFinalAmbush Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const
ReferenceAlias Property Alias_ElevatorManagerApartment Auto Const mandatory
GlobalVariable Property COM_Cora_FollowingAllowed Auto Const mandatory
ReferenceAlias Property Alias_ValerieSlate Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_SamCoe Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB07_Timestamp Auto Const mandatory
GlobalVariable Property SamCoe_Q01_JaylenPrice_BlockedByFC04 Auto Const mandatory
Quest Property FC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ObjectReference oTarg = Alias_SamCoe.GetRef()
  ObjectReference oJaylen = Alias_DebugMarker.GetRef()
  oTarg.Enable(False)
  oTarg.MoveTo(oJaylen, 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_CoraCoe.GetRef()
  oTarg.Enable(False)
  oTarg.MoveTo(oJaylen, 0.0, 0.0, 0.0, True, False)
  oTarg = Game.GetPlayer() as ObjectReference
  oTarg.MoveTo(oJaylen, 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_SamCoe.GetRef()
  oTarg.SetValue(COM_StoryGatesCompleted, 6.0)
  oTarg.SetValue(COM_Affinity, COM_StoryGate_AffinityRequired_07_Standard.GetValue())
  oTarg.SetValue(COM_CurrentStoryGateTimerExpired, 1.0)
  oTarg.SetValue(COM_TEMP_OnPlayerShip, 1.0)
EndFunction

Function Fragment_Stage_0001_Item_00()
  If COM_SamCoeRecruited.GetValue() == 0.0
    COM_SamCoeRecruited.SetValue(1.0)
  EndIf
  SQ_Companions.SetRoleActive(Alias_SamCoe.GetActorRef(), True, True, 0.0, 0.0)
  SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_SamCoe)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetStage(700)
  Alias_CoraCoe.GetRef().MoveTo(LC123LandingREF, 0.0, 0.0, 0.0, True, False)
  Alias_SamCoe.GetRef().MoveTo(LC123LandingREF, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(LC123LandingREF, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetStage(850)
  Self.SetObjectiveCompleted(850, True)
  Self.SetStage(1100)
  Alias_CoraCoe.GetRef().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False)
  Alias_SamCoe.GetRef().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False)
  Alias_LillianHart.GetRef().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  If FC04.IsRunning() && !FC04.GetStageDone(900)
    Self.SetStage(110)
  Else
    Self.SetObjectiveDisplayed(75, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  If !Self.GetStageDone(300)
    SamCoe_Q01_JaylenPrice_BlockedByFC04.SetValue(1.0)
    Self.SetObjectiveDisplayed(110, True, False)
    If Self.IsObjectiveDisplayed(75) && !Self.IsObjectiveCompleted(75)
      Self.SetObjectiveDisplayed(75, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100)
      Self.SetObjectiveDisplayed(100, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(200) && !Self.IsObjectiveCompleted(200)
      Self.SetObjectiveDisplayed(200, False, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  SamCoe_Q01_JaylenPrice_BlockedByFC04.SetValue(0.0)
  Self.SetObjectiveCompleted(110, True)
  If !Self.GetStageDone(400)
    If Self.GetStageDone(200)
      Self.SetObjectiveDisplayed(200, True, False)
    ElseIf Self.GetStageDone(150)
      Self.SetObjectiveDisplayed(100, True, False)
    ElseIf Self.GetStageDone(100)
      Self.SetObjectiveDisplayed(75, True, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  If SamCoe_Q01_JaylenPrice_BlockedByFC04.GetValue() < 1.0
    Self.SetObjectiveCompleted(75, True)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
  Alias_SamCoe.GetActorRef().EvaluatePackage(False)
  COM_Cora_FollowingAllowed.SetValue(1.0)
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0215_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_CI_Clue.GetRef().Enable(False)
  Alias_JaylenPryce.GetActorRef().SetValue(COM_Quest_SamCoe_JaylenBusy, 1.0)
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  COM_SamCoeQ01_0310_SamStallsForTime.Start()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
  Self.SetStage(400)
  Alias_JaylenPryce.GetActorRef().SetValue(COM_Quest_SamCoe_JaylenBusy, 0.0)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, True, False)
  COM_SamCoeQ01_0310_SamStallsForTime.Stop()
  If Self.GetStageDone(310)
    COM_SamCoeQ01_0311_SamStallsEnds.Start()
  EndIf
  Alias_VictorCompoundPapers.GetRef().Enable(False)
  If Self.GetStageDone(110)
    Self.SetStage(120)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  (Alias_ElevatorManagerApartment.GetRef() as loadelevatormanagerscript).SetElevatorOperational(True)
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Alias_CoraCoe.GetRef().GetParentCell() != CityNeonSamCoeCIApartment
    Alias_CoraCoe.GetActorRef().MoveTo(COM_SCQ01_ApartmentOverrideMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  SQ_Followers.CommandFollow(Alias_SamCoe.GetActorRef())
  If Alias_SamCoe.GetRef().GetParentCell() != CityNeonSamCoeCIApartment
    Alias_SamCoe.GetActorRef().MoveTo(COM_SCQ01_ApartmentOverrideMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  COM_SamCoeQ01_0510_ArrivedOutsideCI.Start()
EndFunction

Function Fragment_Stage_0520_Item_00()
  COM_SamCoeQ01_0520_CIDoorScene.Start()
EndFunction

Function Fragment_Stage_0530_Item_00()
  Alias_CI_Door.GetRef().Lock(False, False, True)
  Alias_CI_Door.GetRef().SetOpen(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  SQ_Followers.SetRoleInactive(Alias_SamCoe.GetActorReference(), True, False, True)
  COM_SamCoeQ01_0600_MurderScene.Start()
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(650, True, False)
EndFunction

Function Fragment_Stage_0675_Item_00()
  COM_SamCoeQ01_0600_MurderScene.Stop()
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(650, True)
  Self.SetObjectiveDisplayed(700, True, False)
  Alias_VictorMapMarker.GetRef().Enable(False)
  SQ_Followers.SetRoleActive(Alias_SamCoe.GetActorReference(), True, True, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(750, True, False)
  ObjectReference oTarg = Alias_SamCoe.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom04), 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_CoraCoe.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom04), 0.0, 0.0, 0.0, True, False)
  COM_SamCoeQ01_0750_LillianAlert.Start()
EndFunction

Function Fragment_Stage_0775_Item_00()
  Self.SetObjectiveCompleted(750, True)
  Self.SetObjectiveDisplayed(775, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(775, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Alias_CoraCoe.GetRef().SetValue(COM_Quest_SamCoe_CoraState, 1.0)
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False)
  Alias_LillianHart.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0825_Item_00()
  Actor aLillian = Alias_LillianHart.GetRef() as Actor
  Alias_LillianTempNonHostile.Clear()
  COM_SamCoeQ01_0825_LillianShedsCover.Start()
  aLillian.SetValue(Aggression, 1.0)
  aLillian.AddToFaction(PlayerAllyFaction)
  aLillian.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(850, True, False)
  COM_PlayerMet_LilianHart.SetValue(1.0)
  Alias_PlayerShipModule.RefillAlias()
  Alias_LillianSceneMarker.RefillAlias()
  Alias_CoraSceneMarker.RefillAlias()
  Alias_LillianHart.GetActorRef().EvaluatePackage(False)
  Alias_VictorCompoundFinalAmbush.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0860_Item_00()
  Actor aTarg = None
  aTarg = Alias_CoraCoe.GetActorRef()
  aTarg.MoveTo(Alias_CoraSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  aTarg.EvaluatePackage(False)
  aTarg = Alias_LillianHart.GetActorRef()
  aTarg.MoveTo(Alias_LillianSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  aTarg.EvaluatePackage(False)
  aTarg.SetOutfit(Outfit_FreestarRanger, False)
EndFunction

Function Fragment_Stage_0875_Item_00()
  Alias_CoraCoe.GetRef().SetValue(COM_Quest_SamCoe_CoraState, 2.0)
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False)
  COM_SamCoeQ01_0875_LillianCoraReunion.Start()
EndFunction

Function Fragment_Stage_0890_Item_00()
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(850, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0920_Item_00()
  COM_Quest_SamCoe_Q01_SpaceEnc.Start()
  COM_SamCoeQ01_0920_DumasHailed.Start()
EndFunction

Function Fragment_Stage_0930_Item_00()
  COM_Quest_SamCoe_Q01_SpaceEnc.SetStage(200)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  COM_SamCoeQ01_1000_DumasLooted.Start()
  COM_Quest_SamCoe_Q01_SpaceEnc.SetStage(600)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
  Alias_CacheMapMarker.GetRef().Enable(False)
  Alias_CacheSecurity.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1150_Item_00()
  Actor aTarg = Alias_LillianHart.GetActorRef()
  aTarg.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  aTarg.EvaluatePackage(False)
  COM_SamCoeQ01_1150_LillianRepeatsMission.Start()
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
EndFunction

Function Fragment_Stage_1250_Item_00()
  Alias_ValerieMosquera.GetActorRef().AddItem(Alias_ValerieSlate.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1300, True, False)
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  Self.SetObjectiveDisplayed(1400, True, False)
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1400, True)
  Self.SetObjectiveDisplayed(1500, True, False)
  COM_Cora_FollowingAllowed.SetValue(0.0)
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1575_Item_00()
  Actor aTarg = Alias_SamCoe.GetActorRef()
  aTarg.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
  aTarg.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.CompleteAllObjectives()
  Actor aTarg = Alias_SamCoe.GetActorRef()
  aTarg.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_9000_Item_00()
  SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as companionactorscript, False, None, None)
  Game.GetPlayer().SetValue(COM_Quest_SamCoe_Q01_Complete_AV, 1.0)
  (Alias_SamCoe.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest()
  Float currentGameTime = Utility.GetCurrentGameTime()
  SE_Player_FAB07_Timestamp.SetValue(currentGameTime + cooldownDays)
  Self.Stop()
EndFunction
