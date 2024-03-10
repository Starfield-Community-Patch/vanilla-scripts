ScriptName Fragments:Quests:QF_COM_Quest_SarahMorgan_Q01_002C7C11 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property COM_SQ01_LoganStartTriggerRef Auto Const mandatory
ReferenceAlias Property Alias_Sarah Auto Const mandatory
ReferenceAlias Property Alias_Sona Auto Const mandatory
ReferenceAlias Property Alias_AdmiralLogan Auto Const mandatory
ObjectReference Property COM_SMQ01_LoganOfficeMarker Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage020_LoganScene Auto Const mandatory
ObjectReference Property COM_SMQ01_PowerConduitRef Auto Const mandatory
ObjectReference Property COM_SMQ01_Stage140TriggerRef Auto Const mandatory
ObjectReference Property COM_SMQ01_Stage170TriggerRef Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage175_SarahPostGraveyard Auto Const mandatory
Scene Property COM_SarahMorgan_System_RomanceScene Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahMemorialTriggerRef Auto Const mandatory
ObjectReference Property COM_SMQ01_RomanceTriggerRef Auto Const mandatory
Quest Property LC125 Auto Const
ObjectReference Property COM_SQ01CrashSite02Marker Auto Const mandatory
ObjectReference Property COM_SMSQ01_PlanetStartMarker Auto Const mandatory
ObjectReference Property COM_SMSQ01_FirstCrashsiteMarker Auto Const mandatory
ObjectReference Property COM_SMSQ01_SecondCrashsiteMarker Auto Const mandatory
ObjectReference Property COM_SMSQ01_SonaCampMarker Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage130_CrashSiteArrival Auto Const mandatory
ObjectReference Property COM_SMSQ01_GravesMarker Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahSceneMarker Auto Const mandatory
GlobalVariable Property COM_SQ01_SarahSceneReady Auto Const mandatory
GlobalVariable Property COM_SQ01_SonaStayed Auto Const mandatory
GlobalVariable Property COM_SQ01_SonaLeft Auto Const mandatory
ObjectReference Property Lodge_RoomMarker_SarahMorgan Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01_Post Auto Const mandatory
Outfit Property Outfit_SMQ01_Sona_Clean Auto Const mandatory
Outfit Property Outfit_SMQ01_Sona_Dirty Auto Const mandatory
wwiseevent Property OBJ_Powercell_Power_Up_WEF Auto Const mandatory
Quest Property LC070 Auto Const
ActorValue Property COM_Quest_SarahMorgan_Q01_Complete_AV Auto Const mandatory
GlobalVariable Property COM_SMQ01_GenetagsCollected Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property CF04CrashSiteTriggerRef Auto Const mandatory
Faction Property ConstellationFaction Auto Const mandatory
Scene Property COM_SMQ01_Stage200_SarahDecided Auto Const mandatory
ObjectReference Property COM_SMQ01_OverlookFastMarker Auto Const mandatory
Scene Property COM_SMQ01_Stage200_SarahOverlookStartScene Auto Const mandatory
Scene Property COM_SMQ01_Stage232_ApproachMemorialScene Auto Const mandatory
ObjectReference Property COM_SMQ01_PlayerFastMemorial Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahFastMemorial Auto Const mandatory
ObjectReference Property UC_NA_MemorialBot_Ref Auto Const mandatory
ReferenceAlias Property Alias_Genetag01 Auto Const mandatory
ReferenceAlias Property Alias_Genetag02 Auto Const mandatory
ReferenceAlias Property Alias_Genetag03 Auto Const mandatory
ReferenceAlias Property Alias_Genetag04 Auto Const mandatory
ReferenceAlias Property Alias_Genetag05 Auto Const mandatory
ReferenceAlias Property Alias_Genetag06 Auto Const mandatory
ReferenceAlias Property Alias_Genetag07 Auto Const mandatory
ReferenceAlias Property Alias_Genetag08 Auto Const mandatory
ReferenceAlias Property Alias_Genetag09 Auto Const mandatory
ReferenceAlias Property Alias_Genetag10 Auto Const mandatory
conditionform Property COM_Quest_SarahMorgan_Q01_SarahLockInCND Auto Const mandatory
conditionform Property MQ102_SarahLockedInCND Auto Const mandatory
ObjectReference Property COM_SMQ01FirstMMRef Auto Const mandatory
ObjectReference Property COM_SQ01_RailMarker Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_Sarah Auto Const mandatory
GlobalVariable Property COM_SMQ01_WaitToggle Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahWarpMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_Sarah.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_0001_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMSQ01_PlanetStartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMSQ01_FirstCrashsiteMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(80)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMSQ01_SecondCrashsiteMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(80)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMSQ01_GravesMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahSceneMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Sarah.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(80)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(170)
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMSQ01_SonaCampMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahSceneMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Sarah.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Alias_AdmiralLogan.GetActorRef().EvaluatePackage(False)
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_0007_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(80)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(170)
  Self.SetStage(178)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(195)
  Self.SetStage(198)
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMQ01_OverlookFastMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_OverlookFastMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Self.SetStage(10)
  Self.SetStage(20)
  Self.SetStage(23)
  Self.SetStage(25)
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Self.SetStage(70)
  Self.SetStage(80)
  Self.SetStage(90)
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(140)
  Self.SetStage(150)
  Self.SetStage(160)
  Self.SetStage(170)
  Self.SetStage(178)
  Self.SetStage(180)
  Self.SetStage(185)
  Self.SetStage(195)
  Self.SetStage(198)
  Self.SetStage(205)
  Self.SetStage(210)
  Self.SetStage(220)
  Self.SetStage(230)
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
  Utility.wait(1.0)
  Game.GetPlayer().MoveTo(COM_SMQ01_PlayerFastMemorial, 0.0, 0.0, 0.0, True, False)
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahFastMemorial, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  SQ_Companions.LockInCompanion(Alias_Sarah.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Sarah)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  COM_SQ01_LoganStartTriggerRef.Enable(False)
EndFunction

