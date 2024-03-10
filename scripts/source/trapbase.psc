ScriptName TrapBase Extends ObjectReference conditional
{ base script for all trap scripts }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapBaseData
  Keyword Property TrapStartInactiveKeyword Auto Const mandatory
  { keyword to indicate if the trap should start in the inactive state }
  Bool Property bActive = True Auto conditional hidden
  Bool Property bDisarmed = False Auto conditional hidden
EndGroup


;-- Functions ---------------------------------------

Function BecomeActive()
  ; Empty function
EndFunction

Function BecomeInactive()
  ; Empty function
EndFunction

Function HandleOnLoad()
  ; Empty function
EndFunction

Function HandleOnUnload()
  ; Empty function
EndFunction

Event OnCellLoad()
  Self.HandleOnLoad()
  If bDisarmed
    Self.GotoState("unloaded")
  ElseIf Self.HasKeyword(TrapStartInactiveKeyword)
    Self.GotoState("Inactive")
  Else
    Self.GotoState("Active")
  EndIf
EndEvent

Event OnUnload()
  Self.HandleOnUnload()
  Self.GotoState("unloaded")
EndEvent

Function SetActive(Bool bSetActive)
  ; Empty function
EndFunction

Function Disarm()
  bDisarmed = True
  Self.GotoState("unloaded")
EndFunction

;-- State -------------------------------------------
State Active

  Event OnActivate(ObjectReference akActionRef)
    Self.SetActive(False)
  EndEvent

  Function SetActive(Bool bSetActive)
    If bSetActive == False
      Self.GotoState("Inactive")
    EndIf
  EndFunction

  Event OnBeginState(String asOldState)
    bActive = True
    Self.BecomeActive()
  EndEvent
EndState

;-- State -------------------------------------------
State Inactive

  Event OnActivate(ObjectReference akActionRef)
    Self.SetActive(True)
  EndEvent

  Function SetActive(Bool bSetActive)
    If bSetActive
      Self.GotoState("Active")
    EndIf
  EndFunction

  Event OnBeginState(String asOldState)
    bActive = False
    Self.BecomeInactive()
  EndEvent
EndState

;-- State -------------------------------------------
Auto State unloaded

  Function SetActive(Bool bSetActive)
    ; Empty function
  EndFunction
EndState
