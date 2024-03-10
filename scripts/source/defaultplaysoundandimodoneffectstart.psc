ScriptName DefaultPlaySoundAndImodOnEffectStart Extends ActiveMagicEffect default
{ For playing an imagespace, a sound, or both when Potions are used, typically when these should be played only once the Data Menu is closed. }

;-- Variables ---------------------------------------
Bool bDonePlayingEffects = False
Int soundInstance = -1
Int waitForMenuTimer = 1 Const
Float waitForMenuTimerDuration = 0.01 Const

;-- Properties --------------------------------------
Group OptionalProperties
  wwiseevent Property SoundEvent Auto Const
  { Optional: The Sound Event to play. }
  ImageSpaceModifier Property theImod Auto Const
  { Optional: The Imagespace Modifier to play. }
  Bool Property StartWhenGameIsRunning = True Auto Const
  { Optional: If true, VFX/SFX won't start playing until game is not paused (e.g. if effect starts from using a potion from inventory) }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.PlayEffects(True)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.PlayEffects(False)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == waitForMenuTimer && soundInstance < 0 && !bDonePlayingEffects
    Self.PlayEffects(True)
  EndIf
EndEvent

Function PlayEffects(Bool startPlaying)
  If startPlaying
    If StartWhenGameIsRunning == False || Utility.IsGameMenuPaused() == False
      If SoundEvent
        soundInstance = SoundEvent.Play(Self.GetTargetActor() as ObjectReference, None, None)
      EndIf
      If theImod
        theImod.Apply(1.0)
      EndIf
    Else
      Self.StartTimer(waitForMenuTimerDuration, waitForMenuTimer)
    EndIf
  Else
    If soundInstance > -1
      wwiseevent.StopInstance(soundInstance)
      soundInstance = -1
    EndIf
    If theImod
      theImod.Remove()
    EndIf
    bDonePlayingEffects = True
  EndIf
EndFunction
