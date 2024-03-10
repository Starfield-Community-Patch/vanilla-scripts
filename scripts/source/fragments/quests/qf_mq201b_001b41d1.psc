ScriptName Fragments:Quests:QF_MQ201B_001B41D1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ201B_Eye_EnableMarker Auto Const mandatory
Scene Property MQ201B_01_SamScene Auto Const mandatory
ReferenceAlias Property Alias_WelderTrigger Auto Const mandatory
Scene Property MQ201B_01_BarrettScene Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
GlobalVariable Property MQ_CompanionAtEye Auto Const mandatory
Message Property MQ201B_BoxMSGSuccess Auto Const mandatory
Message Property MQ201B_BoxMSGFail Auto Const mandatory
Scene Property MQ201B_02a_AndrejaScene_Success Auto Const mandatory
Scene Property MQ201B_02b_AndrejaScene_Fail Auto Const mandatory
Scene Property MQ201B_01_SarahScene Auto Const mandatory
Scene Property MQ201B_02a_SarahScene_Success Auto Const mandatory
Scene Property MQ201B_02b_SarahScene_Fail Auto Const mandatory
Message Property MQ201B_WrenchMSGFail Auto Const mandatory
Message Property MQ201B_WrenchMSGSuccess Auto Const mandatory
ReferenceAlias Property Alias_BoxTrigger Auto Const mandatory
ReferenceAlias Property Alias_Computer Auto Const mandatory
Scene Property MQ201B_02a_BarrettScene_Success Auto Const mandatory
Scene Property MQ201B_02b_BarrettScene_Fail Auto Const mandatory
Scene Property MQ201B_01_AndrejaScene Auto Const mandatory
Message Property MQ201B_WelderingMSGSuccess Auto Const mandatory
Scene Property MQ201B_02a_SamScene_Success Auto Const mandatory
Message Property MQ201B_WelderingMSGFail Auto Const mandatory
Scene Property MQ201B_02b_SamScene_Fail Auto Const mandatory
ReferenceAlias Property Alias_WrenchTrigger Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const
ObjectReference Property MQ201B_Marker_Andreja Auto Const mandatory
ObjectReference Property MQ201BMarker_Barrett Auto Const mandatory
ObjectReference Property MQ201BMarker_Sam Auto Const mandatory
ObjectReference Property MQ201BMarker_Cora Auto Const mandatory
ObjectReference Property MQ201B_Marker_Sarah Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
Perk Property Scanning Auto Const mandatory
Perk Property StarshipEngineering Auto Const mandatory
ObjectReference Property EyeVladimirMarker Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtLodge Auto Const
GlobalVariable Property MQ_CompanionAtLodge Auto Const mandatory
ReferenceAlias Property Alias_ResearchBench Auto Const mandatory
Message Property MQ201B_ResearchMSGSuccess Auto Const mandatory
Message Property MQ201B_ResearchMSGFail Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Andreja Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Barrett Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sam Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sarah Auto Const mandatory
ReferenceAlias Property Alias_MQ00_CompanionAtEye Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
Quest Property SQ_Crew Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const
Quest Property COM_Quest_Andreja_Commitment Auto Const mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const mandatory
Quest Property COM_Quest_SamCoe_Commitment Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Commitment Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ201_TextBox_ScannerRepair Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ201_TextBox_Welding Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ201_TextBox_WrenchSparks Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Quest Property COM_Quest_Andreja_Q01 Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ101.CompleteQuest()
  MQ102.CompleteQuest()
  MQ104B.CompleteQuest()
  Game.GetPlayer().AddPerk(StarshipEngineering, False)
  Game.GetPlayer().AddPerk(Scanning, False)
  Game.GetPlayer().MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Vladimir.GetActorRef().MoveTo(MQ106_VladimirMarker01, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  MQ201.SetStage(120)
  MQ201.SetStage(1000)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq201bscript kmyQuest = __temp as mq201bscript
  Self.SetObjectiveDisplayed(10, True, False)
  MQ201B_Eye_EnableMarker.Enable(False)
  kmyQuest.SetCompanionsAtRisk()
  kmyQuest.SetCompanionsHomeLink()
  MQ404.Start()
  Self.SetActive(True)
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  Actor SamCoeREF = Alias_SamCoe.GetActorRef()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleInactive(AndrejaREF, False, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleInactive(BarrettREF, False, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SamCoeREF, False, True, False)
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SarahMorganREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(AndrejaREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(BarrettREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(SamCoeREF, False, True, False)
  (SQ_Crew as sq_crewscript).SetRoleInactive(SarahMorganREF, False, True, False)
  DismissedCrew.RemoveRef(AndrejaREF as ObjectReference)
  DismissedCrew.RemoveRef(BarrettREF as ObjectReference)
  DismissedCrew.RemoveRef(SamCoeREF as ObjectReference)
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference)
  DisembarkingCrew.RemoveRef(AndrejaREF as ObjectReference)
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Actor CompanionREF = Alias_Companion.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleInactive(Alias_Companion.GetActorRef(), True, False, True)
  Utility.Wait(0.100000001)
  DismissedCrew.RemoveRef(CompanionREF as ObjectReference)
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  Actor SamCoeREF = Alias_SamCoe.GetActorRef()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
  Actor VladimirREF = Alias_Vladimir.GetActorRef()
  If !AndrejaREF.IsInLocation(MQ201B_Marker_Andreja.GetCurrentLocation())
    AndrejaREF.MoveTo(MQ201B_Marker_Andreja, 0.0, 0.0, 0.0, True, False)
  EndIf
  If !BarrettREF.IsInLocation(MQ201BMarker_Barrett.GetCurrentLocation())
    BarrettREF.MoveTo(MQ201BMarker_Barrett, 0.0, 0.0, 0.0, True, False)
  EndIf
  If !SamCoeREF.IsInLocation(MQ201BMarker_Sam.GetCurrentLocation())
    SamCoeREF.MoveTo(MQ201BMarker_Sam, 0.0, 0.0, 0.0, True, False)
  EndIf
  If !CoraCoeREF.IsInLocation(MQ201BMarker_Cora.GetCurrentLocation())
    CoraCoeREF.MoveTo(MQ201BMarker_Cora, 0.0, 0.0, 0.0, True, False)
  EndIf
  If !SarahMorganREF.IsInLocation(MQ201B_Marker_Sarah.GetCurrentLocation())
    SarahMorganREF.MoveTo(MQ201B_Marker_Sarah, 0.0, 0.0, 0.0, True, False)
  EndIf
  If !VladimirREF.IsInLocation(EyeVladimirMarker.GetCurrentLocation())
    VladimirREF.MoveTo(EyeVladimirMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0022_Item_00()
  MQ201B_01_AndrejaScene.Start()
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_BoxTrigger.GetRef().BlockActivation(True, True)
  WwiseEvent_QST_MQ201_TextBox_ScannerRepair.Play(Game.GetPlayer() as ObjectReference, None, None)
  MQ201B_BoxMSGSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  MQ201B_02a_AndrejaScene_Success.Start()
  Self.SetObjectiveCompleted(110, True)
EndFunction

Function Fragment_Stage_0030_Item_01()
  Alias_BoxTrigger.GetRef().BlockActivation(True, True)
  WwiseEvent_QST_MQ201_TextBox_ScannerRepair.Play(Game.GetPlayer() as ObjectReference, None, None)
  MQ201B_BoxMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  MQ201B_02b_AndrejaScene_Fail.Start()
  MQ201BSparksEnableMarker_Andreja.Enable(False)
  Self.SetObjectiveDisplayed(120, False, False)
  Self.SetObjectiveDisplayed(130, False, False)
  Self.SetObjectiveDisplayed(140, False, False)
  Self.SetObjectiveDisplayed(150, False, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0042_Item_00()
  MQ201B_01_BarrettScene.Start()
  Self.SetObjectiveDisplayed(130, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ201B_02a_BarrettScene_Success.Start()
  Self.SetObjectiveCompleted(130, True)
EndFunction

Function Fragment_Stage_0050_Item_01()
  MQ201B_02b_BarrettScene_Fail.Start()
  MQ201BSparksEnableMarker_Barrett.Enable(False)
  Self.SetObjectiveDisplayed(120, False, False)
  Self.SetObjectiveDisplayed(110, False, False)
  Self.SetObjectiveDisplayed(140, False, False)
  Self.SetObjectiveDisplayed(150, False, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(130, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0052_Item_00()
  MQ201B_01_SamScene.Start()
  Self.SetObjectiveDisplayed(140, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_WelderTrigger.GetRef().BlockActivation(True, True)
  WwiseEvent_QST_MQ201_TextBox_Welding.Play(Game.GetPlayer() as ObjectReference, None, None)
  MQ201B_WelderingMSGSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  MQ201B_02a_SamScene_Success.Start()
  Self.SetObjectiveCompleted(140, True)
EndFunction

Function Fragment_Stage_0060_Item_01()
  Alias_WelderTrigger.GetRef().BlockActivation(True, True)
  WwiseEvent_QST_MQ201_TextBox_Welding.Play(Game.GetPlayer() as ObjectReference, None, None)
  MQ201B_WelderingMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  MQ201B_02b_SamScene_Fail.Start()
  MQ201BSparksEnableMarker_Sam.Enable(False)
  Self.SetObjectiveDisplayed(120, False, False)
  Self.SetObjectiveDisplayed(130, False, False)
  Self.SetObjectiveDisplayed(110, False, False)
  Self.SetObjectiveDisplayed(150, False, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0062_Item_00()
  MQ201B_01_SarahScene.Start()
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Alias_WrenchTrigger.GetRef().BlockActivation(True, True)
  WwiseEvent_QST_MQ201_TextBox_WrenchSparks.Play(Game.GetPlayer() as ObjectReference, None, None)
  MQ201B_WrenchMSGSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  MQ201B_02a_SarahScene_Success.Start()
  Self.SetObjectiveCompleted(150, True)
EndFunction

Function Fragment_Stage_0070_Item_01()
  Alias_WrenchTrigger.GetRef().BlockActivation(True, True)
  WwiseEvent_QST_MQ201_TextBox_WrenchSparks.Play(Game.GetPlayer() as ObjectReference, None, None)
  MQ201B_WrenchMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  MQ201B_02b_SarahScene_Fail.Start()
  MQ201BSparksEnableMarker_Sarah.Enable(False)
  Self.SetObjectiveDisplayed(120, False, False)
  Self.SetObjectiveDisplayed(130, False, False)
  Self.SetObjectiveDisplayed(140, False, False)
  Self.SetObjectiveDisplayed(110, False, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ00_CompanionAtEye.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  mq201bscript kmyQuest = __temp as mq201bscript
  Game.StopDialogueCamera(False, False)
  Self.CompleteAllObjectives()
  MQ202.SetStage(10)
  kmyQuest.ResetCompanionsHomeLink()
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  Actor SamCoeREF = Alias_SamCoe.GetActorRef()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
  If COM_Quest_Andreja_Commitment.IsRunning() || COM_Quest_Andreja_Q01.IsRunning()
    (SQ_Companions as sq_companionsscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0)
    AndrejaREF.EvaluatePackage(False)
  ElseIf COM_Quest_Barrett_Commitment.IsRunning() || COM_Quest_Barrett_Q01.IsRunning() || COM_Quest_Barrett_Q02.IsRunning()
    (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0)
    BarrettREF.EvaluatePackage(False)
  ElseIf COM_Quest_SamCoe_Commitment.IsRunning() || COM_Quest_SamCoe_Q01.IsRunning()
    (SQ_Companions as sq_companionsscript).SetRoleActive(SamCoeREF, True, True, 0.0, 0.0)
    SamCoeREF.EvaluatePackage(False)
  ElseIf COM_Quest_SarahMorgan_Commitment.IsRunning() || COM_Quest_SarahMorgan_Q01.IsRunning()
    (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0)
    SarahMorganREF.EvaluatePackage(False)
  EndIf
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  mq201bscript kmyQuest = __temp as mq201bscript
  Self.CompleteAllObjectives()
  kmyQuest.ResetCompanionsHomeLink()
  Self.Stop()
EndFunction