Function Fragment_Stage_0023_Item_00()
  If Alias_Sarah.GetRef().GetDistance(Game.GetPlayer() as ObjectReference) > 10.0
    Alias_Sarah.GetRef().MoveTo(COM_SMQ01_SarahWarpMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  Alias_Sarah.GetActorRef().EvaluatePackage(False)
  COM_SMQ01FirstMMRef.Enable(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  COM_SMQ01_WaitToggle.SetValue(1.0)
  SQ_Followers.CommandFollow(Alias_Sarah.GetActorRef())
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  CF04CrashSiteTriggerRef.Disable(False)
  Utility.wait(2.0)
  CF04CrashSiteTriggerRef.Enable(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(70, True)
  If Self.GetStageDone(85) == False
    Self.SetObjectiveDisplayed(80, True, False)
  ElseIf Self.GetStageDone(85) == True
    Self.SetObjectiveDisplayed(90, True, False)
  EndIf
  COM_SMQ01_WaitToggle.SetValue(0.0)
EndFunction

Function Fragment_Stage_0090_Item_00()
  If Self.IsObjectiveDisplayed(80) == True
    Self.SetObjectiveCompleted(80, True)
  EndIf
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  LC070.SetStage(20)
  If Self.IsObjectiveDisplayed(70) == True
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(80) == True
    Self.SetObjectiveDisplayed(80, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
  COM_SQ01CrashSite02Marker.Enable(False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  COM_Quest_SarahMorgan_Q01_Stage130_CrashSiteArrival.Start()
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(140, True, False)
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Start()
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True)
  Alias_Sarah.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0145_Item_00()
  COM_SMQ01_Stage140TriggerRef.Disable(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.UpdateCurrentInstanceGlobal(COM_SMQ01_GenetagsCollected)
  Self.SetObjectiveDisplayed(160, True, False)
  (Alias_Player as com_smq01_aliasscript).SpawnBossOrEnd()
EndFunction

Function Fragment_Stage_0165_Item_00()
  LC125.SetStage(10)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(170, True, False)
  COM_SMQ01_Stage170TriggerRef.Enable(False)
EndFunction

Function Fragment_Stage_0175_Item_00()
  COM_Quest_SarahMorgan_Q01_Stage175_SarahPostGraveyard.Start()
EndFunction

Function Fragment_Stage_0178_Item_00()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(175, True, False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(175, True)
  Self.SetObjectiveDisplayed(180, True, False)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0185_Item_00()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, False, False)
  COM_SQ01_SonaStayed.SetValue(1.0)
  Self.SetStage(195)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(190, True)
  Self.SetObjectiveDisplayed(180, False, False)
  COM_SQ01_SonaLeft.SetValue(1.0)
  Self.SetStage(195)
EndFunction

Function Fragment_Stage_0195_Item_00()
  Self.SetObjectiveCompleted(190, True)
  Self.SetObjectiveDisplayed(195, True, False)
EndFunction

Function Fragment_Stage_0195_Item_01()
  Self.SetObjectiveCompleted(190, True)
  Self.SetObjectiveDisplayed(195, True, False)
EndFunction

Function Fragment_Stage_0198_Item_00()
  Self.SetObjectiveCompleted(195, True)
  Self.SetObjectiveDisplayed(198, True, False)
  Alias_Sona.GetActorRef().EvaluatePackage(False)
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
  LC125.SetStage(40)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveCompleted(198, True)
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True)
  Alias_Sarah.GetActorRef().EvaluatePackage(False)
  COM_SMQ01_Stage200_SarahOverlookStartScene.Start()
  If COM_SQ01_SonaLeft.GetValue() == 1.0
    kmyQuest.AddPassenger(Alias_Sona)
    Alias_Sona.GetActorRef().AddToFaction(ConstellationFaction)
    Alias_Sona.GetActorRef().SetFactionRank(ConstellationFaction, 0)
  EndIf
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(210, True, False)
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True)
  Self.SetObjectiveDisplayed(220, True, False)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Genetag01.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag02.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag03.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag04.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag05.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag06.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag07.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag08.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag09.GetRef() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Genetag10.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0226_Item_00()
  If COM_SQ01_SonaLeft.GetValue() == 1.0
    Alias_Sona.GetActorRef().MoveTo(Lodge_RoomMarker_SarahMorgan, 0.0, 0.0, 0.0, True, False)
    Alias_Sona.GetActorRef().Enable(False)
    Alias_Sona.GetActorRef().EvaluatePackage(False)
    Self.SetObjectiveCompleted(220, True)
    Self.SetObjectiveDisplayed(226, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.IsObjectiveDisplayed(220) == True
    Self.SetObjectiveCompleted(220, True)
  EndIf
  If Self.IsObjectiveDisplayed(226) == True
    Self.SetObjectiveCompleted(226, True)
  EndIf
  Self.SetObjectiveDisplayed(230, True, False)
  COM_SMQ01_SarahMemorialTriggerRef.Enable(False)
  COM_Quest_SarahMorgan_Q01_Post.SetStage(10)
  Alias_Sona.GetActorRef().EvaluatePackage(False)
  UC_NA_MemorialBot_Ref.Disable(False)
  COM_SQ01_RailMarker.Disable(False)
EndFunction

Function Fragment_Stage_0232_Item_00()
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True)
  Alias_Sarah.GetActorRef().EvaluatePackage(False)
  COM_SMQ01_Stage232_ApproachMemorialScene.Start()
EndFunction

Function Fragment_Stage_0235_Item_00()
  Self.SetObjectiveCompleted(230, True)
  Self.SetObjectiveDisplayed(235, True, False)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(235, True)
  Self.SetObjectiveDisplayed(240, True, False)
  COM_SMQ01_RomanceTriggerRef.Enable(False)
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorRef(), True, True, 0.0, 0.0)
  SQ_Followers.CommandFollow(Alias_Sarah.GetActorRef())
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(240, True)
  Self.SetObjectiveDisplayed(250, True, False)
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True)
  Alias_Sarah.GetActorRef().EvaluatePackage(False)
  COM_SarahMorgan_System_RomanceScene.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(250, True)
  Actor SarahMorganREF = Alias_Sarah.GetActorReference()
  If MQ102_SarahLockedInCND.IsTrue(SarahMorganREF as ObjectReference, None)
    
  Else
    SQ_Companions.LockInCompanion(SarahMorganREF as companionactorscript, False, None, None)
  EndIf
  Game.GetPlayer().SetValue(COM_Quest_SarahMorgan_Q01_Complete_AV, 1.0)
  (Alias_Sarah.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest()
  UC_NA_MemorialBot_Ref.Enable(False)
  COM_SQ01_RailMarker.Enable(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_01()
  Self.SetObjectiveCompleted(250, True)
  Actor SarahMorganREF = Alias_Sarah.GetActorReference()
  If MQ102_SarahLockedInCND.IsTrue(SarahMorganREF as ObjectReference, None)
    
  Else
    SQ_Companions.LockInCompanion(SarahMorganREF as companionactorscript, False, None, None)
  EndIf
  Game.GetPlayer().SetValue(COM_Quest_SarahMorgan_Q01_Complete_AV, 1.0)
  (Alias_Sarah.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest()
  UC_NA_MemorialBot_Ref.Enable(False)
  COM_SQ01_RailMarker.Enable(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
