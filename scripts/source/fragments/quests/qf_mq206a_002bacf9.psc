ScriptName Fragments:Quests:QF_MQ206A_002BACF9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestMQ206AMSG Auto Const mandatory
GlobalVariable Property MQ_CompanionDead Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
Scene Property MQ206A_002_TransitionFuneral Auto Const mandatory
ReferenceAlias Property Alias_Casket Auto Const mandatory
ReferenceAlias Property Alias_JacobCoe Auto Const mandatory
ReferenceAlias Property Alias_AjaMamasa Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Quest Property DialogueUCTheLodge Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
ObjectReference Property LodgeStartMarker Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_Podium Auto Const mandatory
Scene Property MQ206A_006_PodiumDone Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ObjectReference Property MQ206A_PlayerContemplatesMarker Auto Const mandatory
Scene Property MQ206A_004_Casket Auto Const mandatory
ReferenceAlias Property Alias_SetStage35Trigger Auto Const mandatory
Scene Property MQ206A_007a_SarahSpeech Auto Const mandatory
Scene Property MQ206A_007b_BarrettSpeech Auto Const mandatory
ReferenceAlias Property Alias_MatteoKhatri Auto Const mandatory
ReferenceAlias Property Alias_LodgeBed Auto Const mandatory
Scene Property MQ206A_002b_PlayerSkip Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
Scene Property MQ206A_007b_MatteoSpeech Auto Const mandatory
Quest Property MQ204xPostQuest Auto Const mandatory
ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
ReferenceAlias Property Alias_LilianHart Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
ObjectReference Property MQ204EyeAttackEnableMarker Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
ReferenceAlias Property Alias_Sona Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01_Post Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_VladimirSall Auto Const mandatory
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
Keyword Property AnimFaceArchetypeDepressed Auto Const mandatory
LeveledItem Property LL_Drink_Alcohol_Expensive Auto Const mandatory
ReferenceAlias Property Alias_PodiumFurniture Auto Const mandatory
ReferenceAlias Property Alias_PictureAndreja Auto Const mandatory
ReferenceAlias Property Alias_PictureBarrett Auto Const mandatory
ReferenceAlias Property Alias_PictureSamCoe Auto Const mandatory
ReferenceAlias Property Alias_PictureSarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_MemorialEaselTrigger Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
ReferenceAlias Property Alias_Vasco Auto Const mandatory
Quest Property COM_Quest_Andreja_Commitment Auto Const mandatory
Quest Property COM_Quest_Andreja_Q01 Auto Const mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Quest Property COM_Quest_SamCoe_Commitment Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Commitment Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  MQ102.Stop()
  MQ204.SetStage(620)
  MQ204.SetStage(1000)
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef() as ObjectReference)
    Alias_SarahMorgan.getActorRef().disable(False)
    COM_Quest_SarahMorgan_Q01.SetStage(1000)
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef() as ObjectReference)
    Alias_SamCoe.getActorRef().disable(False)
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef() as ObjectReference)
    Alias_Andreja.getActorRef().disable(False)
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef() as ObjectReference)
    Alias_Barrett.getActorRef().disable(False)
  EndIf
  PlayerREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  DialogueUCTheLodge.SetStage(10)
  DialogueUCTheLodge.SetStage(20)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  MQ102.Stop()
  MQ204.SetStage(620)
  MQ204.SetStage(1000)
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If ButtonPressed == 0
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef() as ObjectReference)
    Alias_SarahMorgan.getActorRef().disable(False)
    COM_Quest_SarahMorgan_Q01.SetStage(1000)
  ElseIf ButtonPressed == 1
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef() as ObjectReference)
    Alias_SamCoe.getActorRef().disable(False)
  ElseIf ButtonPressed == 2
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef() as ObjectReference)
    Alias_Andreja.getActorRef().disable(False)
  ElseIf ButtonPressed == 3
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef() as ObjectReference)
    Alias_Barrett.getActorRef().disable(False)
  EndIf
  PlayerREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
  DialogueUCTheLodge.SetStage(10)
  DialogueUCTheLodge.SetStage(20)
  Self.SetStage(10)
  Self.SetStage(15)
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Noel.getActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_Noel.getActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.SetMemorialWaitGameDay()
  Alias_LodgeBed.GetRef().BlockActivation(True, False)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0017_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  MQ206A_002b_PlayerSkip.Start()
EndFunction

Function Fragment_Stage_0018_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.UpdateGameTimeOnSkip()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CallMemorialTimer()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayedAtTop(20)
  Self.SetObjectiveDisplayed(25, True, False)
EndFunction

