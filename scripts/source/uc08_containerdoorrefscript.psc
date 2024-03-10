ScriptName UC08_ContainerDoorRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC08 Auto Const mandatory
{ Managing quest }
Int Property StageToReenableActivation = 350 Auto Const
{ Once this stage is set on UC08, it's okay for the doors to have activation again }
Int Property DisableActivationStage = 1000 Auto Const
{ If this stage is set, disable activation again }

;-- Functions ---------------------------------------

Event OnLoad()
  If UC08.GetStageDone(DisableActivationStage) || !UC08.GetStageDone(StageToReenableActivation)
    Self.BlockActivation(True, True)
  EndIf
EndEvent
