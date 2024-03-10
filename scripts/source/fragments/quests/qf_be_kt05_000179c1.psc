ScriptName Fragments:Quests:QF_BE_KT05_000179C1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property SE_KT03 Auto Const mandatory
GlobalVariable Property BE_KT05_SSNNQuiz Auto Const mandatory
ReferenceAlias Property Alias_Comms Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
Quest Property SE_KT05 Auto Const mandatory
Scene Property BE_KT05_DialogueCaptain_SceneBusy Auto Const mandatory
Scene Property BE_KT05_DialogueCaptain_Scene Auto Const mandatory
Outfit Property Outfit_Clothes_Business_Any_NoRyujin Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_Clipboard Auto Const mandatory
Faction Property BEKT05_CaptainFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0)
EndFunction

Function Fragment_Stage_0002_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetObjectiveSkipped(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  BE_KT05_SSNNQuiz.SetValue(0.0)
  Actor CaptainRef = Alias_Captain.GetActorRef()
  Alias_Clipboard.GetRef().SetFactionOwner(BEKT05_CaptainFaction, False)
  Alias_AllCrew.AddRef(Alias_Comms.GetRef())
  Alias_AllCrew.AddRef(CaptainRef as ObjectReference)
  CaptainRef.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False)
  CaptainRef.SetCrimeFaction(CrimeFactionUC)
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()
  myCell.SetPublic(True)
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_KT05.SetStage(30)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  enemyShipRef.SetValue(DockingPermission, 4.0)
  Utility.Wait(6.0)
  enemyShipRef.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_AllCrew.RemoveFromFaction(REPlayerFriend)
  Alias_AllCrew.AddtoFaction(PlayerEnemyFaction)
  Alias_AllCrew.SetValue(Aggression, 1.0)
  Alias_AllCrew.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Self.SetObjectiveSkipped(10)
EndFunction

Function Fragment_Stage_0065_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  enemyShipRef.SetValue(SpaceshipCrew, 0.0)
EndFunction

Function Fragment_Stage_0100_Item_04()
  Utility.Wait(1.0)
  BE_KT05_DialogueCaptain_Scene.Stop()
  BE_KT05_DialogueCaptain_SceneBusy.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.Stop()
EndFunction
