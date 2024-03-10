ScriptName DR009_MalfunctioningPlatformScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] travelPositions
Int travelSoundEventInstanceID = -1
Int waitTimerID = 0

;-- Properties --------------------------------------
Float Property MovementSpeed Auto Const
Float Property MinWaitSeconds Auto Const
Float Property MaxWaitSeconds Auto Const
wwiseevent Property TravelSoundEvent Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  travelPositions = Self.GetLinkedRefChain(None, 100)
  Self.TravelToRandomPosition()
EndEvent

Event OnUnload()
  If travelSoundEventInstanceID != -1 && TravelSoundEvent != None
    wwiseevent.StopInstance(travelSoundEventInstanceID)
  EndIf
EndEvent

Event OnTranslationComplete()
  If TravelSoundEvent != None
    wwiseevent.StopInstance(travelSoundEventInstanceID)
    travelSoundEventInstanceID = -1
  EndIf
  Self.WaitRandomSeconds()
EndEvent

Function TravelToRandomPosition()
  Int travelPostionIndex = Utility.RandomInt(0, travelPositions.Length - 1)
  ObjectReference travelPosition = travelPositions[travelPostionIndex]
  Self.TranslateToRef(travelPosition, MovementSpeed, 0.0)
  If travelSoundEventInstanceID == -1 && TravelSoundEvent != None
    travelSoundEventInstanceID = TravelSoundEvent.Play(Self as ObjectReference, None, None)
  EndIf
EndFunction

Function WaitRandomSeconds()
  Float waitSeconds = Utility.RandomFloat(MinWaitSeconds, MaxWaitSeconds)
  Self.StartTimer(waitSeconds, waitTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == waitTimerID
    Self.TravelToRandomPosition()
  EndIf
EndEvent
