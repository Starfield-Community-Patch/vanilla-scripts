ScriptName Fragments:Quests:QF_COM_Quest_SarahMorgan_Com_0027B667 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property COM_Quest_SarahMorgan_Commitment_PreCeremony Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_AjaMamasa Auto Const mandatory
ReferenceAlias Property Alias_AbigailMorgan Auto Const mandatory
ActorValue Property COM_MEM_SarahMorgan_CommitmentMother Auto Const mandatory
ReferenceAlias Property Alias_SarahMarker Auto Const mandatory
ReferenceAlias Property Alias_AjaMarker Auto Const mandatory
ReferenceAlias Property Alias_AbigailMarker Auto Const mandatory
ReferenceAlias Property Alias_AjaPostCeremonyMarker Auto Const mandatory
ReferenceAlias Property Alias_AbigailPostCeremonyMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerMarker Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
Activator Property COM_CQ_TxtReplace_QuestName_SarahMorgan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  SQ_Companions.LockInCompanion(Alias_SarahMorgan.GetActorReference() as companionactorscript, True, None, COM_CQ_TxtReplace_QuestName_SarahMorgan)
  Self.SetStage(10)
  Actor myAja = Alias_AjaMamasa.GetActorRef()
  myAja.MoveTo(Alias_AjaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  myAja.Enable(False)
  If Alias_SarahMorgan.GetActorRef().GetValue(COM_MEM_SarahMorgan_CommitmentMother) == 1.0
    Self.SetStage(1)
  EndIf
EndFunction

Function Fragment_Stage_0001_Item_00()
  ObjectReference myAbigail = Alias_AbigailMorgan.GetActorRef() as ObjectReference
  myAbigail.Enable(False)
  myAbigail.MoveTo(Alias_AbigailMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_AbigailMorgan.GetActorRef().MoveTo(Alias_AbigailMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_SarahMorgan.GetActorRef().MoveTo(Alias_SarahMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(Alias_PlayerMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(1)
    Actor myAbigail = Alias_AbigailMorgan.GetActorRef()
    myAbigail.Enable(False)
    myAbigail.MoveTo(Alias_AbigailMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0031_Item_00()
  Self.SetObjectiveCompleted(30, True)
  If Self.GetStageDone(1)
    Self.SetStage(35)
  Else
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveDisplayed(35, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  If Self.IsObjectiveDisplayed(35)
    Self.SetObjectiveCompleted(35, True)
  EndIf
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0041_Item_00()
  COM_Quest_SarahMorgan_Commitment_PreCeremony.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Alias_SarahMorgan.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  comquestsarahmorgancommitmentscript kmyQuest = __temp as comquestsarahmorgancommitmentscript
  Self.SetObjectiveCompleted(60, True)
  SQ_Companions.LockInCompanion(Alias_SarahMorgan.GetActorReference() as companionactorscript, False, None, None)
  ((kmyQuest as Quest) as com_commitmentquestscript).MakeCommitted()
  kmyQuest.StartAbigailLeave()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaPostCeremonyMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(1)
    Alias_AbigailMorgan.GetActorRef().MoveTo(Alias_AbigailPostCeremonyMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_AbigailMorgan.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
