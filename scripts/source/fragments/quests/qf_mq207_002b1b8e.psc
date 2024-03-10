ScriptName Fragments:Quests:QF_MQ207_002B1B8E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Emissary Auto Const mandatory
Message Property MQ207HelmetRemovalMSG Auto Const mandatory
Message Property MQ207HunterHelmetRemovalMSG Auto Const mandatory
Scene Property MQ207_002_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Scene Property MQ207_004_LeaveScene Auto Const mandatory
ReferenceAlias Property Alias_HelixShip Auto Const mandatory
ReferenceAlias Property Alias_ScorpiusShip Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
ObjectReference Property MQ207_EmissaryMarker01 Auto Const mandatory
Faction Property MQ_EmissaryAllyFaction Auto Const mandatory
Message Property TestMQ206AMSG Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
Quest Property MQ206B Auto Const mandatory
ObjectReference Property MQ207_FinalScene_EmissaryMarker Auto Const mandatory
VoiceType Property NPCFSarahMorgan Auto Const mandatory
VoiceType Property NPCMSamCoe Auto Const mandatory
ReferenceAlias Property Alias_CompanionWhoDies Auto Const mandatory
VoiceType Property NPCFAndreja Auto Const mandatory
VoiceType Property NPCMBarrett Auto Const mandatory
Quest Property MQ301 Auto Const mandatory
Quest Property MQ206C Auto Const mandatory
Key Property MQ301MoonBaseKey Auto Const mandatory
Quest Property MQ207_PostQuestDialogue Auto Const mandatory
Scene Property MQ207_001b_AcceptHail Auto Const mandatory
Faction Property MQ_HunterAllyFaction Auto Const mandatory
Scene Property MQ207_001b_AcceptHail_NGPlus Auto Const mandatory
ActorValue Property MQ207_NGPlusCouncilAV Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
Idle Property Stage2 Auto Const mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearC Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Idle Property Stage1 Auto Const mandatory
Faction Property MQEmissaryHunterCrimeFaction Auto Const mandatory
Faction Property MQHunterCrimeFaction Auto Const mandatory
Idle Property Stage3 Auto Const mandatory
Idle Property Stage4 Auto Const mandatory
Outfit Property Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter Auto Const mandatory
Armor Property SpaceSuit_Starborn_Companion_PlayerOrFollower Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ207_StarbornHelmetTransition Auto Const mandatory
Armor Property SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE Auto Const mandatory
Quest Property MQ00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference)
    Alias_SarahMorgan.GetActorRef().disable(False)
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference)
    Alias_SamCoe.GetActorRef().disable(False)
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference)
    Alias_Andreja.GetActorRef().disable(False)
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference)
    Alias_Barrett.GetActorRef().disable(False)
  EndIf
  MQ206B.SetStage(800)
EndFunction

Function Fragment_Stage_0005_Item_00()
  spaceshipreference HelixREF = Alias_HelixShip.GetShipRef()
  spaceshipreference ScorpiusREF = Alias_ScorpiusShip.GetShipRef()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  HelixREF.disable(False)
  ScorpiusREF.Reset(None)
  ScorpiusREF.MoveTo(HelixOborumMarker, 0.0, 0.0, 0.0, True, False)
  ScorpiusREF.Enable(False)
  EmissaryREF.MoveTo(MQ207_EmissaryMarker01, 0.0, 0.0, 0.0, True, False)
  HunterREF.MoveTo(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False)
  HunterREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
  EmissaryREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
  ScorpiusREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  Game.SetInChargen(True, False, False)
  kmyQuest.MQ207EnableLayer = inputenablelayer.Create()
  kmyQuest.MQ207EnableLayer.DisablePlayerControls(False, True, False, False, False, False, True, False, False, False, False)
  kmyQuest.MQ207EnableLayer.EnableFastTravel(False)
  kmyQuest.MQ207EnableLayer.EnableFarTravel(False)
  kmyQuest.MQ207EnableLayer.EnableGravJump(False)
  Self.SetObjectiveDisplayed(10, True, False)
  MQ207_001b_AcceptHail.Start()
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0010_Item_01()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  kmyQuest.MQ207EnableLayer = inputenablelayer.Create()
  kmyQuest.MQ207EnableLayer.DisablePlayerControls(False, True, False, False, False, False, False, False, False, False, False)
  kmyQuest.MQ207EnableLayer.EnableFastTravel(False)
  kmyQuest.MQ207EnableLayer.EnableFarTravel(False)
  kmyQuest.MQ207EnableLayer.EnableGravJump(False)
  Self.SetObjectiveDisplayed(10, True, False)
  MQ207_001b_AcceptHail_NGPlus.Start()
  Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  If DeadCompanionREF == Alias_SarahMorgan.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCFSarahMorgan)
  ElseIf DeadCompanionREF == Alias_SamCoe.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCMSamCoe)
  ElseIf DeadCompanionREF == Alias_Andreja.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCFAndreja)
  ElseIf DeadCompanionREF == Alias_Barrett.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCMBarrett)
  EndIf
  MQ_EmissaryRevealed.SetValueInt(1)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  Game.SetInChargen(False, False, False)
  kmyQuest.MQ207EnableLayer.EnablePlayerControls(True, False, True, True, True, True, True, True, True, True, True)
  Game.GetPlayer().addtoFaction(MQ_HunterAllyFaction)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(15, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  kmyQuest.FollowersToldtoWait = (SQ_Followers as sq_followersscript).AllFollowersWait(None, True, False)
  Self.SetObjectiveCompleted(15, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Hunter.GetActorRef().EvaluatePackage(False)
  MUSGenesisStingerStarbornAppearC.Add()
EndFunction

Function Fragment_Stage_0205_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  EmissaryREF.PlayIdle(Stage2)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  If DeadCompanionREF == Alias_SarahMorgan.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCFSarahMorgan)
  ElseIf DeadCompanionREF == Alias_SamCoe.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCMSamCoe)
  ElseIf DeadCompanionREF == Alias_Andreja.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCFAndreja)
  ElseIf DeadCompanionREF == Alias_Barrett.GetActorRef()
    EmissaryREF.SetOverrideVoicetype(NPCMBarrett)
  EndIf
  EmissaryREF.PlayIdle(Stage3)
  WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(EmissaryREF as ObjectReference, None, None)
  MQ_EmissaryRevealed.SetValueInt(1)
