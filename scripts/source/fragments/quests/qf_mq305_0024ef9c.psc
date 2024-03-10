ScriptName Fragments:Quests:QF_MQ305_0024EF9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ObjectReference Property UnityMovetoMarker Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Message Property MQ305_MSG_Romance Auto Const mandatory
ActorValue Property COM_IsRomantic Auto Const mandatory
Message Property MQ305_MSG_CF Auto Const mandatory
GlobalVariable Property MQ305_CF_SysDefEnding Auto Const mandatory
GlobalVariable Property MQ305_CF_PirateEnding Auto Const mandatory
Message Property MQ305_MSG_FSC Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeJailed Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeKilled Auto Const mandatory
Message Property MQ305_MSG_RI Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampNotPromoted Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampPromoted Auto Const mandatory
Message Property MQ305_MSG_UC Auto Const mandatory
GlobalVariable Property MQ305_UC_AcelesEnding Auto Const mandatory
GlobalVariable Property MQ305_UC_PlagueEnding Auto Const mandatory
Quest Property MQ206C Auto Const mandatory
Message Property MQ305JumpToUnityMSG Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
VoiceType Property NPCFSarahMorgan Auto Const mandatory
VoiceType Property NPCMSamCoe Auto Const mandatory
VoiceType Property NPCFAndreja Auto Const mandatory
VoiceType Property NPCMBarrett Auto Const mandatory
Message Property TestMQ206AMSG Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ObjectReference Property TestMQ303Marker01 Auto Const mandatory
ObjectReference Property MQ303_StarbornHunterMarker01 Auto Const mandatory
ReferenceAlias Property Alias_HunterShip Auto Const mandatory
ReferenceAlias Property Alias_EmissaryShip Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Quest Property MQ304_PostQuestDialogue Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
GlobalVariable Property COM_SamCoeRecruited Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ObjectReference Property MQ303EmissaryMarker01 Auto Const mandatory
MiscObject Property Mfg_Structural_Frame Auto Const mandatory
LeveledItem Property MQAllArtifacts Auto Const mandatory
Scene Property MQ305_002_Unity_01 Auto Const mandatory
Scene Property MQ305_002_Unity_04 Auto Const mandatory
Message Property MQ305_MSG_Starborn Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
Scene Property MQ305_Unity_01b Auto Const mandatory
ReferenceAlias Property Alias_UnityChair Auto Const mandatory
ReferenceAlias Property Alias_UnityDoor Auto Const mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
ObjectReference Property MQ207_EmissaryMarker01 Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const
Message Property MQ305ReturnFromUnityMSG Auto Const mandatory
Quest Property SQ_ENV Auto Const mandatory
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipArmillary Auto Const mandatory
GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const mandatory
ObjectReference Property MQ305InitialCollisionEnableMarker Auto Const mandatory
Scene Property MQ305_002_Unity_05 Auto Const mandatory
Scene Property MQ305_002_Unity_06 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
GlobalVariable Property MQ_CompanionDead Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
Quest Property MQ304b Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  Game.GetPlayer().addITem(Mfg_Structural_Frame as Form, 12, False)
  Game.GetPlayer().addITem(MQAllArtifacts as Form, 1, False)
  Game.GetPlayer().addtoFaction(EyeBoardingFaction)
  Int iRomance = MQ305_MSG_Romance.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iRomance == 0
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 1
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 2
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 3
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 4
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  EndIf
  Utility.Wait(0.100000001)
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference)
    Alias_SarahMorgan.GetActorRef().KillEssential(None)
    Alias_SarahMorgan.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt())
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference)
    Alias_SamCoe.GetActorRef().KillEssential(None)
    Alias_SamCoe.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt())
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference)
    Alias_Andreja.GetActorRef().KillEssential(None)
    Alias_Andreja.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference)
    Alias_Barrett.GetActorRef().KillEssential(None)
    Alias_Barrett.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt())
  EndIf
  Utility.Wait(0.100000001)
  Int iCFEnding = MQ305_MSG_CF.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iCFEnding == 0
    MQ305_CF_SysDefEnding.SetValueInt(1)
  ElseIf iCFEnding == 1
    MQ305_CF_PirateEnding.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iFSCEnding = MQ305_MSG_FSC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iFSCEnding == 0
    MQ305_FSC_RonHopeKilled.SetValueInt(1)
  ElseIf iFSCEnding == 1
    MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1)
  ElseIf iFSCEnding == 2
    MQ305_FSC_RonHopeJailed.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iRIEnding = MQ305_MSG_RI.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iRIEnding == 0
    MQ305_RI_NeuroampPromoted.SetValueInt(1)
  ElseIf iRIEnding == 1
    MQ305_RI_NeuroampNotPromoted.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iUCEnding = MQ305_MSG_UC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iUCEnding == 0
    MQ305_UC_PlagueEnding.SetValueInt(1)
  ElseIf iUCEnding == 1
    MQ305_UC_AcelesEnding.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iStarbornEnding = MQ305_MSG_Starborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iStarbornEnding == 0
    MQ302_SidedWithChoice.SetValueInt(0)
  ElseIf iStarbornEnding == 1
    MQ302_SidedWithChoice.SetValueInt(1)
  ElseIf iStarbornEnding == 2
    MQ302_SidedWithChoice.SetValueInt(2)
  EndIf
  Alias_SamCoe.GetActorRef().addtoFaction(AvailableCompanionFaction)
  Alias_Andreja.GetActorRef().addtoFaction(AvailableCompanionFaction)
  COM_SamCoeRecruited.SetValue(1.0)
  Alias_Barrett.GetActorRef().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  Alias_EmissaryShip.GetRef().Enable(False)
  Alias_HunterShip.GetRef().Enable(False)
  Alias_Emissary.GetActorRef().moveto(MQ303EmissaryMarker01, 0.0, 0.0, 0.0, True, False)
  Alias_Hunter.GetActorRef().moveto(MQ303_StarbornHunterMarker01, 0.0, 0.0, 0.0, True, False)
  MQ206C.SetStage(1000)
  Self.SetStage(10)
  MQ304_PostQuestDialogue.Start()
  MQ303.SetStage(210)
  Game.ShowRaceMenu(None, 0, None, None, None)
  Utility.Wait(0.100000001)
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Int iRomance = MQ305_MSG_Romance.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iRomance == 0
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 1
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 2
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 3
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 4
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  EndIf
  Utility.Wait(0.100000001)
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference)
    Alias_SarahMorgan.GetActorRef().KillEssential(None)
    Alias_SarahMorgan.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt())
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference)
    Alias_SamCoe.GetActorRef().KillEssential(None)
    Alias_SamCoe.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt())
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference)
    Alias_Andreja.GetActorRef().KillEssential(None)
    Alias_Andreja.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference)
    Alias_Barrett.GetActorRef().KillEssential(None)
    Alias_Barrett.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt())
  EndIf
  Utility.Wait(0.100000001)
  Int iCFEnding = MQ305_MSG_CF.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iCFEnding == 0
    MQ305_CF_SysDefEnding.SetValueInt(1)
  ElseIf iCFEnding == 1
    MQ305_CF_PirateEnding.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iFSCEnding = MQ305_MSG_FSC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iFSCEnding == 0
    MQ305_FSC_RonHopeKilled.SetValueInt(1)
  ElseIf iFSCEnding == 1
    MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1)
  ElseIf iFSCEnding == 2
    MQ305_FSC_RonHopeJailed.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iRIEnding = MQ305_MSG_RI.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iRIEnding == 0
    MQ305_RI_NeuroampPromoted.SetValueInt(1)
  ElseIf iRIEnding == 1
    MQ305_RI_NeuroampNotPromoted.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iUCEnding = MQ305_MSG_UC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iUCEnding == 0
    MQ305_UC_PlagueEnding.SetValueInt(1)
  ElseIf iUCEnding == 1
    MQ305_UC_AcelesEnding.SetValueInt(1)
  ElseIf iUCEnding == 2
    MQ305_UC_SterilizationEnding.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iStarbornEnding = MQ305_MSG_Starborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iStarbornEnding == 0
    MQ302_SidedWithChoice.SetValueInt(0)
  ElseIf iStarbornEnding == 1
    MQ302_SidedWithChoice.SetValueInt(1)
  ElseIf iStarbornEnding == 2
    MQ302_SidedWithChoice.SetValueInt(2)
  EndIf
  Game.ShowRaceMenu(None, 0, None, None, None)
  Utility.Wait(0.100000001)
  Game.GetPlayer().moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False)
  (SQ_ENV as sq_env_afflictionsscript).CureAllAfflictions()
  Game.GetPlayer().ResetHealthAndLimbs()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ102.CompleteQuest()
  Int iRomance = MQ305_MSG_Romance.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iRomance == 0
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0)
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 1
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 2
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 3
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  ElseIf iRomance == 4
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0)
  EndIf
  Utility.Wait(0.100000001)
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference)
    Alias_SarahMorgan.GetActorRef().KillEssential(None)
    Alias_SarahMorgan.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt())
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference)
    Alias_SamCoe.GetActorRef().KillEssential(None)
    Alias_SamCoe.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt())
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference)
    Alias_Andreja.GetActorRef().KillEssential(None)
    Alias_Andreja.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference)
    Alias_Barrett.GetActorRef().KillEssential(None)
    Alias_Barrett.GetActorRef().disable(False)
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett)
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt())
  EndIf
  Utility.Wait(0.100000001)
  Int iCFEnding = MQ305_MSG_CF.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iCFEnding == 0
    MQ305_CF_SysDefEnding.SetValueInt(1)
  ElseIf iCFEnding == 1
    MQ305_CF_PirateEnding.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iFSCEnding = MQ305_MSG_FSC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iFSCEnding == 0
    MQ305_FSC_RonHopeKilled.SetValueInt(1)
  ElseIf iFSCEnding == 1
    MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1)
  ElseIf iFSCEnding == 2
    MQ305_FSC_RonHopeJailed.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iRIEnding = MQ305_MSG_RI.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iRIEnding == 0
    MQ305_RI_NeuroampPromoted.SetValueInt(1)
  ElseIf iRIEnding == 1
    MQ305_RI_NeuroampNotPromoted.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iUCEnding = MQ305_MSG_UC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iUCEnding == 0
    MQ305_UC_PlagueEnding.SetValueInt(1)
  ElseIf iUCEnding == 1
    MQ305_UC_AcelesEnding.SetValueInt(1)
  EndIf
  Utility.Wait(0.100000001)
  Int iStarbornEnding = MQ305_MSG_Starborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If iStarbornEnding == 0
    MQ302_SidedWithChoice.SetValueInt(0)
  ElseIf iStarbornEnding == 1
    MQ302_SidedWithChoice.SetValueInt(1)
  ElseIf iStarbornEnding == 2
    MQ302_SidedWithChoice.SetValueInt(2)
  EndIf
  Game.ShowRaceMenu(None, 0, None, None, None)
  Utility.Wait(0.100000001)
  Game.GetPlayer().moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False)
  Game.SetCharGenHUDMode(1)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  MQAlllowArmillaryGravDrive.SetValueInt(1)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayedAtTop(30)
  If MQ401_SkipMQ.GetValueInt() == 0
    Self.SetObjectiveDisplayed(50, True, False)
  EndIf
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(40)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  spaceshipreference PlayerShipREF = Alias_PlayerShip.GetShipRef()
  PlayerShipREF.LockPowerAllocation(3, -1, True)
  PlayerShipREF.SetPartPower(3, -1, 0)
  MQ305JumpToUnityMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Self.SetObjectiveDisplayedAtTop(60)
  Self.SetObjectiveDisplayed(70, True, False)
  kmyQuest.UpdateFriendTalkCount()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True)
