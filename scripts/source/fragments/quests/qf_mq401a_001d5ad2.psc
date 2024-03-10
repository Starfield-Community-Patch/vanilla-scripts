ScriptName Fragments:Quests:QF_MQ401a_001D5AD2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript
  Self.SetObjectiveDisplayed(10, True, False)
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).CleanUpNormalMainQuest()
  kmyQuest.EnableQuestActors()
  Alias_Armillary.GetRef().DisableNoWait(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.AddtoFaction(ConstellationFaction)
  PlayerREF.additem(LodgeKey as Form, 1, False)
  PlayerREF.AddtoFaction(EyeBoardingFaction)
  Self.CompleteAllObjectives()
  MQ402.SetStage(100)
  MQ402.SetStage(510)
EndFunction