Function Fragment_Stage_0020_Item_01()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  Alias_SetStage35Trigger.GetRef().EnableNoWait(False)
  Actor AndrejaREF = Alias_Andreja.getActorRef()
  Actor BarrettREF = Alias_Barrett.getActorRef()
  Actor SamCoeREF = Alias_SamCoe.getActorRef()
  Actor SarahMorganREF = Alias_SarahMorgan.getActorRef()
  Actor CoraCoeREF = Alias_CoraCoe.getActorRef()
  Actor MatteoKhatriREF = Alias_MatteoKhatri.getActorRef()
  Actor NoelREF = Alias_Noel.getActorRef()
  Actor WalterREF = Alias_WalterStroud.getActorRef()
  Actor VladimirREF = Alias_VladimirSall.getActorRef()
  Actor VascoREF = Alias_Vasco.getActorRef()
  Actor CompanionREF = Alias_Companion.getActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleInActive(CompanionREF, True, False, True)
  DismissedCrew.RemoveRef(CompanionREF as ObjectReference)
  DisembarkingCrew.RemoveRef(CompanionREF as ObjectReference)
  MQ204LodgeAttackClutterEnableMarker.disable(False)
  Alias_LodgeBed.GetRef().BlockActivation(False, False)
  Alias_Casket.GetRef().EnableNoWait(False)
  ObjectReference PodiumREF = Alias_Podium.GetRef()
  PodiumREF.Enable(False)
  PodiumREF.BlockActivation(True, True)
  Alias_PodiumFurniture.GetRef().EnableNoWait(False)
  kmyQuest.SetMemorialTalksTotal()
  AndrejaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  AndrejaREF.EvaluatePackage(False)
  BarrettREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  BarrettREF.EvaluatePackage(False)
  SamCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  SamCoeREF.EvaluatePackage(False)
  SarahMorganREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  SarahMorganREF.EvaluatePackage(False)
  CoraCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  CoraCoeREF.EvaluatePackage(False)
  MatteoKhatriREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  MatteoKhatriREF.EvaluatePackage(False)
  NoelREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  NoelREF.EvaluatePackage(False)
  WalterREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  WalterREF.EvaluatePackage(False)
  VladimirREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
  VladimirREF.EvaluatePackage(False)
  Actor DeadCompanionREF = MQ00_CompanionWhoDies.getActorRef()
  If DeadCompanionREF == SamCoeREF
    Actor JacobCoeREF = Alias_JacobCoe.getActorRef()
    Actor LilianREF = Alias_LilianHart.getActorRef()
    JacobCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
    JacobCoeREF.EvaluatePackage(False)
    JacobCoeREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
    LilianREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
    LilianREF.EvaluatePackage(False)
    LilianREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
    LilianREF.EnableNoWait(False)
    Alias_PictureSamCoe.GetRef().Enable(False)
  ElseIf DeadCompanionREF == SarahMorganREF
    Actor AjaREF = Alias_AjaMamasa.getActorRef()
    Actor SonaREF = Alias_Sona.getActorRef()
    AjaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
    AjaREF.disable(False)
    AjaREF.EvaluatePackage(False)
    AjaREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
    AjaREF.Enable(False)
    If COM_Quest_SarahMorgan_Q01.GetStageDone(1000)
      SonaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
      SonaREF.EvaluatePackage(False)
      SonaREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
    EndIf
    Alias_PictureSarahMorgan.GetRef().Enable(False)
  ElseIf DeadCompanionREF == BarrettREF
    Actor ajaref = Alias_AjaMamasa.getActorRef()
    ajaref.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed)
    ajaref.disable(False)
    ajaref.EvaluatePackage(False)
    ajaref.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False)
    ajaref.Enable(False)
    Alias_PictureBarrett.GetRef().Enable(False)
  ElseIf DeadCompanionREF == AndrejaREF
    Alias_PictureAndreja.GetRef().Enable(False)
  EndIf
  DismissedCrew.RemoveRef(AndrejaREF as ObjectReference)
  DismissedCrew.RemoveRef(BarrettREF as ObjectReference)
  DismissedCrew.RemoveRef(SamCoeREF as ObjectReference)
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference)
  DismissedCrew.RemoveRef(VascoREF as ObjectReference)
  DisembarkingCrew.RemoveRef(AndrejaREF as ObjectReference)
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference)
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference)
  DisembarkingCrew.RemoveRef(VascoREF as ObjectReference)
  MQ206A_002_TransitionFuneral.Start()
EndFunction

Function Fragment_Stage_0035_Item_00()
  MQ206A_007a_SarahSpeech.Start()
EndFunction

Function Fragment_Stage_0035_Item_01()
  MQ206A_007b_MatteoSpeech.Start()
EndFunction

