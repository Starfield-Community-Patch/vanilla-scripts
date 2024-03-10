ScriptName Fragments:Quests:QF_COM_Companion_Barrett_001C7187 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property SQ_Companions Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property SmallCredits Auto Const mandatory
GlobalVariable Property MediumCredits Auto Const mandatory
GlobalVariable Property LargeCredits Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ActorValue Property OnPlayerShip Auto Const mandatory
ActorValue Property AV_TimesRomanced Auto Const mandatory
ActorValue Property AV_TimesMarried Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory
Message Property BQ02_PQ_AdvancingQuestWarning Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Faction_01_Small Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Faction_02_Medium Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Faction_03_Large Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
ActorValue Property COM_StoryGatesCompleted Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_COM_Barrett_PersonalQuestFollowup Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory
affinityevent Property COM_Barrett_QuestEvent_FrontierDestroyed Auto Const mandatory
ReferenceAlias Property Alias_BarrettShip Auto Const mandatory
affinityevent Property COM_Barrett_QuestEvent_FrontierDestroyed_Like Auto Const mandatory
Perk Property Crew_Ship_Weapons_ParticleBeam Auto Const mandatory
Perk Property Crew_Robotics Auto Const mandatory
Perk Property CREW_Ship_StarshipEngineering Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Alias_Barrett.GetActorRef().SetValue(COM_Affinity, 100.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  COM_Barrett_QuestEvent_FrontierDestroyed.Send(None)
  Alias_BarrettShip.Clear()
EndFunction

Function Fragment_Stage_0003_Item_01()
  COM_Barrett_QuestEvent_FrontierDestroyed_Like.Send(None)
  Alias_BarrettShip.Clear()
EndFunction

Function Fragment_Stage_0019_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_03_Large as Form, 1, False)
EndFunction

Function Fragment_Stage_0019_Item_01()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_02_Medium as Form, 1, False)
EndFunction

Function Fragment_Stage_0019_Item_02()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_01_Small as Form, 1, False)
EndFunction

Function Fragment_Stage_0051_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0052_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0060_Item_00()
  COM_Quest_Barrett_Q01.SetStage(8301)
EndFunction

Function Fragment_Stage_0069_Item_00()
  Quest __temp = Self as Quest
  com_barrett_epiloguetimerscript kmyQuest = __temp as com_barrett_epiloguetimerscript
  COM_Quest_Barrett_Q01.SetStage(7401)
  kmyQuest.StartCooldownTimer()
EndFunction

Function Fragment_Stage_0111_Item_00()
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0112_Item_00()
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0113_Item_00()
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0114_Item_00()
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0121_Item_00()
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0122_Item_00()
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  (SQ_Companions as sq_companionsscript).SetRoleActive(Alias_Barrett.GetActorRef(), True, True, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0208_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  COM_Quest_Barrett_Q02.Start()
EndFunction

Function Fragment_Stage_0213_Item_00()
  Self.SetStage(216)
EndFunction

Function Fragment_Stage_0216_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MediumCredits.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_0220_Item_00()
  If !Self.GetStageDone(211)
    Self.SetStage(21)
  EndIf
EndFunction

Function Fragment_Stage_0221_Item_00()
  Self.SetStage(230)
EndFunction

Function Fragment_Stage_0222_Item_00()
  Self.SetStage(230)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetStage(190)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(290)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetStage(290)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(390)
EndFunction

Function Fragment_Stage_0421_Item_00()
  Self.SetStage(26)
EndFunction

Function Fragment_Stage_0425_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, LargeCredits.GetValue() as Int, False, None)
  Self.SetStage(27)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  COM_WantsToTalkEvent_COM_Barrett_PersonalQuestFollowup.Send(None)
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.SetStage(390)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(490)
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0540_Item_00()
  Self.SetStage(490)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetStage(540)
EndFunction

Function Fragment_Stage_0560_Item_00()
  Self.SetStage(540)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(540)
  Self.SetStage(560)
EndFunction

Function Fragment_Stage_0690_Item_00()
  Self.SetStage(560)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(690)
EndFunction

Function Fragment_Stage_0731_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  kmyQuest.StoryGateSceneCompleted(True)
  Self.SetStage(750)
EndFunction

Function Fragment_Stage_0732_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  Self.SetStage(750)
  COM_Quest_Barrett_Q01.SetStage(7401)
EndFunction

Function Fragment_Stage_0740_Item_00()
  Self.SetStage(690)
EndFunction

Function Fragment_Stage_0750_Item_00()
  Quest __temp = Self as Quest
  com_barrett_epiloguetimerscript kmyQuest = __temp as com_barrett_epiloguetimerscript
  Actor PlayerREF = Game.GetPlayer()
  Float TimesRomanced = PlayerREF.GetValue(AV_TimesRomanced)
  Self.SetStage(740)
  If Self.GetStageDone(732)
    TimesRomanced += 1.0
    PlayerREF.SetValue(AV_TimesRomanced, TimesRomanced)
  EndIf
  kmyQuest.StartCooldownTimer()
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetStage(740)
EndFunction

Function Fragment_Stage_0831_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  kmyQuest.CommitmentDesired(True)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0832_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  kmyQuest.CommitmentDesired(True)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0840_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  Self.SetStage(740)
  kmyQuest.CommitmentDesired(True)
  kmyQuest.StartCommitmentQuest()
  kmyQuest.StoryGateSceneCompleted(True)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  Self.SetStage(840)
  Self.SetStage(870)
  If Self.GetStageDone(832)
    COM_Quest_Barrett_Commitment.SetStage(52)
  Else
    COM_Quest_Barrett_Commitment.SetStage(51)
  EndIf
  COM_Quest_Barrett_Commitment.SetStage(50)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  kmyQuest.MakeNotRomantic()
  kmyQuest.MakeNotCommitted(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  Actor PlayerREF = Game.GetPlayer()
  Float TimesMarried = PlayerREF.GetValue(AV_TimesMarried)
  TimesMarried += 1.0
  PlayerREF.SetValue(AV_TimesMarried, TimesMarried)
  kmyQuest.MakeCommitted()
EndFunction
