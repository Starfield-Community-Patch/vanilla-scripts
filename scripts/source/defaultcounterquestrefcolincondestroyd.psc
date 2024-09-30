ScriptName DefaultCounterQuestRefColIncOnDestroyD extends DefaultCounterQuestRefColIncOnDestroy Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestA script.}

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuestD).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuestD).Increment()
	if (RemoveWhenDestroyed)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuestD).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (RemainingStage > -1))
		GetOwningQuest().SetStage(RemainingStage)
	EndIf
EndFunction