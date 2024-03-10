ScriptName TrapElectrifiedWaterScript Extends TrapBase

;-- Variables ---------------------------------------
Int soundInstanceID

;-- Properties --------------------------------------
Group TrapElectrifiedWaterData
  VisualEffect Property HazardEffect Auto Const
  { Visual effect to play when player is in electrified water }
  wwiseevent Property HazardSound Auto Const
  { Sound to play when player is in electrified water }
EndGroup


;-- Functions ---------------------------------------

Function HandleOnUnload()
  wwiseevent.StopInstance(soundInstanceID)
EndFunction

Function BecomeActive()
  Self.Enable(False)
  HazardEffect.Play(Self as ObjectReference, -1.0, None)
  soundInstanceID = HazardSound.Play(Self as ObjectReference, None, None)
EndFunction

Function BecomeInactive()
  HazardEffect.Stop(Self as ObjectReference)
  Self.Disable(False)
  wwiseevent.StopInstance(soundInstanceID)
EndFunction
