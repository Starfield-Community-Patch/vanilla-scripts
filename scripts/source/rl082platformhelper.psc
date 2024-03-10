ScriptName RL082PlatformHelper Extends ObjectReference
{ Script aniamting packages back and forth in third warehouse area }

;-- Variables ---------------------------------------
Int CraneIinstanceID
Float fposition = 1.0

;-- Properties --------------------------------------
wwiseevent Property WwiseEvent_AMB_RL083_MovingRailHook Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.Is3DLoaded()
    Self.StartTimer(0.100000001, 0)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  Self.SetAnimationVariableFloat("Speed", Utility.RandomFloat(0.100000001, 0.150000006))
  Self.SetAnimationVariableFloat("Position", fposition)
  CraneIinstanceID = WwiseEvent_AMB_RL083_MovingRailHook.Play(Self.GetLinkedRef(None), None, None)
  If Self.PlayAnimationAndWait("Play01", "done")
    wwiseevent.StopInstance(CraneIinstanceID)
  EndIf
  If fposition == 1.0
    fposition = 0.0
  Else
    fposition = 1.0
  EndIf
  If Self.Is3DLoaded()
    Self.StartTimer(Utility.RandomFloat(4.0, 7.0), 0)
  EndIf
EndEvent
