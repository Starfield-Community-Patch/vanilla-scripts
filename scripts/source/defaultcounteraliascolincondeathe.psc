ScriptName DefaultCounterAliasColIncOnDeathE Extends DefaultCounterQuestRefColIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestE script. }

;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue
    (Self.GetOwningQuest() as defaultcounterqueste).TargetValue = Self.GetCount()
  EndIf
  (Self.GetOwningQuest() as defaultcounterqueste).Increment()
  If RemoveWhenDead
    Self.RemoveRef(akSenderRef)
    If MaintainTargetValue
      (Self.GetOwningQuest() as defaultcounterqueste).Decrement()
    EndIf
  EndIf
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1
    Self.GetOwningQuest().SetStage(RemainingStage)
  EndIf
EndFunction
