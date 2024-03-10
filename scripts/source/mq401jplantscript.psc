ScriptName MQ401JPlantScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ401JPlantActivatePrompt Auto Const mandatory

;-- State -------------------------------------------
State HasbeenTriggered

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnLoad()
    Self.GotoState("HasbeenTriggered")
    ObjectReference MyRef = Self.GetRef()
    MyRef.SetActivateTextOverride(MQ401JPlantActivatePrompt)
    MyRef.BlockActivation(True, False)
  EndEvent
EndState