EndFunction

Function Fragment_Stage_0051_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0053_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0054_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0055_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0056_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0057_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0058_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0059_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0061_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckFriendUnityTalks()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.LockPlayerControlsUnity()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveCompleted(80, True)
  If Alias_SamCoe.GetActorRef().IsDead()
    Alias_CoraCoe.GetActorRef().disable(False)
  EndIf
  Actor HunterREF = Alias_Hunter.GetActorRef()
  If !HunterREF.IsDead()
    HunterREF.disable(False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.CheckMultipleRomance()
  MQ305_002_Unity_01.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  MQ305InitialCollisionEnableMarker.DisableNoWait(False)
  MQ305_002_Unity_04.Start()
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  kmyQuest.EnableUnityEndScenes()
EndFunction

Function Fragment_Stage_0207_Item_00()
  MQ305_002_Unity_06.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  MQ305ReturnFromUnityMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(120, True, False)
  Self.SetObjectiveDisplayedAtTop(120)
  If MQ304b.IsRunning()
    If MQ304b.GetStageDone(10)
      MQ304b.SetStage(1300)
    Else
      MQ304b.Stop()
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  MQ305_002_Unity_04.Stop()
  MQ305_002_Unity_05.Start()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  mq305script kmyQuest = __temp as mq305script
  Game.AddAchievement(10)
  Self.CompleteAllObjectives()
  kmyQuest.EnterUnity()
EndFunction
