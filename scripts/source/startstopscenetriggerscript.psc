ScriptName StartStopSceneTriggerScript Extends ObjectReference Const
{ A trigger which will start or stop a scene on actor enter or exit. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property sceneToStartOnEnter Auto Const
{ Okay to leave blank - we'll just skip it if so }
Scene Property sceneToStartOnExit Auto Const
{ Okay to leave blank - we'll just skip it if so }
Scene Property sceneToStopOnEnter Auto Const
{ Okay to leave blank - we'll just skip it if so }
Scene Property sceneToStopOnExit Auto Const
{ Okay to leave blank - we'll just skip it if so }
Quest Property questToCheck Auto Const
{ only used if a pre-req stage is specified. }
Int Property preRequisiteStage Auto Const
{ if specified, scenes will only be started/stopped if this stage is done }
Bool Property bDisableAfterEnter = True Auto Const
Bool Property bDisableAfterExit = True Auto Const

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  If (akActionRef == Game.getPlayer() as ObjectReference) && (sceneToStopOnExit as Bool || sceneToStartOnExit as Bool)
    Bool bDoWork = False
    If preRequisiteStage
      If questToCheck.getStageDone(preRequisiteStage)
        bDoWork = True
      EndIf
    Else
      bDoWork = True
    EndIf
    If bDoWork
      If sceneToStopOnExit
        sceneToStopOnExit.stop()
      EndIf
      If sceneToStartOnExit
        sceneToStartOnExit.start()
      EndIf
      If bDisableAfterExit
        Self.disable(False)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.getPlayer() as ObjectReference) && (sceneToStopOnEnter as Bool || sceneToStartOnEnter as Bool)
    Bool bDoWork = False
    If preRequisiteStage
      If questToCheck.getStageDone(preRequisiteStage)
        bDoWork = True
      EndIf
    Else
      bDoWork = True
    EndIf
    If bDoWork
      If sceneToStopOnEnter
        sceneToStopOnEnter.stop()
      EndIf
      If sceneToStartOnEnter
        sceneToStartOnEnter.start()
      EndIf
      If bDisableAfterEnter
        Self.disable(False)
      EndIf
    EndIf
  EndIf
EndEvent
