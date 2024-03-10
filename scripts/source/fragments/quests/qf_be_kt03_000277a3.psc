ScriptName Fragments:Quests:QF_BE_KT03_000277A3 Extends Quest Const hidden

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
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_FirstMate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0006_Item_00()
  SE_KT03.SetStage(2)
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_KT03.SetStage(3)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(8)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Faction myFaction = Alias_EnemyShip.GetShipRef().GetCrimeFaction()
  Int I = 0
  Actor[] robotCrew = Alias_AllCrew.GetActorArray()
  While I < robotCrew.Length
    robotCrew[I].SetCrimeFaction(myFaction)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()
  myCell.SetPublic(True)
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_KT03.SetStage(30)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_03()
  Self.SetObjectiveCompleted(10, True)
  Self.SetStage(8)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  enemyShipRef.SetValue(DockingPermission, 4.0)
  Utility.Wait(6.0)
  enemyShipRef.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_GenericCrew.RemoveFromFaction(REPlayerFriend)
  Alias_GenericCrew.AddtoFaction(PlayerEnemyFaction)
  Alias_GenericCrew.SetValue(Aggression, 1.0)
  Alias_GenericCrew.StartCombatAll(Game.GetPlayer() as ObjectReference)
  SE_KT03.SetStage(6)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.SetObjectiveSkipped(10)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.Stop()
EndFunction
