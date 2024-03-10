ScriptName Fragments:Scenes:SF_COM_Barrett_TopLevel_Frie_0014A9F5 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ActorValue Property COM_StoryGatesCompleted Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_05_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.MakeRomantic()
  If Self.GetOwningQuest().GetStageDone(1000)
    kmyQuest.MakeCommitted()
  EndIf
EndFunction
