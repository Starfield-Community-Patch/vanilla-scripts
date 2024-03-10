ScriptName Fragments:Quests:QF_COM_Quest_Andreja_Q01_0021ECD0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Andreja Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_AkilaTestMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene12_2_RaisaShout Auto Const mandatory
ReferenceAlias Property Alias_StationDoor Auto Const mandatory
ReferenceAlias Property Alias_DenTestMarker Auto Const mandatory
ReferenceAlias Property Alias_RaisaTestMarker Auto Const mandatory
ReferenceAlias Property Alias_ErvinTestMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene12_ZealotStage210 Auto Const mandatory
ReferenceAlias Property Alias_StationTestMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene14_AndrejaStage310 Auto Const mandatory
Cell Property StationUCN48 Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene16_AndrejaTomisarStage340 Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene19_AndrejaTomisarStage390 Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage140_JaedaHail02 Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property COM_Quest_Andreja_JaedaFaction Auto Const mandatory
ReferenceAlias Property Alias_Jaeda_Ship Auto Const mandatory
ReferenceAlias Property Alias_Tomisar Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage381_TomisarBarks Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave1_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave1_Ship02 Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave1_Ship03 Auto Const mandatory
ReferenceAlias Property Alias_Eren_Slate Auto Const mandatory
ReferenceAlias Property Alias_ErenCampMapMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage170_JaedaShout Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave02_ShipCaptain Auto Const mandatory
ReferenceAlias Property Alias_Aggies_AndrejaMarker Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
ActorValue Property COM_Quest_Andreja_Q01_Complete_AV Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage090_AndrejaDenArrival Auto Const mandatory
ReferenceAlias Property Alias_Aggie Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_Andreja Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage330_Andreja Auto Const mandatory
GlobalVariable Property COM_AndrejaQ01_WaitToggle Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Jaeda Auto Const mandatory
spaceshipbase Property LvlShip_COM_Quest_Andreja_VaruunShip01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0331_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  COM_Companion_Andreja.SetStage(100)
  MQ104A.Stop()
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  COM_Companion_Andreja.SetStage(100)
  MQ104A.Stop()
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0)
  Self.SetStage(10)
  Self.SetStage(20)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(Alias_AkilaTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  COM_Companion_Andreja.SetStage(100)
  MQ104A.Stop()
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(25)
  Self.SetStage(30)
  Self.SetStage(31)
  Self.SetStage(40)
  Self.SetStage(45)
  Self.SetStage(50)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(Alias_ErvinTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  COM_AndrejaQ01_WaitToggle.SetValue(1.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  COM_Companion_Andreja.SetStage(100)
  MQ104A.Stop()
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(31)
  Self.SetStage(40)
  Self.SetStage(45)
  Self.SetStage(50)
  Self.SetStage(55)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(75)
  Self.SetStage(80)
  Self.SetStage(85)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  COM_Companion_Andreja.SetStage(100)
  MQ104A.Stop()
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(31)
  Self.SetStage(40)
  Self.SetStage(45)
  Self.SetStage(50)
  Self.SetStage(55)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(75)
  Self.SetStage(80)
  Self.SetStage(85)
  Self.SetStage(90)
  Self.SetStage(100)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  COM_Companion_Andreja.SetStage(100)
  MQ104A.Stop()
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(30)
  Self.SetStage(31)
  Self.SetStage(40)
  Self.SetStage(45)
  Self.SetStage(50)
  Self.SetStage(55)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(75)
  Self.SetStage(80)
  Self.SetStage(85)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(170)
  Self.SetStage(300)
  Self.SetStage(305)
  COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene.Stop()
  COM_Quest_Andreja_Q01_Stage140_JaedaHail02.Stop()
  COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene.Stop()
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(Alias_StationTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Andreja)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_Aggie.GetRef().MoveTo(Alias_Aggies_AndrejaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Aggie.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_Andreja.GetActorReference().EvaluatePackage(False)
  If Game.GetPlayer().HasDirectLOS(Alias_Andreja.GetReference(), "", "") == False
    If Game.GetPlayer().GetDistance(Alias_Andreja.GetReference()) > 20.0
      Alias_Andreja.GetReference().MoveTo(Alias_Aggies_AndrejaMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0029_Item_00()
  Alias_Andreja.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_Andreja.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(45, True, False)
  Alias_ErenCampMapMarker.GetReference().SetMarkerVisibleOnStarMap(True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(45, True)
  Self.SetObjectiveDisplayed(50, True, False)
  COM_AndrejaQ01_WaitToggle.SetValue(1.0)
  SQ_Followers.CommandFollow(Alias_Andreja.GetActorRef())
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(55, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  If Self.IsObjectiveDisplayed(50)
    Self.SetObjectiveDisplayed(50, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(55)
    Self.SetObjectiveCompleted(55, True)
  EndIf
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
  COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin.Start()
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(75, True, False)
  If Game.GetPlayer().GetItemCount(Alias_Eren_Slate.GetReference() as Form) > 0
    Self.SetStage(80)
  EndIf
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(75, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(85, True, False)
  COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin.Stop()
  COM_AndrejaQ01_WaitToggle.SetValue(0.0)
EndFunction

Function Fragment_Stage_0089_Item_00()
  Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(85, True)
  Self.SetObjectiveDisplayed(90, True, False)
  COM_Quest_Andreja_Q01_Stage090_AndrejaDenArrival.Start()
EndFunction

Function Fragment_Stage_0095_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValue() as Int, False, None)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Jaeda_Ship.GetReference().Enable(False)
EndFunction

Function Fragment_Stage_0109_Item_00()
  Game.GetPlayer().MoveTo(Alias_RaisaTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Utility.wait(5.0)
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(120, True, False)
  COM_Quest_Andreja_JaedaFaction.SetAlly(PlayerFaction, False, False)
  COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene.Start()
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
  spaceshipreference Ship01Ref = Alias_Zealot_Wave1_Ship01.GetShipReference()
  spaceshipreference Ship02Ref = Alias_Zealot_Wave1_Ship02.GetShipReference()
  spaceshipreference Ship03Ref = Alias_Zealot_Wave1_Ship03.GetShipReference()
  spaceshipreference JaedaShipRef = Alias_Jaeda_Ship.GetShipRef()
  If Ship01Ref == None
    Ship01Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01 as Form, 4, True, False, True, True, None, Alias_Zealot_Wave1_Ship01 as Alias, None, True)
    Ship01Ref.MoveNear(JaedaShipRef as ObjectReference, 0, 0, 0)
  EndIf
  If Ship02Ref == None
    Ship02Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01 as Form, 4, True, False, True, True, None, Alias_Zealot_Wave1_Ship02 as Alias, None, True)
    Ship02Ref.MoveNear(JaedaShipRef as ObjectReference, 0, 0, 0)
  EndIf
  If Ship03Ref == None
    Ship03Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01 as Form, 4, True, False, True, True, None, Alias_Zealot_Wave1_Ship03 as Alias, None, True)
    Ship03Ref.MoveNear(JaedaShipRef as ObjectReference, 0, 0, 0)
  EndIf
  Ship01Ref.EnableWithGravJump()
  Utility.wait(0.400000006)
  Ship02Ref.EnableWithGravJump()
  Utility.wait(0.200000003)
  Ship03Ref.EnableWithGravJump()
EndFunction

Function Fragment_Stage_0131_Item_00()
  If Self.GetStageDone(132) && Self.GetStageDone(133)
    Self.SetStage(140)
  EndIf
EndFunction

Function Fragment_Stage_0132_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(133)
    Self.SetStage(140)
  EndIf
EndFunction

Function Fragment_Stage_0133_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132)
    Self.SetStage(140)
  EndIf
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveDisplayed(140, True, False)
  COM_Quest_Andreja_Q01_Stage140_JaedaHail02.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(150, True, False)
  Alias_Jaeda_Ship.GetReference().SetValue(DockingPermission, 2.0)
  Alias_Jaeda.GetActorReference().SetValue(Game.GetInvulnerableAV(), 1.0)
  Alias_Jaeda.GetActorReference().SetGhost(True)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(160, True, False)
  COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene.Start()
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(170, True, False)
  COM_Quest_Andreja_Q01_Stage170_JaedaShout.Start()
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_Zealot_Wave02_ShipCaptain.GetShipRef().EnableWithGravJump()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  If Self.IsObjectiveDisplayed(170)
    Self.SetObjectiveCompleted(170, True)
  EndIf
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveCompleted(200, True)
  EndIf
  Self.SetObjectiveDisplayed(220, True, False)
  COM_Quest_Andreja_Q01_Scene12_ZealotStage210.Start()
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(220, True, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(220, True)
  Self.SetObjectiveDisplayed(230, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(170)
    Self.SetObjectiveCompleted(170, True)
  EndIf
  Self.SetObjectiveCompleted(220, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(305, True, False)
  StationUCN48.SetGravityScale(1.0)
EndFunction

Function Fragment_Stage_0306_Item_00()
  Game.GetPlayer().MoveTo(Alias_StationTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(305, True)
  Self.SetObjectiveDisplayed(310, True, False)
  Alias_Tomisar.GetActorReference().SetValue(Game.GetInvulnerableAV(), 1.0)
  Alias_Tomisar.GetActorReference().SetGhost(True)
  COM_Quest_Andreja_Q01_Scene14_AndrejaStage310.Start()
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(310, True)
  Self.SetObjectiveDisplayed(320, True, False)
EndFunction

Function Fragment_Stage_0330_Item_00()
  COM_Quest_Andreja_Q01_Stage330_Andreja.Start()
EndFunction

Function Fragment_Stage_0340_Item_00()
  Self.SetObjectiveCompleted(320, True)
  Self.SetObjectiveDisplayed(340, True, False)
  Alias_StationDoor.GetReference().SetOpen(True)
  COM_Quest_Andreja_Q01_Scene16_AndrejaTomisarStage340.Start()
EndFunction

Function Fragment_Stage_0342_Item_00()
  Alias_Tomisar.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(340, True)
  Self.SetObjectiveDisplayed(360, True, False)
  Alias_Tomisar.GetActorReference().SetValue(Game.GetInvulnerableAV(), 0.0)
  Alias_Tomisar.GetActorReference().SetGhost(False)
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(360, True)
  Self.SetObjectiveDisplayed(370, True, False)
EndFunction

Function Fragment_Stage_0375_Item_00()
  Self.SetObjectiveCompleted(370, True)
  Self.SetObjectiveDisplayed(375, True, False)
  Alias_Tomisar.GetActorReference().SetEssential(False)
EndFunction

Function Fragment_Stage_0380_Item_00()
  Alias_Tomisar.GetActorReference().SetEssential(False)
EndFunction

Function Fragment_Stage_0381_Item_00()
  Self.SetObjectiveCompleted(370, True)
  Self.SetStage(400)
  Self.SetStage(500)
  COM_Quest_Andreja_Q01_Stage381_TomisarBarks.Start()
EndFunction

Function Fragment_Stage_0385_Item_00()
  Alias_Tomisar.GetActorReference().SetEssential(False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Alias_Tomisar.GetActorReference().SetEssential(False)
EndFunction

Function Fragment_Stage_0399_Item_00()
  Alias_Andreja.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.IsObjectiveDisplayed(370)
    Self.SetObjectiveCompleted(370, True)
  EndIf
  If Self.IsObjectiveDisplayed(375)
    Self.SetObjectiveCompleted(375, True)
  EndIf
  If Self.GetStageDone(381) == False
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(400)
    Self.SetObjectiveCompleted(400, True)
  EndIf
  Self.SetObjectiveDisplayed(500, True, False)
  Alias_Andreja.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Alias_Andreja.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  (Alias_Andreja.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest()
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, False, None, None)
  Game.GetPlayer().SetValue(COM_Quest_Andreja_Q01_Complete_AV, 1.0)
  Self.Stop()
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
