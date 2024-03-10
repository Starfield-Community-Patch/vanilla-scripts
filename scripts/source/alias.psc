ScriptName Alias Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Quest Function GetOwningQuest() Native

Event OnAliasInit()
  ; Empty function
EndEvent

Event OnAliasReset()
  ; Empty function
EndEvent

Event OnAliasShutdown()
  ; Empty function
EndEvent

Event OnAliasStarted()
  ; Empty function
EndEvent

Function RefillAlias() Native

Function RefillDependentAliases() Native

Function StartObjectProfiling() Native

Function StopObjectProfiling() Native

Bool Function IsFilled()
  If Self is ReferenceAlias
    Return (Self as ReferenceAlias).GetReference() != None
  ElseIf Self is RefCollectionAlias
    Return (Self as RefCollectionAlias).GetCount() > 0
  ElseIf Self is LocationAlias
    Return (Self as LocationAlias).GetLocation() != None
  EndIf
  Return False
EndFunction

Bool Function IsSameType(Alias AliasToCheck)
  If Self is ReferenceAlias
    Return AliasToCheck is ReferenceAlias
  ElseIf Self is RefCollectionAlias
    Return AliasToCheck is RefCollectionAlias
  ElseIf Self is LocationAlias
    Return AliasToCheck is LocationAlias
  EndIf
  Return False
EndFunction

Bool Function CopyIntoAlias(Alias TargetAlias, Bool SkipIfEmpty, Bool CopyOver)
  If Self.IsSameType(TargetAlias)
    If SkipIfEmpty == False || Self.IsFilled()
      If CopyOver || TargetAlias.IsFilled() == False
        ReferenceAlias targetReferenceAlias = TargetAlias as ReferenceAlias
        If targetReferenceAlias
          targetReferenceAlias.ForceRefTo((Self as ReferenceAlias).GetReference())
          Return True
        EndIf
        RefCollectionAlias targetRefCollectionAlias = TargetAlias as RefCollectionAlias
        If targetRefCollectionAlias
          targetRefCollectionAlias.RemoveAll()
          targetRefCollectionAlias.AddRefCollection(Self as RefCollectionAlias)
          Return True
        EndIf
        LocationAlias targetLocationAlias = TargetAlias as LocationAlias
        If targetLocationAlias
          targetLocationAlias.ForceLocationTo((Self as LocationAlias).GetLocation())
          Return True
        EndIf
      EndIf
    EndIf
  EndIf
  Return False
EndFunction
