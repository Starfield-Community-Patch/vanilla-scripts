ScriptName FFCydoniaZ07QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ProduceUses Auto Const mandatory
ReferenceAlias Property HeartOfMars Auto Const mandatory
Int Property ReturnStage = 300 Auto Const

;-- Functions ---------------------------------------

Function RegisterOre()
  Self.RegisterForActorValueLessThanEvent(HeartOfMars.GetRef(), ProduceUses, 1.0)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  akObjRef.Disable(False)
  Self.SetStage(ReturnStage)
EndEvent
