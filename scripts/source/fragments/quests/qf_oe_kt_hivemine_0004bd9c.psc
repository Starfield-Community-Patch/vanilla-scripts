ScriptName Fragments:Quests:QF_OE_KT_HiveMine_0004BD9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Predators_Group Auto Const mandatory
Scene Property OE_KT_HiveMine_Scene01 Auto Const mandatory
LeveledItem Property LL_OE_Default_Reward Auto Const mandatory
Scene Property OE_KT_HiveMine_Scene02 Auto Const mandatory
MiscObject Property OE_KT_HiveMine_Canister_Poison Auto Const mandatory
ReferenceAlias Property Alias_Poison_Canister Auto Const mandatory
wwiseevent Property WwiseEvent_NestDamage Auto Const mandatory
ReferenceAlias Property Alias_Activator Auto Const mandatory
ReferenceAlias Property Alias_HiveNest Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
Float Property shakeFloat Auto Const mandatory
LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const mandatory
ReferenceAlias Property Alias_Marker_SceneA01 Auto Const mandatory
ReferenceAlias Property Alias_Marker_LargeGroundObject00 Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_NPC_Trader Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ObjectReference Nest = Alias_Activator.GetRef()
  If Nest.GetDistance(Alias_Marker_SceneA01.GetRef()) < 15.0
    Nest.MoveTo(Alias_Marker_LargeGroundObject00.GetRef(), 0.0, 0.0, 0.0, True, False)
  Else
    Alias_Container_Reward.GetRef().DisableNoWait(False)
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  OE_KT_HiveMine_Scene01.Start()
  Alias_NPC02.GetActorRef().SetRestrained(True)
  Alias_NPC03.GetActorRef().SetRestrained(True)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().AddAliasedItem(OE_KT_HiveMine_Canister_Poison as Form, Alias_Poison_Canister as Alias, 1, True)
  Self.SetStage(30)
  ObjectReference MarkerRef = Alias_Activator.GetRef()
  Int k = Utility.RandomInt(0, 5)
  Int I = 0
  If k == 0
    While I < 4
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_HexapodAGlider as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 1
    While I < 4
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidACockroach as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 2
    While I < 4
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidACoralbug as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 3
    While I < 4
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidAHookneck as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 4
    While I < 4
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  ElseIf k == 5
    While I < 4
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab as Form, 1, False, False, True, None, None, True))
      I += 1
    EndWhile
  EndIf
EndFunction

Function Fragment_Stage_0026_Item_00()
  Alias_HiveNest.ForceRefTo(Alias_Activator.GetRef())
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HiveNest.ForceRefTo(Alias_Activator.GetRef())
  Game.GetPlayer().RemoveItem(OE_KT_HiveMine_Canister_Poison as Form, 1, False, None)
  WwiseEvent_NestDamage.Play(Game.GetPlayer() as ObjectReference, None, None)
  Game.ShakeCamera(None, shakeFloat, 0.0)
  Self.SetObjectiveCompleted(30, True)
EndFunction

Function Fragment_Stage_0050_Item_01()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None)
  If Self.GetStageDone(70)
    Self.SetStage(80)
  EndIf
  Alias_NPC02.GetActorRef().SetRestrained(False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
EndFunction

Function Fragment_Stage_0070_Item_00()
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None)
  If Self.GetStageDone(60)
    Self.SetStage(80)
  EndIf
  Alias_NPC02.GetActorRef().SetRestrained(False)
EndFunction

Function Fragment_Stage_0075_Item_00()
  Alias_NPC_Trader.GetActorRef().EvaluatePackage(False)
  Alias_NPC00.GetActorRef().EvaluatePackage(False)
  Alias_NPC01.GetActorRef().EvaluatePackage(False)
  Alias_NPC02.GetActorRef().EvaluatePackage(False)
  Alias_NPC03.GetActorRef().EvaluatePackage(False)
  Alias_NPC04.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  OE_KT_HiveMine_Scene02.Start()
EndFunction

Function Fragment_Stage_0175_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0175_Item_01()
  Self.SetObjectiveCompleted(40, True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives()
  OE_KT_HiveMine_Scene02.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
