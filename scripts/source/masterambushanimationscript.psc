ScriptName MasterAmbushAnimationScript Extends ObjectReference
{ This script causes the ref to animate when activated }

;-- Variables ---------------------------------------
Bool isOpened = False

;-- Properties --------------------------------------
String Property sInitialAnim = "Reset" Auto
{ By default, this property is set to Reset. }
String Property sActivateAnim = "Open" Auto
{ By default, this property is set to Open. }
Float Property fDelay = 0.0 Auto
{ By default, this property is set to 0.0f. }

;-- Functions ---------------------------------------

Event onReset()
  Self.onLoad()
EndEvent

Event onLoad()
  If !isOpened
    Self.playAnimation(sInitialAnim)
  EndIf
EndEvent

;-- State -------------------------------------------
State busy

  Event onActivate(ObjectReference triggerRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waiting

  Event onActivate(ObjectReference triggerRef)
    Self.gotoState("busy")
    isOpened = True
    Utility.Wait(fDelay)
    Self.playAnimation(sActivateAnim)
  EndEvent
EndState
