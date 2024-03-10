ScriptName DefaultCounterAliasIncOnceOnActivateB Extends DefaultCounterQuestIncOnceOnActivate default
{ Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuestB script }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquestb).Increment()
EndFunction