Function Fragment_Stage_0035_Item_02()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  MQ206A_002_TransitionFuneral.Stop()
  kmyQuest.CancelMemorialTimer()
  Self.SetObjectiveDisplayed(25, False, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  Alias_Noel.getActorRef().EvaluatePackage(False)
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().additem(LL_Drink_Alcohol_Expensive as Form, 1, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0080_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
EndFunction

Function Fragment_Stage_0180_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
  COM_Quest_SarahMorgan_Q01_Post.SetStage(20)
EndFunction

Function Fragment_Stage_0200_Item_00()
  MQ206A_006_PodiumDone.Start()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayedAtTop(50)
  ObjectReference PodiumREF = Alias_Podium.GetRef()
  PodiumREF.BlockActivation(True, True)
  Alias_MemorialEaselTrigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayedAtTop(30)
  Alias_SarahMorgan.getActorRef().EvaluatePackage(False)
  ObjectReference PodiumREF = Alias_Podium.GetRef()
  PodiumREF.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_MatteoKhatri.getActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0220_Item_01()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayedAtTop(30)
  ObjectReference PodiumREF = Alias_Podium.GetRef()
  PodiumREF.BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Alias_Barrett.getActorRef().EvaluatePackage(False)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Alias_WalterStroud.getActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_MatteoKhatri.getActorRef().EvaluatePackage(False)
  Alias_Andreja.getActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  kmyQuest.CheckMemorialTalks()
  Alias_MemorialEaselTrigger.GetRef().disable(False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Quest __temp = Self as Quest
  mq206ascript kmyQuest = __temp as mq206ascript
  MQ206A_004_Casket.Stop()
  kmyQuest.MQ206AEnableLayer = inputenablelayer.Create()
  kmyQuest.MQ206AEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  Game.ForceThirdPerson()
  Utility.Wait(5.0)
  Game.ForceFirstPerson()
  kmyQuest.MQ206AEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  kmyQuest.MQ206AEnableLayer = None
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(40, True)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Casket.GetRef().DisableNoWait(False)
  Alias_Podium.GetRef().DisableNoWait(False)
  Alias_PodiumFurniture.GetRef().DisableNoWait(False)
  Alias_PictureAndreja.GetRef().DisableNoWait(False)
  Alias_PictureBarrett.GetRef().DisableNoWait(False)
  Alias_PictureSamCoe.GetRef().DisableNoWait(False)
  Alias_PictureSarahMorgan.GetRef().DisableNoWait(False)
  Alias_MemorialEaselTrigger.GetRef().DisableNoWait(False)
  MQ204EyeAttackEnableMarker.DisableNoWait(False)
  Actor AndrejaREF = Alias_Andreja.getActorRef()
  Actor BarrettREF = Alias_Barrett.getActorRef()
  Actor SamCoeREF = Alias_SamCoe.getActorRef()
  Actor SarahMorganREF = Alias_SarahMorgan.getActorRef()
  Actor CoraCoeREF = Alias_CoraCoe.getActorRef()
  Actor MatteoKhatriREF = Alias_MatteoKhatri.getActorRef()
  Actor NoelREF = Alias_Noel.getActorRef()
  Actor WalterREF = Alias_WalterStroud.getActorRef()
  Actor VladimirREF = Alias_VladimirSall.getActorRef()
  AndrejaREF.ChangeAnimFaceArchetype(None)
  BarrettREF.ChangeAnimFaceArchetype(None)
  SamCoeREF.ChangeAnimFaceArchetype(None)
  SarahMorganREF.ChangeAnimFaceArchetype(None)
  CoraCoeREF.ChangeAnimFaceArchetype(None)
  MatteoKhatriREF.ChangeAnimFaceArchetype(None)
  NoelREF.ChangeAnimFaceArchetype(None)
  WalterREF.ChangeAnimFaceArchetype(None)
  VladimirREF.ChangeAnimFaceArchetype(None)
  Actor DeadCompanionREF = MQ00_CompanionWhoDies.getActorRef()
  If DeadCompanionREF == SamCoeREF
    Actor JacobCoeREF = Alias_JacobCoe.getActorRef()
    Actor LilianREF = Alias_LilianHart.getActorRef()
    JacobCoeREF.ChangeAnimFaceArchetype(None)
    LilianREF.ChangeAnimFaceArchetype(None)
    JacobCoeREF.DisableNoWait(False)
    LilianREF.DisableNoWait(False)
    CoraCoeREF.DisableNoWait(False)
  ElseIf DeadCompanionREF == SarahMorganREF
    Actor AjaREF = Alias_AjaMamasa.getActorRef()
    Actor SonaREF = Alias_Sona.getActorRef()
    AjaREF.ChangeAnimFaceArchetype(None)
    AjaREF.MovetoMyEditorLocation()
    If COM_Quest_SarahMorgan_Q01.GetStageDone(1000)
      SonaREF.ChangeAnimFaceArchetype(None)
      SonaREF.disable(False)
    EndIf
  ElseIf DeadCompanionREF == BarrettREF
    Actor ajaref = Alias_AjaMamasa.getActorRef()
    ajaref.ChangeAnimFaceArchetype(None)
    ajaref.MovetoMyEditorLocation()
  EndIf
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
EndFunction
