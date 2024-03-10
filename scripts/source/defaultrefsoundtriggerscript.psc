ScriptName DefaultRefSoundTriggerScript Extends ObjectReference default
{ Plays a sound when a ref enters the trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  wwiseevent Property SoundToPlayEvent Auto Const mandatory
  { The sound to be played. }
EndGroup

Group Optional_Properties
  Bool Property PlayerTriggerOnly = True Auto Const
  { DEFAULT: True. Should we trigger this for the player only? }
  Bool Property UseLinkKeyword = True Auto Const
  { DEFAULT: True. If True, play the sound using the LinkKeyword (next item). If False, just play the sound from this ref. }
  Bool Property PlayOnceOnly = True Auto Const
  { DEFAULT: True. Should we play this sound only once? }
  Keyword Property LinkKeyword Auto Const
  { DEFAULT: NONE. If this is linked to another ref with keyword LinkKeyword, play the sound from that ref. Otherwise, play the sound from the triggering ref. }
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference triggerRef)
    If !PlayerTriggerOnly || (triggerRef == Game.GetPlayer() as ObjectReference)
      If PlayOnceOnly
        Self.GoToState("Done")
      EndIf
      ObjectReference soundSource = None
      If UseLinkKeyword
        soundSource = Self.GetLinkedRef(LinkKeyword)
        If soundSource == None
          soundSource = triggerRef
        EndIf
      Else
        soundSource = Self as ObjectReference
      EndIf
      SoundToPlayEvent.Play(soundSource, None, None)
    EndIf
  EndEvent
EndState
