ScriptName DefaultCounterAliasIncOnceOnActivateC Extends DefaultCounterQuestIncOnceOnActivate default
{ Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuestC script }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquestc).Increment()
EndFunction
