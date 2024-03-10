ScriptName DefaultCounterAliasIncOnceOnDeathA Extends DefaultCounterQuestIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestA script. }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquesta).Increment()
EndFunction