EndFunction

Function Fragment_Stage_0215_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  EmissaryREF.PlayIdle(Stage1)
  HunterREF.PlayIdle(Stage1)
  EmissaryREF.RemoveItem(SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE as Form, 1, False, None)
  EmissaryREF.EquipItem(SpaceSuit_Starborn_Companion_PlayerOrFollower as Form, False, False)
  (EmissaryREF.GetBaseObject() as ActorBase).SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, True)
  EmissaryREF.SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, True)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.PlayIdle(Stage2)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  kmyQuest.SwitchToAquilus()
EndFunction

Function Fragment_Stage_0320_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  kmyQuest.SwitchToHunter()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetStage(215)
EndFunction

Function Fragment_Stage_0500_Item_01()
  Game.GetPlayer().SetValue(MQ207_NGPlusCouncilAV, 1.0)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(40, True)
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetObjectiveCompleted(50, True)
EndFunction

Function Fragment_Stage_0900_Item_00()
  MQ207_004_LeaveScene.Start()
EndFunction

Function Fragment_Stage_0910_Item_00()
  Alias_Emissary.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False)
  Self.CompleteAllObjectives()
  MQ301.SetStage(10)
  MQ206C.SetStage(10)
EndFunction

Function Fragment_Stage_1000_Item_01()
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False)
  Self.CompleteAllObjectives()
  MQ301.SetStage(10)
  MQ206C.SetStage(10)
EndFunction

Function Fragment_Stage_1000_Item_02()
  Self.CompleteAllObjectives()
  MQ301.SetStage(130)
  MQ206C.SetStage(10)
EndFunction

Function Fragment_Stage_1000_Item_03()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  kmyQuest.MQ207EnableLayer = None
  Game.AddAchievement(7)
EndFunction

Function Fragment_Stage_1010_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  (SQ_Followers as sq_followersscript).AllFollowersFollow(kmyQuest.FollowersToldtoWait)
  kmyQuest.FollowersToldtoWait = None
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest
  mq207script kmyQuest = __temp as mq207script
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  spaceshipreference HunterShipREF = Alias_ScorpiusShip.GetShipReference()
  spaceshipreference EmissaryShipREF = Alias_HelixShip.GetShipReference()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  Game.GetPlayer().RemoveFromFaction(MQ_HunterAllyFaction)
  EmissaryShipREF.disable(False)
  HunterShipREF.disable(False)
  MQ207_PostQuestDialogue.Start()
  HunterREF.SetCrimeFaction(MQHunterCrimeFaction)
  HunterShipREF.SetCrimeFaction(MQHunterCrimeFaction)
  EmissaryREF.SetCrimeFaction(None)
  HunterShipREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
  HunterREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
  EmissaryREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
  (MQ00 as mq00questscript).StartMQ207BFailsafeTimer()
EndFunction
