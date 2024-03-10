ScriptName GlowingKlaxonLightScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property StartOn Auto
{ Whether the lights start on or not.  Default = FALSE }
Bool Property AutoOff = True Auto
{ Whether to have the klaxon automatically turn off or not.  Default = FALSE }
Int Property AutoOffTime = 10 Auto
{ Time before the klaxon automatically turns off. }

;-- Functions ---------------------------------------

Function PlayLights()
  ObjectReference KlaxonLight = Self.GetLinkedRef(None)
  ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef(None)
  Self.PlayAnimation("Stage2")
  KlaxonLight.Enable(False)
  KlaxonLight.PlayAnimation("Stage2")
  If KlaxonSound
    KlaxonSound.Enable(False)
  EndIf
  If AutoOff
    Self.StartTimer(AutoOffTime as Float, 1)
  EndIf
  Self.gotoState("WaitingOn")
EndFunction

Function StopLights()
  ObjectReference KlaxonLight = Self.GetLinkedRef(None)
  ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef(None)
  Self.PlayAnimation("Reset")
  KlaxonLight.Disable(False)
  KlaxonLight.PlayAnimation("Reset")
  If KlaxonSound
    KlaxonSound.Disable(False)
  EndIf
  Self.CancelTimer(1)
  Self.gotoState("WaitingOff")
EndFunction

Event OnTimer(Int timerID)
  If timerID == 1
    Self.StopLights()
  EndIf
EndEvent

;-- State -------------------------------------------
State BlockingActivation
EndState

;-- State -------------------------------------------
Auto State WaitingOff

  Event OnActivate(ObjectReference akActionRef)
    Self.gotoState("BlockingActivation")
    Self.PlayLights()
  EndEvent

  Event OnLoad()
    If StartOn == True
      Self.gotoState("BlockingActivation")
      Self.PlayLights()
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State WaitingOn

  Event OnActivate(ObjectReference akActionRef)
    Self.gotoState("BlockingActivation")
    Self.StopLights()
  EndEvent
EndState
