ScriptName Fragments:Quests:QF_OE_KT_Execution_00082C9A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC_Attacker01 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Attacker02 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Attacker03 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Attacker04 Auto Const mandatory
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
Potion Property DrinkPack_Water_Md Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
FormList Property OnlyWaterList Auto Const mandatory
ReferenceAlias Property Alias_NPC_Captive Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
Potion Property DrinkPouch_CrystalWater_Md Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage30_Opening Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage30_BountySplit Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage30_ENDPeaceful Auto Const mandatory
GlobalVariable Property OE_Credit_BribeMedium Auto Const mandatory
GlobalVariable Property OE_Credit_BribeHigh Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
LeveledItem Property LL_Quest_Reward_GrabBag_Small Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage25_Opening Auto Const mandatory
ReferenceAlias Property Alias_XMarkerHeading Auto Const mandatory
ReferenceAlias Property Alias_Marker_Captive Auto Const mandatory
Scene Property OE_KT_ExecutionSceneMover Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  OE_KT_Execution_Scene_Stage30_Opening.Start()
  Actor AttackRef = Alias_NPC_Attacker01.GetActorRef()
  Actor ThreatRef = Alias_NPC_Attacker02.GetActorRef()
  Alias_NPC_Group01.AddRef(AttackRef as ObjectReference)
  Alias_NPC_Group01.AddRef(ThreatRef as ObjectReference)
EndFunction

Function Fragment_Stage_0001_Item_01()
  OE_KT_Execution_Scene_Stage25_Opening.Start()
  Actor AttackRef = Alias_NPC_Attacker04.GetActorRef()
  Actor ThreatRef = Alias_NPC_Attacker03.GetActorRef()
  Alias_NPC_Group01.AddRef(AttackRef as ObjectReference)
  Alias_NPC_Group01.AddRef(ThreatRef as ObjectReference)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_BribeHigh.GetValueInt(), False, None)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_BribeMedium.GetValueInt(), False, None)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0003_Item_01()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor ThreatRef = Alias_NPC_Attacker01.GetActorRef()
  Actor AttackerRef = Alias_NPC_Attacker02.GetActorRef()
  ThreatRef.EvaluatePackage(False)
  ThreatRef.StartCombat(AttackerRef as ObjectReference, False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_BribeMedium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0012_Item_00()
  OE_KT_Execution_Scene_Stage30_Opening.Stop()
EndFunction

Function Fragment_Stage_0013_Item_00()
  Alias_NPC_Attacker04.GetRef().MoveTo(Alias_XMarkerHeading.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Actor CaptiveRef = Alias_NPC_Captive.GetActorRef()
  CaptiveRef.IgnoreFriendlyHits(True)
  CaptiveRef.SetValue(Aggression, 0.0)
  CaptiveRef.SetRestrained(True)
  CaptiveRef.SetValue(Health, 1.0)
EndFunction

Function Fragment_Stage_0019_Item_00()
  Alias_NPC_Captive.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0040_Item_01()
  Alias_NPC_Attacker02.GetActorRef().Kill(None)
  OE_KT_Execution_Scene_Stage30_BountySplit.Stop()
  Utility.Wait(1.5)
  OE_KT_Execution_Scene_Stage30_ENDPeaceful.Start()
EndFunction

Function Fragment_Stage_0044_Item_00()
  Actor Attacker = Alias_NPC_Attacker04.GetActorRef()
  Attacker.EvaluatePackage(False)
  Utility.Wait(2.0)
  Alias_NPC_Captive.GetActorRef().StartCombat(Attacker as ObjectReference, False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_NPC_Attacker04.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0046_Item_00()
  Alias_NPC_Captive.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int random = Utility.RandomInt(0, 100)
  If random > 70
    Self.SetStage(30)
  Else
    Self.SetStage(25)
  EndIf
  OE_KT_ExecutionSceneMover.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_NPC_Group01.EvaluateAll()
  Actor CaptiveRef = Alias_NPC_Captive.GetActorRef()
  CaptiveRef.SetRestrained(False)
  CaptiveRef.IgnoreFriendlyHits(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_GrabBag_Small as Form, 1, False)
  Alias_NPC_Captive.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.Stop()
EndFunction
