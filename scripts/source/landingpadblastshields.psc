ScriptName LandingPadBlastShields Extends ObjectReference
{ Handle the opening and closing of the landing pad blast shields. }

;-- Variables ---------------------------------------
Int BeforeOpenTimerID = 3 Const
Int OpenToCloseTimerID = 2 Const

;-- Properties --------------------------------------
Float Property BaseAnimSpeed = 1.0 Auto Const
Float Property AnimSpeedVariance = 0.0 Auto Const
Float Property BeforeOpenTimer = 12.0 Auto Const
Float Property OpenToCloseTimer = 13.0 Auto Const
Keyword Property LinkedRef_LandingPadShield_EnableMarker Auto Const mandatory
String Property blastShieldOpen = "Play01" Auto Const
String Property blastShieldClose = "Play02" Auto Const
String Property blastShieldInstantClose = "StateA_Idle" Auto Const

;-- Functions ---------------------------------------

Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
  ; Empty function
EndEvent

Function ActivateBlastShields(Bool isLanding)
  Self.GoToState("Busy")
  If isLanding
    Self.StartTimer(BeforeOpenTimer, BeforeOpenTimerID)
  Else
    Self.StartTimer(0.0, BeforeOpenTimerID)
  EndIf
EndFunction

Event OnCellLoad()
  Self.AnimateBlastShields(blastShieldInstantClose)
EndEvent

Function AnimateBlastShields(String animationString)
  ObjectReference[] linkedrefs = Self.GetLinkedRefChain(None, 100)
  Int index = 0
  While index < linkedrefs.Length
    ObjectReference blastShield = linkedrefs[index]
    Self.AnimateBlastShield(blastShield, animationString)
    index += 1
  EndWhile
EndFunction

Function AnimateBlastShield(ObjectReference blastShield, String animationString)
  If blastShield as Bool && blastShield.Is3DLoaded()
    blastShield.SetAnimationVariableFloat("AnimSpeed", BaseAnimSpeed + Utility.RandomFloat(-AnimSpeedVariance, AnimSpeedVariance))
    blastShield.PlayAnimation(animationString)
  EndIf
EndFunction

;-- State -------------------------------------------
State Busy

  Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
    ; Empty function
  EndEvent

  Event OnTimer(Int aiTimerID)
    If aiTimerID == OpenToCloseTimerID
      Self.AnimateBlastShields(blastShieldClose)
      ObjectReference EnableMarker = Self.GetLinkedRef(LinkedRef_LandingPadShield_EnableMarker)
      If EnableMarker
        EnableMarker.Disable(False)
      EndIf
      Self.GoToState("Idle")
    ElseIf aiTimerID == BeforeOpenTimerID
      Self.AnimateBlastShields(blastShieldOpen)
      ObjectReference enablemarker = Self.GetLinkedRef(LinkedRef_LandingPadShield_EnableMarker)
      If enablemarker
        enablemarker.Enable(False)
      EndIf
      Self.StartTimer(OpenToCloseTimer, OpenToCloseTimerID)
    EndIf
  EndEvent

  Event OnUnload()
    Self.CancelTimer(OpenToCloseTimerID)
    Self.CancelTimer(BeforeOpenTimerID)
    Self.GoToState("Idle")
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Idle

  Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
    If !abComplete
      Self.ActivateBlastShields(False)
      Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnShipTakeOff")
    EndIf
  EndEvent

  Event OnActivate(ObjectReference akActionRef)
    ObjectReference[] linkedrefs = Self.GetLinkedRefChain(None, 100)
    If linkedrefs.Length > 0
      spaceshipreference spaceshipRef = akActionRef as spaceshipreference
      If spaceshipRef
        Self.RegisterForRemoteEvent(spaceshipRef as ScriptObject, "OnShipTakeOff")
        Self.ActivateBlastShields(True)
      EndIf
    EndIf
  EndEvent
EndState
