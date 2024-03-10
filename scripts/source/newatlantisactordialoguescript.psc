ScriptName NewAtlantisActorDialogueScript Extends Actor conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property HoursPassed_LastInteraction Auto conditional
GlobalVariable Property HoursPassed Auto conditional Const
ActorValue Property DialogueVersion Auto conditional Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference AkActionRef)
  Int CurrentVersion = Self.GetValue(DialogueVersion) as Int
  If HoursPassed_LastInteraction + 1.0 < HoursPassed.GetValue()
    Self.SetValue(DialogueVersion, (CurrentVersion + 1) as Float)
    HoursPassed_LastInteraction = HoursPassed.GetValue()
  EndIf
EndEvent
