ScriptName Fragments:Quests:QF_City_ER_Dead_0017134F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_ER_Dead_Misc Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Message Property ER_DEBUG_Dead_PCMBusted Auto Const mandatory
ReferenceAlias Property Alias_Kilman Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Scene Property City_ER_Dead_0400_KilmanReturns Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker01 Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker02a Auto Const mandatory
ObjectReference Property ER_Dead_Scene400Marker_Kilman Auto Const mandatory
Quest Property City_ER_Ghost Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker01a Auto Const mandatory
Scene Property City_ER_Dead_390_ConstWorkers_KilmanGreeting Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerM02 Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerF02 Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerF01 Auto Const mandatory
Perk Property TRAIT_Empath Auto Const mandatory
Scene Property City_ER_Dead_0205_Kilman_Attract Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker03 Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker_Kilman Auto Const mandatory
ObjectReference Property ER_Dead_Scene400Marker_Monika Auto Const mandatory
ReferenceAlias Property Alias_Petra Auto Const mandatory
ReferenceAlias Property Alias_Sloan Auto Const mandatory
ReferenceAlias Property Alias_Halftown Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerM01 Auto Const mandatory
ObjectReference Property ER_Dead_Scene400Marker_Halftown Auto Const mandatory
GlobalVariable Property ER_Dead_KilmansReturned Auto Const mandatory
GlobalVariable Property ER_Ghost_BetterReward Auto Const mandatory
ReferenceAlias Property Alias_DungeonBoss Auto Const mandatory
ReferenceAlias Property Alias_DungeonBossReplacement Auto Const mandatory
ReferenceAlias Property Alias_CowerMarker Auto Const mandatory
ObjectReference Property City_ER_Dead_KilmanStage400_TeleportMarker Auto Const mandatory
ReferenceAlias Property Alias_TriggerStage400 Auto Const mandatory
GlobalVariable Property ER_Ghost_BetterRewardUnlocked Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  DialogueEleosRetreat.SetStage(25)
  DialogueEleosRetreat.SetStage(40)
  DialogueEleosRetreat.SetStage(50)
  Game.GetPlayer().Moveto(ER_Dead_DebugMarker01a, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(200)
  Utility.Wait(1.0)
  Game.GetPlayer().Moveto(ER_Dead_DebugMarker02a, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Actor KilACT = Alias_Kilman.GetActorRef()
  KilACT.Enable(False)
  Self.SetStage(300)
  Game.GetPlayer().Moveto(ER_Dead_DebugMarker03, 0.0, 0.0, 0.0, True, False)
  KilACT.Moveto(ER_Dead_DebugMarker_Kilman, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_Petra.GetRef().Moveto(ER_Dead_Scene400Marker_Monika, 0.0, 0.0, 0.0, True, False)
  Alias_Sloan.GetRef().Moveto(ER_Dead_Scene400Marker_Monika, 0.0, 0.0, 0.0, True, False)
  Alias_Halftown.GetRef().Moveto(ER_Dead_Scene400Marker_Halftown, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddPerk(TRAIT_Empath, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If City_ER_Dead_Misc.IsRunning()
    City_ER_Dead_Misc.SetStage(1000)
  EndIf
  DialogueEleosRetreat.SetStage(2100)
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
  Alias_DungeonBoss.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor KilACT = Alias_Kilman.GetActorRef()
  KilACT.Moveto(Alias_CowerMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  KilACT.MoveToNearestNavmeshLocation()
  KilACT.Enable(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_Kilman.GetActorRef().EvaluatePackage(False)
  City_ER_Dead_0205_Kilman_Attract.Start()
EndFunction

Function Fragment_Stage_0207_Item_00()
  Alias_Kilman.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(207)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  uc09questscript kmyQuest = __temp as uc09questscript
  sq_followersscript myFollow = SQ_Followers as sq_followersscript
  Actor KilACT = Alias_Kilman.GetActorRef()
  myFollow.SetRoleActive(KilACT, True, True, 0.0, 0.0)
  myFollow.CommandFollow(KilACT)
  kmyQuest.GetNPCsInPlace()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  If !Self.GetStageDone(400)
    City_ER_Dead_390_ConstWorkers_KilmanGreeting.Start()
  EndIf
  Alias_ConstructionWorkerF02.GetActorRef().EvaluatePackage(False)
  Utility.Wait(0.5)
  Alias_ConstructionWorkerM02.GetActorRef().EvaluatePackage(False)
  Utility.Wait(0.25)
  Alias_ConstructionWorkerF01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  sq_followersscript myFollow = SQ_Followers as sq_followersscript
  Actor KilACT = Alias_Kilman.GetActorRef()
  Actor PlayACT = Game.GetPlayer()
  myFollow.SetRoleInactive(KilACT, True, False, True)
  If !Alias_TriggerStage400.GetRef().IsInTrigger(KilACT as ObjectReference) && !PlayACT.HasDetectionLOS(KilACT as ObjectReference) && PlayACT.GetDistance(KilACT as ObjectReference) >= 15.0
    KilACT.Moveto(City_ER_Dead_KilmanStage400_TeleportMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  City_ER_Dead_0400_KilmanReturns.Start()
  ER_Dead_KilmansReturned.SetValue(1.0)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Alias_Petra.GetActorRef().EvaluatePackage(False)
  Alias_Sloan.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Halftown.GetActorRef().EvaluatePackage(False)
  Alias_ConstructionWorkerM01.GetActorRef().EvaluatePackage(False)
  Alias_Petra.GetActorRef().EvaluatePackage(False)
  Alias_Kilman.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  ER_Ghost_BetterRewardUnlocked.SetValue(1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_ER_Ghost.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
