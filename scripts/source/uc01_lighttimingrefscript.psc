ScriptName UC01_LightTimingRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Int iShutOffWaitID = 2 Const
Int iTurnOnWaitID = 1 Const

;-- Properties --------------------------------------
Float Property WaitTime = 0.0 Auto Const
{ How long to wait after inital triggering before turning on this lights linked light }
Float Property ShutoffDelayTime = 0.0 Auto Const
{ How long to wait before triggering the shutoff impluse }
Keyword Property UC01_Spotlight_Keyword Auto Const
{ Keyword to control spotlight in conjuction with mural emissive turning on/off }
wwiseevent Property QST_UC01_Lights_Power_On_WEF Auto Const mandatory
{ Sound to play when a light turns on }
wwiseevent Property QST_UC01_Lights_Power_Off_WEF Auto Const mandatory
{ Sound to play when a light turns off }

;-- Functions ---------------------------------------

Function StartLightTimer(Bool bShutoff)
  If !bShutoff
    Self.StartTimer(WaitTime, iTurnOnWaitID)
  Else
    Self.StartTimer(ShutoffDelayTime, iShutOffWaitID)
  EndIf
EndFunction

Function TriggerLightUpdate(Bool bShutoff)
  UC01_LightTimingRefScript NextLight = Self.GetLinkedRef(None) as UC01_LightTimingRefScript
  ObjectReference Spotlight = Self.GetLinkedRef(UC01_Spotlight_Keyword)
  If bShutoff
    Self.CancelTimer(iTurnOnWaitID)
    Self.PlayAnimation("Play02")
    If Spotlight != None
      Spotlight.Disable(False)
    EndIf
    QST_UC01_Lights_Power_Off_WEF.Play(Self as ObjectReference, None, None)
    If NextLight
      NextLight.TriggerLightUpdate(True)
    EndIf
  Else
    Self.PlayAnimation("Play01")
    If Spotlight != None
      Spotlight.Enable(False)
    EndIf
    QST_UC01_Lights_Power_On_WEF.Play(Self as ObjectReference, None, None)
    If NextLight
      NextLight.StartLightTimer(False)
    EndIf
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTurnOnWaitID
    Self.TriggerLightUpdate(False)
  ElseIf aiTimerID == iShutOffWaitID
    Self.TriggerLightUpdate(True)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
