ScriptName CFCredTankScript Extends ObjectReference
{ Activator script for CF_CredTanks. }

;-- Variables ---------------------------------------
Float CONST_AnimVariableSpeedMax = 10.0 Const
String CONST_AnimVariable_Position = "Position" Const
String CONST_AnimVariable_Speed = "Speed" Const
String CONST_Animation_Insert = "Play01" Const
String CONST_Animation_Remove = "Play02" Const
Float CONST_CredTankProximityMaxRange = 20.0 Const
Float CONST_CredTankProximityMinRange = 8.0 Const
Float CONST_UpdateTimerDelay = 0.25 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard UpdateCredTankGuard

;-- Properties --------------------------------------
Group Optional_SetStageProperties
  Quest Property QuestToSetStageOn Auto Const
  { OPTIONAL. Quest to set a stage on when the CredTank is opened. }
  Int Property StageToSet = -1 Auto Const
  { OPTIONAL. Stage to set. }
  Int Property PrereqStage = -1 Auto Const
  { OPTIONAL. If set, StageToSet will only be set if this stage has been set. }
  Int Property TurnOffStage = -1 Auto Const
  { OPTIONAL. If set, StageToSet will not be set if the quest is at this stage or higher. }
  Int Property TurnOffStageDone = -1 Auto Const
  { OPTIONAL. If set, StageToSet will not be set if this specific stage has been set. }
EndGroup

Group AutofillProperties
  Key Property CF_GalbankTransferModule Auto Const mandatory
  LeveledItem Property LL_CFCredtankCredits Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ResetCredTank()
  Self.GoToState("Waiting")
  Self.OnCellLoad()
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.GoToState("Done")
    Self.SetAnimationVariableFloat(CONST_AnimVariable_Position, 1.0)
    Self.PlayAnimationAndWait(CONST_Animation_Insert, "Done")
    Utility.Wait(2.0)
    Game.GetPlayer().AddItem(LL_CFCredtankCredits as Form, 1, False)
    If QuestToSetStageOn != None && StageToSet >= 0
      If (PrereqStage < 0 || QuestToSetStageOn.GetStageDone(PrereqStage)) && (TurnOffStage < 0 || QuestToSetStageOn.GetStage() < TurnOffStage) && (TurnOffStageDone < 0 || !QuestToSetStageOn.GetStageDone(TurnOffStageDone))
        QuestToSetStageOn.SetStage(StageToSet)
      EndIf
    EndIf
    Self.PlayAnimation(CONST_Animation_Remove)
    Self.SetAnimationVariableFloat(CONST_AnimVariable_Speed, CONST_AnimVariableSpeedMax)
    Self.SetAnimationVariableFloat(CONST_AnimVariable_Position, 0.0)
    Self.BlockActivation(True, True)
  EndEvent

  Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    Self.StartTimer(0.0, 0)
  EndEvent

  Event OnTimer(Int timerID)
    Float newPosition = 1.0 - Math.Min(Math.Max(Math.Max(Game.GetPlayer().GetDistance(Self as ObjectReference) - CONST_CredTankProximityMinRange, 0.0) / (CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange), 0.0), 1.0)
    Self.SetAnimationVariableFloat("Position", newPosition)
    If newPosition > 0.0
      Self.StartTimer(CONST_UpdateTimerDelay, 0)
    Else
      Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self as ScriptObject, CONST_CredTankProximityMaxRange, 0)
    EndIf
  EndEvent

  Event OnCellLoad()
    If Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) > 0
      Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self as ScriptObject, CONST_CredTankProximityMaxRange, 0)
      Self.BlockActivation(False, False)
    Else
      Self.BlockActivation(True, True)
    EndIf
  EndEvent
EndState
