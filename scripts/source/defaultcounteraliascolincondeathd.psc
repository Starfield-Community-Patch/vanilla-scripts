ScriptName DefaultCounterAliasColIncOnDeathD Extends DefaultCounterQuestRefColIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestD script. }

;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue
    (Self.GetOwningQuest() as defaultcounterquestd).TargetValue = Self.GetCount()
  EndIf
  (Self.GetOwningQuest() as defaultcounterquestd).Increment()
  If RemoveWhenDead
    Self.RemoveRef(akSenderRef)
    If MaintainTargetValue
      (Self.GetOwningQuest() as defaultcounterquestd).Decrement()
    EndIf
  EndIf
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1
    Self.GetOwningQuest().SetStage(RemainingStage)
  EndIf
EndFunction
