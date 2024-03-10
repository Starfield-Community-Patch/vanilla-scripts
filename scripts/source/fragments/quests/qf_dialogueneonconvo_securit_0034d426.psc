ScriptName Fragments:Quests:QF_DialogueNeonConvo_Securit_0034D426 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueNeonConvo_SecurityCheckpoint Auto Const mandatory
ReferenceAlias Property Alias_ScanSceneEnabler Auto Const mandatory
ReferenceAlias Property Alias_CheckpointController Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  If Alias_ScanSceneEnabler.GetRef().IsDisabled() == True
    Alias_ScanSceneEnabler.GetRef().Enable(False)
    Alias_CheckpointController.GetRef().Enable(False)
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueNeonConvo_SecurityCheckpoint.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.Reset()
EndFunction
