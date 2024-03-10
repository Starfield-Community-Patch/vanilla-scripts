ScriptName Fragments:Quests:QF_COM_Quest_Andreja_Commitm_000B8633 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Andreja Auto Const
sq_companionsscript Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Activator Property COM_CQ_TxtReplace_QuestName_Andreja Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, True, None, COM_CQ_TxtReplace_QuestName_Andreja)
  Alias_MapMarker.GetReference().Enable(False)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.IsObjectiveCompleted(10) == False
    Self.SetObjectiveCompleted(10, True)
  EndIf
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
  kmyQuest.GiveCommitmentGift()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
  Self.CompleteAllObjectives()
  kmyQuest.MakeCommitted()
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, False, None, None)
  Self.Stop()
EndFunction
