ScriptName Fragments:Quests:QF_DialogueCFTheKey_00015358 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC082 Auto Const mandatory
ReferenceAlias Property Alias_TheKeyStartMarker Auto Const mandatory
Scene Property DialogueCFTheKey_EstablishingScene Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_Marauder Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_Reaver Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Quest Property FFKeyZ01 Auto Const mandatory
Quest Property FFKeyZ01MiscObjective Auto Const mandatory
Quest Property FFKeyZ02 Auto Const mandatory
ReferenceAlias Property Alias_CFMissionBoards_Shinya_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_FFKeyZ02_Samina_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_DisableGenerics Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Scene Property DialogueCFTheKey_LastNova_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_NovaPatron01 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_CFNovaMarker02 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_NovaPatron02 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_NovaPatron04 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_CFNovaMarker03 Auto Const mandatory
ReferenceAlias[] Property FinishedAliases Auto Const mandatory
ReferenceAlias Property Alias_Intro_BogSceneChair01 Auto Const mandatory
Key Property LC088_PlayerHomeKey Auto Const mandatory
ObjectReference Property workshopRef Auto Const mandatory
ReferenceAlias Property Alias_CF_Naeva Auto Const mandatory
Scene Property CF02_1700_Naeva_KeyIntroScene Auto Const mandatory
Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_Marker Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_ReaverMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_Huan Auto Const mandatory
RefCollectionAlias Property Alias_CommentTriggers Auto Const mandatory
Armor Property Clothes_CrimsonFleet_Captain_01_C_RedCoat Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
Keyword Property BlockPlayerActivation Auto Const mandatory
Potion Property NOCLUTTER_CF_Drink_Alc_ExclMenuItem_Grog Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  CF03.CompleteQuest()
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(0)
  Game.GetPlayer().MoveTo(Alias_FFKeyZ02_Samina_StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_CFMissionBoards_Shinya_StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_DisableGenerics.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(103)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(700)
  Self.SetStage(800)
  Self.SetStage(900)
  Alias_IntroScene_Reaver.GetRef().Disable(False)
  Alias_CommentTriggers.EnableAll(False)
  ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef()
  ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef()
  MainMarkerRef.DisableNoWait(False)
  ReaverMarkerRef.DisableNoWait(False)
  Alias_IntroScene_Marker.Clear()
  Alias_IntroScene_ReaverMarker.Clear()
EndFunction

Function Fragment_Stage_0005_Item_00()
  CF_Main.SetStage(1)
  Self.SetStage(4)
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  CF_Main.SetStage(0)
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  CF02.CompleteQuest()
  Self.SetStage(103)
EndFunction

Function Fragment_Stage_0008_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(workshopRef, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddItem(LC088_PlayerHomeKey as Form, 1, False)
  CF02.CompleteQuest()
  Self.SetStage(103)
EndFunction

Function Fragment_Stage_0009_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_CFMissionBoards_Shinya_StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddItem(Credits as Form, 1000, False)
  CrimsonFleetFaction.SetCrimeGold(9999)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_CommentTriggers.EnableAll(False)
  Alias_IntroScene_Reaver.GetRef().DisableNoWait(False)
  Alias_IntroScene_Reaver.Clear()
EndFunction

Function Fragment_Stage_0013_Item_00()
  Game.GetPlayer().AddItem(NOCLUTTER_CF_Drink_Alc_ExclMenuItem_Grog as Form, 1, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_IntroScene_Reaver.GetRef().Disable(False)
  ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef()
  ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef()
  MainMarkerRef.DisableNoWait(False)
  ReaverMarkerRef.DisableNoWait(False)
  Alias_IntroScene_Marker.Clear()
  Alias_IntroScene_ReaverMarker.Clear()
EndFunction

Function Fragment_Stage_0097_Item_00()
  Alias_IntroScene_NovaPatron01.GetActorRef().EvaluatePackage(False)
  Alias_IntroScene_NovaPatron02.GetActorRef().EvaluatePackage(False)
  Self.SetStage(98)
EndFunction

Function Fragment_Stage_0098_Item_00()
  Utility.Wait(2.0)
  DialogueCFTheKey_LastNova_IntroScene.Stop()
  Alias_IntroScene_CFNovaMarker02.GetRef().DisableNoWait(False)
  Int I = 0
  While I < FinishedAliases.Length
    FinishedAliases[I].Clear()
    I += 1
  EndWhile
  Alias_Intro_BogSceneChair01.GetRef().SetFactionOwner(None, False)
EndFunction

Function Fragment_Stage_0099_Item_00()
  DialogueCFTheKey_LastNova_IntroScene.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  ObjectReference ReaverRef = Alias_IntroScene_Reaver.GetRef()
  ReaverRef.EnableNoWait(False)
  ReaverRef.BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0100_Item_01()
  DialogueCFTheKey_EstablishingScene.Start()
  Alias_CF_Naeva.GetActorRef().SetGhost(True)
  Alias_IntroScene_Reaver.GetActorRef().SetGhost(True)
  Alias_IntroScene_Marauder.GetActorRef().SetGhost(True)
  CF02.SetStage(900)
EndFunction

Function Fragment_Stage_0101_Item_00()
  Alias_IntroScene_Reaver.GetRef().RemoveKeyword(BlockPlayerActivation)
EndFunction

Function Fragment_Stage_0102_Item_00()
  Alias_IntroScene_Marauder.GetActorRef().EvaluatePackage(False)
  Alias_IntroScene_Reaver.GetRef().BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0103_Item_00()
  DialogueCFTheKey_EstablishingScene.Stop()
EndFunction

Function Fragment_Stage_0104_Item_00()
  Actor FleetMarauder = Alias_IntroScene_Marauder.GetActorRef()
  FleetMarauder.AddToFaction(CrimsonFleetFaction)
  FleetMarauder.SetEssential(False)
EndFunction

Function Fragment_Stage_0105_Item_00()
  DialogueCFTheKey_EstablishingScene.Stop()
  If Game.GetPlayer().GetDistance(Alias_CF_Naeva.GetRef()) < 3.0
    CF02_1700_Naeva_KeyIntroScene.Start()
  EndIf
  Utility.Wait(0.5)
  ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef()
  ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef()
  MainMarkerRef.DisableNoWait(False)
  ReaverMarkerRef.DisableNoWait(False)
  Alias_IntroScene_Marker.Clear()
  Alias_IntroScene_ReaverMarker.Clear()
  Self.SetStage(106)
EndFunction

Function Fragment_Stage_0106_Item_00()
  Alias_CF_Naeva.GetActorRef().SetGhost(False)
  Alias_IntroScene_Reaver.GetActorRef().SetGhost(False)
  Alias_IntroScene_Marauder.GetActorRef().SetGhost(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  FFKeyZ01MiscObjective.SetStage(100)
EndFunction

Function Fragment_Stage_0850_Item_00()
  FFKeyZ02.SetStage(100)
EndFunction

Function Fragment_Stage_0950_Item_00()
  PlayerHouseSystem.PurchaseHouse(None, LC088_PlayerHomeKey)
  CF_Key_Home_CaptainsQuarters_Misc.Start()
  Game.GetPlayer().AddItem(Clothes_CrimsonFleet_Captain_01_C_RedCoat as Form, 1, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_IntroScene_Reaver.GetRef().Disable(False)
  Self.Stop()
EndFunction
