ScriptName Fragments:Quests:QF_RQ_Settlement_Heal_01_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_WoundedPerson Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
Potion Property Aid_MedPack Auto Const
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
ActorValue Property SQ_WoundedState Auto Const mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
GlobalVariable Property SQ_WoundedState_2_Healed Auto Const mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const mandatory
Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  kmyQuest.SetQuestHookDialogueAVs()
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept()
  Alias_WoundedPerson.GetRef().MoveTo(Alias_WoundedMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_WoundedPerson.GetActorRef().SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue())
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_WoundedPerson.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept()
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
  Alias_DungeonMapMarker.GetRef().AddToMapScanned(False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  Self.SetStage(10)
  Alias_WoundedPerson.GetActorRef().Enable(False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept()
  If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Game.GetPlayer().GetItemCount(Aid_MedPack as Form) >= 1
    Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None)
  EndIf
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  defaultcaptivewoundedalias captiveAlias = Alias_WoundedPerson as defaultcaptivewoundedalias
  captiveAlias.HealActor(True)
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False)
  Alias_WoundedPerson.GetActorRef().SetProtected(False)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics)
EndFunction

Function Fragment_Stage_0475_Item_00()
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  Self.SetObjectiveCompleted(300, True)
  Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics)
  If !Self.GetStageDone(990)
    Self.SetStage(995)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  If Self.GetStageDone(100)
    Self.SetStage(990)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  If !Self.GetStageDone(995)
    Self.SetStage(990)
  EndIf
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  If Self.GetStageDone(100)
    Self.FailAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script
  If !Self.GetStageDone(990)
    Self.CompleteAllObjectives()
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
    kmyQuest.SetDialogueAV_Hello_Stressed_Success()
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics)
EndFunction
