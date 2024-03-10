ScriptName Fragments:Quests:QF_TraitKidStuff_0010C2FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Dad Auto Const mandatory
Perk Property TRAIT_KidStuff Auto Const mandatory
Scene Property TraitKidStuff_0325_LodgeBanter Auto Const mandatory
Scene Property TraitKidStuff_0350_LodgePostBanter Auto Const mandatory
Keyword Property TraitKidStuffKeyword Auto Const mandatory
ObjectReference Property MQ101_WalterMarker01 Auto Const mandatory
ObjectReference Property MQ401_HostileMarker03 Auto Const mandatory
ObjectReference Property MQ401A_VascoMarker Auto Const mandatory
ReferenceAlias Property Alias_Mom Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
ReferenceAlias Property Alias_Note01 Auto Const mandatory
ReferenceAlias Property Alias_Note02 Auto Const mandatory
ReferenceAlias Property Alias_Note03 Auto Const mandatory
Book Property Trait_KidStuff_Note01 Auto Const mandatory
Book Property Trait_KidStuff_Note02 Auto Const mandatory
Book Property Trait_KidStuff_Note03 Auto Const mandatory
Scene Property TraitKidStuff_2025_NeonBark Auto Const mandatory
Scene Property TraitKidStuff_2125_AkilaCityBark Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_KidStuff Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
ActorBase Property Trait_KS_Dad Auto Const mandatory
ActorBase Property Trait_KS_Mom Auto Const mandatory
LeveledItem Property LL_Quest_Reward_KidStuff_Spacesuit Auto Const mandatory
ReferenceAlias Property Alias_Spaceship Auto Const mandatory
ReferenceAlias Property Alias_Elevator Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
ReferenceAlias Property Alias_MomTeleportMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(25)
  Self.SetStage(50)
  Game.GetPlayer().MoveTo(Alias_DebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddPerk(TRAIT_KidStuff, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Trait_KS_Dad.DeriveGeneticParentAppearance(Game.GetPlayer().GetLeveledActorBase())
  Trait_KS_Mom.DeriveGeneticParentAppearance(Game.GetPlayer().GetLeveledActorBase())
  (Alias_Elevator.GetRef() as loadelevatorfloorscript).SetAccessible(True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor aTarg = Alias_Dad.GetActorRef()
  ObjectReference oMarker = MQ101_WalterMarker01
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True)
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_Mom.GetActorRef()
  oMarker = MQ401_HostileMarker03
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True)
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_Noel.GetActorRef()
  oMarker = MQ401A_VascoMarker
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True)
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False)
  TraitKidStuff_0325_LodgeBanter.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Alias_Dad.GetActorRef().EvaluatePackage(False)
  Alias_Mom.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(3.0)
  TraitKidStuff_0350_LodgePostBanter.Start()
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().AddItem(LL_Weapon_Reward_KidStuff as Form, 1, False)
EndFunction

Function Fragment_Stage_0325_Item_00()
  Actor aTarg = Alias_Dad.GetActorRef()
  ObjectReference oMarker = MQ101_WalterMarker01
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True)
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_Mom.GetActorRef()
  oMarker = MQ401_HostileMarker03
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True)
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False)
  aTarg = Alias_Noel.GetActorRef()
  oMarker = MQ401A_VascoMarker
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True)
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False)
  TraitKidStuff_0325_LodgeBanter.Start()
EndFunction

Function Fragment_Stage_0325_Item_01()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0375_Item_00()
  ObjectReference MoveHomeRef = Alias_MomTeleportMarker.GetRef()
  Actor DadRef = Alias_Dad.GetActorRef()
  Actor MomRef = Alias_Mom.GetActorRef()
  DadRef.MoveTo(MoveHomeRef, 0.0, 0.0, 0.0, True, False)
  MomRef.MoveTo(MoveHomeRef, 0.0, 0.0, 0.0, True, False)
  DadRef.EvaluatePackage(False)
  MomRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1050_Item_00()
  Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note01 as Form, Alias_Note01 as Alias, 1, False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_KidStuff_Spacesuit as Form, 1, False)
EndFunction

Function Fragment_Stage_1250_Item_00()
  Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note02 as Form, Alias_Note02 as Alias, 1, False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  spaceshipreference FreeShip = Alias_Spaceship.GetShipRef()
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript
  SQ_PlayerShip.AddPlayerOwnedShip(FreeShip)
  FreeShip.SetValue(SpaceshipRegistration, 1.0)
EndFunction

Function Fragment_Stage_1350_Item_00()
  Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note03 as Form, Alias_Note03 as Alias, 1, False)
EndFunction

Function Fragment_Stage_2025_Item_00()
  TraitKidStuff_2025_NeonBark.Start()
EndFunction

Function Fragment_Stage_2125_Item_00()
  TraitKidStuff_2125_AkilaCityBark.Start()
EndFunction

Function Fragment_Stage_8000_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_KidStuff)
EndFunction

Function Fragment_Stage_9000_Item_00()
  (Alias_Elevator.GetRef() as loadelevatorfloorscript).SetAccessible(False)
  Self.Stop()
EndFunction
