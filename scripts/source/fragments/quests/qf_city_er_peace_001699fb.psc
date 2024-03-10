ScriptName Fragments:Quests:QF_City_ER_Peace_001699FB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Snead Auto Const mandatory
ReferenceAlias Property Alias_Nevan Auto Const mandatory
ObjectReference Property City_ER_Peace_DebugMarker01 Auto Const mandatory
ObjectReference Property City_ER_Peace_DebugMarker02 Auto Const mandatory
Scene Property City_ER_Peace_0340_Lance_Attract Auto Const mandatory
Scene Property City_ER_Peace_0400_Lance_MainScene Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerKilledTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStartedTrackersNegotiation Auto Const mandatory
Scene Property City_ER_Peace_0200_Snead_CheckIn Auto Const mandatory
Scene Property City_ER_Peace_0290_Snead_PlayerSneaksBy Auto Const mandatory
Armor Property Spacesuit_Recon_01_PeaceReward Auto Const mandatory
Armor Property Spacesuit_Recon_Backpack_01_PeaceReward Auto Const mandatory
Armor Property Spacesuit_Recon_Helmet_01_PeaceReward Auto Const mandatory
GlobalVariable Property ER_Dead_KilmansReturned Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
Perk Property BackgroundSoldier Auto Const mandatory
Perk Property BackgroundDiplomat Auto Const mandatory
Quest Property City_ER_Ghost_SupportQuest Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerBribedTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStarbornedTrackers Auto Const mandatory
Quest Property City_ER_Peace_Misc Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
GlobalVariable Property ER_QuestlineComplete Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_City_ER_Peace Auto Const mandatory
LeveledItem Property LL_Spacesuit_Recon_01_PeaceReward_HighestQuality Auto Const mandatory
LeveledItem Property LL_Spacesuit_Recon_Backpack_01_PeaceReward_HighestQuality Auto Const mandatory
LeveledItem Property LL_Spacesuit_Recon_Helmet_01_PeaceReward_HighestQuality Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19)
  Utility.Wait(1.0)
  Game.GetPlayer().MoveTo(City_ER_Peace_DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19)
  Utility.Wait(1.0)
  Self.SetStage(200)
  Game.GetPlayer().MoveTo(City_ER_Peace_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0003_Item_00()
  ER_Exorcism_PlayerKilledTrackers.SetValue(1.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  ER_Exorcism_PlayerStartedTrackersNegotiation.SetValue(1.0)
  ER_Exorcism_PlayerKilledTrackers.SetValue(1.0)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddPerk(BackgroundSoldier, False)
  Game.GetPlayer().AddPerk(BackgroundDiplomat, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  ER_Exorcism_PlayerBribedTrackers.SetValue(1.0)
EndFunction

Function Fragment_Stage_0007_Item_00()
  ER_Exorcism_PlayerStarbornedTrackers.SetValue(1.0)
EndFunction

Function Fragment_Stage_0019_Item_00()
  ER_Dead_KilmansReturned.SetValue(1.0)
  DialogueEleosRetreat.SetStage(900)
  DialogueEleosRetreat.SetStage(25)
  DialogueEleosRetreat.SetStage(40)
  DialogueEleosRetreat.SetStage(50)
  DialogueEleosRetreat_OpeningScene.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
  Alias_Nevan.GetActorRef().EvaluatePackage(False)
  Alias_Nevan.GetActorRef().MoveToPackageLocation()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  uc09questscript kmyQuest = __temp as uc09questscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  DialogueFCAkilaCity.SetStage(2051)
  Alias_EnableMarker.GetRef().Enable(False)
  kmyQuest.GetNPCsInPlace()
EndFunction

Function Fragment_Stage_0205_Item_00()
  City_ER_Peace_0200_Snead_CheckIn.Start()
EndFunction

Function Fragment_Stage_0290_Item_00()
  If !Self.GetStageDone(300)
    City_ER_Peace_0290_Snead_PlayerSneaksBy.Start()
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Snead.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(200, True)
  If !Self.GetStageDone(340)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0340_Item_00()
  City_ER_Peace_0340_Lance_Attract.Start()
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(350, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  City_ER_Peace_0400_Lance_MainScene.Start()
  Self.SetObjectiveCompleted(350, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddItem(LL_Spacesuit_Recon_01_PeaceReward_HighestQuality as Form, 1, False)
  PlayACT.AddItem(LL_Spacesuit_Recon_Backpack_01_PeaceReward_HighestQuality as Form, 1, False)
  PlayACT.AddItem(LL_Spacesuit_Recon_Helmet_01_PeaceReward_HighestQuality as Form, 1, False)
  PlayACT.AddItem(LL_Weapon_Reward_City_ER_Peace as Form, 1, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_ER_Ghost_SupportQuest.SetStage(1000)
  DialogueEleosRetreat.SetStage(5000)
  City_ER_Peace_Misc.Start()
  ER_QuestlineComplete.SetValue(1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
