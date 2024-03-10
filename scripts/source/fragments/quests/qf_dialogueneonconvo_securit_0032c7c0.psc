ScriptName Fragments:Quests:QF_DialogueNeonConvo_Securit_0032C7C0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ScanSceneTrigger Auto Const mandatory
ReferenceAlias Property Alias_ScanSceneTriggerEnabler Auto Const mandatory
ReferenceAlias Property Alias_ScanSceneTriggerDisabler Auto Const mandatory
Scene Property DialogueNeonConvo_SecurityCheckpointScene Auto Const mandatory
Quest Property DialogueNeonConvo_SecurityCheckpoint_Controller Auto Const mandatory
ReferenceAlias Property Alias_CheckpointController Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_ScanSceneTrigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueNeonConvo_SecurityCheckpointScene.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_ScanSceneTrigger.GetRef().Disable(False)
  Alias_ScanSceneTriggerEnabler.GetRef().Disable(False)
  Alias_CheckpointController.GetRef().Disable(False)
  DialogueNeonConvo_SecurityCheckpoint_Controller.SetStage(20)
  Self.Stop()
  Self.Reset()
EndFunction
