ScriptName TestSnapInteractionPlayerScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  Self.GetOwningQuest().SetStage(10)
EndEvent
