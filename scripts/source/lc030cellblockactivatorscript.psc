ScriptName LC030CellBlockActivatorScript Extends ObjectReference
{ Script for the Cell Block switches in LC030. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ObjectProperties
  Int Property CellBlockID Auto Const mandatory
  Int Property SwitchReadyStage = 410 Auto Const
  Int Property SwitchUsedStage = 420 Auto Const
EndGroup

Group AutofillProperties
  Quest Property LC030 Auto Const mandatory
  Message Property LC030_SwitchNotReadyMessage Auto Const mandatory
  Message Property LC030_SwitchAlreadyUsedMessage Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.GotoState("Busy")
    If akActivator == Game.GetPlayer() as ObjectReference
      If !LC030.GetStageDone(SwitchReadyStage + CellBlockID)
        LC030_SwitchNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.GotoState("Waiting")
      ElseIf LC030.GetStageDone(SwitchUsedStage + CellBlockID)
        LC030_SwitchAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.GotoState("Waiting")
      Else
        ((Self as ObjectReference) as genericswitchscript).SetColor("White")
        LC030.SetStage(SwitchUsedStage + CellBlockID)
        Self.GotoState("Done")
      EndIf
    EndIf
  EndEvent
EndState
