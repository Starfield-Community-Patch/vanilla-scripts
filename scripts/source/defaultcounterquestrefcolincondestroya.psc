ScriptName DefaultCounterQuestRefColIncOnDestroyA Extends DefaultCounterQuestRefColIncOnDestroy default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestA script. }

;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue
    (Self.GetOwningQuest() as defaultcounterquesta).TargetValue = Self.GetCount()
  EndIf
  (Self.GetOwningQuest() as defaultcounterquesta).Increment()
  If RemoveWhenDestroyed
    Self.RemoveRef(akSenderRef)
    If MaintainTargetValue
      (Self.GetOwningQuest() as defaultcounterquesta).Decrement()
    EndIf
  EndIf
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1
    Self.GetOwningQuest().SetStage(RemainingStage)
  EndIf
EndFunction
