ScriptName LandyScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RAD05 Auto Const mandatory

;-- Functions ---------------------------------------

Function RestartRAD05()
  RAD05.Reset()
  RAD05.Stop()
  RAD05.Reset()
  RAD05.Start()
EndFunction
