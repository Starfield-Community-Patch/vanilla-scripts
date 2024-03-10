ScriptName Fragments:Quests:QF_SE_FAB02_00088A03 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property SE_FAB02_400_FlyingAway Auto Const mandatory
ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
ReferenceAlias Property Alias_Instructor Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Trainee Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
RefCollectionAlias Property Alias_ShipCrew Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property ShieldHealth Auto Const mandatory
Faction Property SE_FAB02_Faction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_CaptainsLocker Auto Const mandatory
ReferenceAlias Property Alias_SpaceshipInventory Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.EnablePartRepair(ShipSystemEngineHealth, False)
  oTarg.EnablePartRepair(ShipSystemShieldsHealth, False)
  oTarg.SetValue(ShipSystemShieldsHealth, 0.0)
  oTarg.SetGhost(True)
  oTarg.IgnoreFriendlyHits(True)
  Actor TeacherRef = Alias_Instructor.GetActorRef()
  TeacherRef.SetGhost(True)
  TeacherRef.SetRestrained(True)
  Actor TraineeRef = Alias_Trainee.GetActorRef()
  TraineeRef.SetGhost(True)
  Cell myCell = TeacherRef.GetParentCell()
  myCell.SetFactionOwner(SE_FAB02_Faction)
  myCell.SetPublic(True)
  Alias_CaptainsLocker.GetRef().SetFactionOwner(PlayerFaction, False)
  Alias_SpaceshipInventory.GetRef().BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_ShipCrew.AddRef(Alias_Trainee.GetRef())
  Alias_ShipCrew.AddRef(Alias_Instructor.GetRef())
EndFunction

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(500)
    Alias_Instructor.GetActorRef().Kill(None)
  EndIf
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Actor InstructorRef = Alias_Instructor.GetActorRef()
  Actor TraineeRef = Alias_Trainee.GetActorRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  TraineeRef.SetGhost(False)
  TraineeRef.AddtoFaction(PlayerEnemyFaction)
  TraineeRef.SetValue(Aggression, 1.0)
  TraineeRef.StartCombat(PlayerRef, False)
  If Self.GetStageDone(500)
    InstructorRef.AddtoFaction(PlayerEnemyFaction)
    InstructorRef.SetValue(Aggression, 1.0)
    InstructorRef.StartCombat(PlayerRef, False)
  EndIf
  Actor TeacherRef = Alias_Instructor.GetActorRef()
  TeacherRef.SetGhost(False)
EndFunction

Function Fragment_Stage_0030_Item_01()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef()
  ShipRef.RemoveFromFaction(PlayerFriendFaction)
  ShipRef.AddtoFaction(PlayerEnemyFaction)
  ShipRef.IgnoreFriendlyHits(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 0.0)
EndFunction

Function Fragment_Stage_0070_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef()
  ShipRef.DamageValue(ShipSystemShieldsHealth, 10000.0)
  ShipRef.DamageValue(ShieldHealth, 10000.0)
  Utility.Wait(1.0)
  Self.SetStage(69)
EndFunction

Function Fragment_Stage_0075_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef()
  ShipRef.DamageValue(ShipSystemEngineHealth, 10000.0)
  ShipRef.SetValue(DockingPermission, 0.0)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.SetValue(DockingPermission, 4.0)
  oTarg.SetGhost(True)
  oTarg.SetValue(ShipSystemShieldsHealth, 1000.0)
  oTarg.SetValue(ShipSystemEngineHealth, 10000.0)
  Utility.Wait(12.0)
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.EvaluatePackage(False)
  oTarg.SetGhost(False)
  SE_FAB02_400_FlyingAway.Start()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Actor TeacherRef = Alias_Instructor.GetActorRef()
  TeacherRef.SetGhost(False)
  TeacherRef.SetRestrained(False)
  Alias_Trainee.GetActorRef().SetGhost(False)
  Alias_SpaceshipInventory.GetRef().BlockActivation(False, False)
  Alias_CaptainsLocker.GetRef().SetFactionOwner(SE_FAB02_Faction, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False)
  Utility.Wait(4.0)
  Alias_Instructor.GetActorRef().EvaluatePackage(False)
  Self.CompleteQuest()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveSkipped(10)
  Self.SetObjectiveSkipped(20)
  Self.SetObjectiveSkipped(30)
EndFunction
