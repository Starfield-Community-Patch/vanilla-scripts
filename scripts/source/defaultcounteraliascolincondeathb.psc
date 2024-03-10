ScriptName DefaultCounterAliasColIncOnDeathB Extends DefaultCounterQuestRefColIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestB script. }

;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue
    (Self.GetOwningQuest() as defaultcounterquestb).TargetValue = Self.GetCount()
  EndIf
  (Self.GetOwningQuest() as defaultcounterquestb).Increment()
  If RemoveWhenDead
    Self.RemoveRef(akSenderRef)
    If MaintainTargetValue
      (Self.GetOwningQuest() as defaultcounterquestb).Decrement()
    EndIf
  EndIf
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1
    Self.GetOwningQuest().SetStage(RemainingStage)
  EndIf
EndFunction
