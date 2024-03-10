ScriptName Fragments:Quests:QF_FFCydoniaZ05_000D6927 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Sivan Auto Const mandatory
ReferenceAlias Property Alias_RailLeanMarker Auto Const mandatory
Scene Property FFCydoniaZ05_Scene01_Space Auto Const mandatory
Scene Property FFCydoniaZ05_SceneIntro Auto Const mandatory
ActorBase Property SivanActorBase Auto Const mandatory
ReferenceAlias Property Alias_passengerMarker Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Quest Property City_NewAtlantis_Z_PartingGift Auto Const mandatory
Scene Property SQ_GuardShipsScene Auto Const mandatory
ReferenceAlias Property Alias_CaptainMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
  Game.GetPlayer().MoveTo(Alias_RailLeanMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  City_NewAtlantis_Z_PartingGift.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor SivanRef = Alias_Sivan.GetActorRef()
  ObjectReference RailRef = Alias_RailLeanMarker.GetRef()
  RailRef.SetActorOwner(SivanActorBase, False)
  SivanRef.EnableNoWait(False)
  SivanRef.MoveTo(RailRef, 0.0, 0.0, 0.0, True, False)
  SivanRef.SnapIntoInteraction(RailRef)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetStage(40)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_RailLeanMarker.GetRef().SetActorOwner(None, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor SivanRef = Alias_Sivan.GetActorRef()
  SQ_Followers.SetRoleInactive(SivanRef, True, False, True)
  SivanRef.MoveTo(Alias_passengerMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  SivanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0025_Item_01()
  Self.SetStage(15)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  FFCydoniaZ05_SceneIntro.Stop()
  Actor SivanRef = Alias_Sivan.GetActorRef()
  SQ_Followers.SetRoleActive(SivanRef, True, True, 0.0, 0.0)
  SivanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(10, True)
  SQ_GuardShipsScene.Stop()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_CaptainMarker.RefillAlias()
  ObjectReference ShipRef = Alias_CaptainMarker.GetRef()
  ObjectReference PassengerRef = Alias_passengerMarker.GetRef()
  ObjectReference SivanRef = Alias_Sivan.GetRef()
  If SivanRef.GetDistance(ShipRef) > 10.0 && ShipRef != None
    SivanRef.MoveTo(ShipRef, 0.0, 0.0, 0.0, True, False)
  ElseIf SivanRef.GetDistance(PassengerRef) > 10.0 && PassengerRef != None
    SivanRef.MoveTo(PassengerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  SQ_GuardShipsScene.Stop()
  FFCydoniaZ05_Scene01_Space.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  FFCydoniaZ05_Scene01_Space.Stop()
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetStage(40)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor SivanRef = Alias_Sivan.GetActorRef()
  SQ_Followers.SetRoleInactive(SivanRef, True, False, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0070_Item_01()
  Actor SivanRef = Alias_Sivan.GetActorRef()
  SivanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0070_Item_02()
  Actor SivanRef = Alias_Sivan.GetActorRef()
  SivanRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  SivanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Sivan.GetActorRef().EvaluatePackage(False)
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Sivan.GetActorRef().DisableNoWait(False)
  Self.Stop()
EndFunction
