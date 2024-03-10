ScriptName Fragments:Quests:QF_DialogueEleosRetreat_0028B932 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
ReferenceAlias Property Alias_AkachiBlum Auto Const mandatory
ReferenceAlias Property Alias_DukeHalftown Auto Const mandatory
Message Property ER_DEBUG_MiscPointerToSloan Auto Const mandatory
Message Property ER_DEBUG_StartsUpQuest Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Perk Property Persuasion Auto Const mandatory
Quest Property City_ER_Dead_Misc Auto Const mandatory
Quest Property City_ER_Dead Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker01 Auto Const mandatory
RefCollectionAlias Property Alias_EnableMarkers Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property PlayerKnows_EleosRetreat Auto Const mandatory
Quest Property City_ER_Peace_Misc Auto Const mandatory
ReferenceAlias Property Alias_NevanBohn Auto Const mandatory
ReferenceAlias Property Alias_SloanTemitope Auto Const mandatory
LeveledItem Property LLW_Ammo_Eon Auto Const mandatory
ReferenceAlias Property Alias_GregDAngelo Auto Const mandatory
LeveledItem Property LL_Weapon_Eon_Simple Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  Game.GetPlayer().AddPerk(Persuasion, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(25)
  Utility.Wait(1.0)
  DialogueEleosRetreat_OpeningScene.Stop()
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(2000)
  Utility.Wait(2.0)
  Game.GetPlayer().MoveTo(ER_Dead_DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  DialogueEleosRetreat_OpeningScene.Start()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_DukeHalftown.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !City_ER_Dead.GetStageDone(100)
    City_ER_Dead_Misc.Start()
    Self.SetStage(2000)
  EndIf
  Alias_NevanBohn.GetActorRef().EvaluatePackage(False)
  Alias_SloanTemitope.GetActorRef().EvaluatePackage(False)
  Alias_DukeHalftown.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0105_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0116_Item_00()
  Self.SetStage(115)
EndFunction

Function Fragment_Stage_0910_Item_00()
  PlayerKnows_EleosRetreat.SetValue(1.0)
EndFunction

Function Fragment_Stage_0915_Item_00()
  Self.SetStage(900)
  Self.SetStage(910)
EndFunction

Function Fragment_Stage_0950_Item_00()
  City_ER_Peace_Misc.SetStage(1000)
EndFunction

Function Fragment_Stage_2100_Item_00()
  City_ER_Dead.Start()
EndFunction

Function Fragment_Stage_5000_Item_00()
  Alias_EnableMarkers.EnableAll(False)
  Actor GregACT = Alias_GregDAngelo.GetActorRef()
  GregACT.AddItem(LLW_Ammo_Eon as Form, 1, False)
  GregACT.AddItem(LL_Weapon_Eon_Simple as Form, 1, False)
EndFunction
