ScriptName City_AkilaLife05Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ProduceUses Auto Const mandatory
Int Property RockCurrent Auto
Int Property RockTotal Auto
GlobalVariable Property AkilaLife05_RocksCurrent Auto Const mandatory
RefCollectionAlias Property RocksCollection Auto Const

;-- Functions ---------------------------------------

Function RegisterRocks()
  Int I = 0
  Int iCount = RocksCollection.GetCount()
  While I < iCount
    Self.RegisterForActorValueLessThanEvent(RocksCollection.GetAt(I), ProduceUses, 1.0)
    I += 1
  EndWhile
EndFunction

Event OnQuestStarted()
  Self.RegisterRocks()
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  akObjRef.Disable(False)
  RockCurrent += 1
  Self.ModObjectiveGlobal(1.0, AkilaLife05_RocksCurrent, 300, -1.0, True, True, True, False)
  If RockCurrent >= RockTotal
    Self.SetStage(300)
  EndIf
EndEvent
