ScriptName DefaultCounterAliasIncOnceOnActivateA Extends DefaultCounterQuestIncOnceOnActivate default
{ Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuestA script }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquesta).Increment()
EndFunction
