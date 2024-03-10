ScriptName RL066_SoundTriggerScript Extends ObjectReference default
{ Plays a random sound at a random interval }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  wwiseevent[] Property SoundToPlayEvent Auto Const mandatory
  { The sounds to be played. }
  Keyword Property LinkCustom01 Auto Const
  { play the sound from this link }
  Bool Property StopSound = False Auto
  { stops playing sounds if true }
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference triggerRef)
    If triggerRef == Game.GetPlayer() as ObjectReference
      ObjectReference soundSource = Self.GetLinkedRef(LinkCustom01)
      If soundSource == None
        soundSource = triggerRef
      EndIf
      While StopSound == False
        Int index = Utility.RandomInt(0, SoundToPlayEvent.Length - 1)
        SoundToPlayEvent[index].Play(soundSource, None, None)
        Float waitTime = Utility.RandomFloat(1.0, 5.0)
        Utility.Wait(waitTime)
      EndWhile
      If StopSound == True
        Self.GoToState("Done")
      EndIf
    EndIf
  EndEvent
EndState
