ScriptName DefaultMusicActivateScript Extends ObjectReference default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required
  Int Property MusicTypeToPlay = 0 Auto Const
  { Set this to the Music you want triggered
		0 = Dread
		1 = Reveal
		2 = Reward
		3 = Stinger }
  Bool Property PlayShortVersion = False Auto Const
  { Whether or not to play the short version of the MusicTypeToPlay. }
  MusicType Property MusicOverride Auto Const
  { Select a specific Music Type to play, will override any other setting on this script. }
EndGroup

Group NoTouchy collapsedonref
  MusicType[] Property Music Auto Const
  MusicType[] Property MusicShort Auto Const
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    If MusicOverride
      Self.GoToState("Done")
      MusicOverride.Add()
    Else
      Self.GoToState("Done")
      If PlayShortVersion
        MusicShort[MusicTypeToPlay].Add()
      Else
        Music[MusicTypeToPlay].Add()
      EndIf
    EndIf
  EndEvent
EndState
