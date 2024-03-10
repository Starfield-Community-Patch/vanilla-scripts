ScriptName Fragments:Quests:QF_BE_KT06_0002F845 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Comms Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
Scene Property BE_KT06_Scene01 Auto Const mandatory
GlobalVariable Property BE_KT06_MetOnceGlobal Auto Const mandatory
Quest Property SE_KT06 Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
GlobalVariable Property BE_KT06_OneDead Auto Const mandatory
Scene Property BE_KT06_Scene00 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  BE_KT06_Scene01.Start()
EndFunction

Function Fragment_Stage_0009_Item_00()
  BE_KT06_MetOnceGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_AllCrew.AddRef(Alias_Comms.GetRef())
  Alias_AllCrew.AddRef(Alias_Captain.GetRef())
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()
  Alias_PilotSeat.GetRef().BlockActivation(True, True)
  myCell.SetPublic(True)
  BE_KT06_Scene00.Start()
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_KT06.SetStage(30)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  BE_KT06_OneDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  BE_KT06_OneDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef()
  enemyShipRef.SetValue(DockingPermission, 4.0)
  Utility.Wait(6.0)
  enemyShipRef.DisableWithGravJump()
  BE_KT06_MetOnceGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0055_Item_00()
  ObjectReference PilotSeat = Alias_PilotSeat.GetRef()
  PilotSeat.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Comms.GetActorRef().EvaluatePackage(False)
  Alias_AllCrew.RemoveFromFaction(REPlayerFriend)
  Alias_AllCrew.AddtoFaction(PlayerEnemyFaction)
  Alias_AllCrew.SetValue(Aggression, 1.0)
  Alias_AllCrew.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Self.SetObjectiveSkipped(10)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.Stop()
EndFunction
