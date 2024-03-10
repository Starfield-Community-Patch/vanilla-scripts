ScriptName AudioRepeaterActivator Extends ObjectReference
{ Repeats a given sound's playback }

;-- Variables ---------------------------------------
Bool bRunning = True
Int iPlaySoundTimerID = 1 Const

;-- Properties --------------------------------------
wwiseevent Property SoundDescriptor Auto Const
{ WwiseEvent that this script will play }
Float Property delayMin = 1.0 Auto Const
Float Property delayMax = 5.0 Auto Const

;-- Functions ---------------------------------------

Event OnCellAttach()
  bRunning = Self.isEnabled()
  If bRunning
    Self.StartTimer(Self.GetWaitTime(), iPlaySoundTimerID)
  EndIf
EndEvent

Event OnCellDetach()
  bRunning = False
  Self.CancelTimer(iPlaySoundTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iPlaySoundTimerID
    SoundDescriptor.Play(Self as ObjectReference, None, None)
    If bRunning && Self.isEnabled()
      Self.StartTimer(Self.GetWaitTime(), iPlaySoundTimerID)
    EndIf
  EndIf
EndEvent

Float Function GetWaitTime()
  Return Utility.RandomFloat(delayMin, delayMax)
EndFunction
