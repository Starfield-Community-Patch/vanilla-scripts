ScriptName DefaultCounterAliasIncOnceOnDeathB Extends DefaultCounterQuestIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestB script. }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquestb).Increment()
EndFunction
