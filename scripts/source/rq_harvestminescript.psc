ScriptName RQ_HarvestMineScript Extends RQScript conditional

;-- Variables ---------------------------------------
Float RegisterRocksCollectionTimer = 1.0 Const
Int RegisterRocksCollectionTimerID = 1 Const
Int harvestTotalMin = 0

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard RegisterRocksGuard

;-- Properties --------------------------------------
Group HarvestMineGroup
  ActorValue Property ProduceUses Auto Const mandatory
  Int Property RockCurrent Auto conditional
  GlobalVariable Property RQ_Settlement_HarvestMiner_01_CurrentCount Auto Const mandatory
  GlobalVariable Property RQ_Settlement_HarvestMiner_01_MaxCount Auto Const mandatory
  GlobalVariable Property RQ_Settlement_HarvestMiner_01_QTCount Auto Const mandatory
  RefCollectionAlias Property RocksCollection Auto Const
  Int Property HarvestCountRequiredMax = 15 Auto Const
  { max to harvest required (even if there are more than that in the cave) }
  Int Property HarvestCountRequiredMin = 8 Auto Const
  { max to harvest required (even if there are more than that in the cave) }
  Float Property QTCountPercentage = 0.649999976 Auto Const
  { at what % of total do QTs start appearing? }
  Int Property RockCollectionObjective = 100 Auto Const
  Int Property RocksCollectedStage = 300 Auto Const
  { Stage to set when all minerals have been collected. }
  Int Property ShutdownStage = 999 Auto Const
  { Stage to set when all minerals have been collected. }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  harvestTotalMin = Utility.RandomInt(HarvestCountRequiredMin, HarvestCountRequiredMax)
  Self.UpdateRocksCollection(False)
  If RQ_Settlement_HarvestMiner_01_MaxCount.GetValueInt() == 0
    Self.SetStage(ShutdownStage)
  Else
    Self.RegisterForRemoteEvent(RocksCollection as ScriptObject, "OnAliasChanged")
  EndIf
EndFunction

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.UnregisterForRemoteEvent(RocksCollection as ScriptObject, "OnAliasChanged")
  Self.StartTimer(RegisterRocksCollectionTimer, RegisterRocksCollectionTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == RegisterRocksCollectionTimerID
    Self.RegisterRocks()
  EndIf
EndEvent

Function UpdateRocksCollection(Bool checkProduceUses)
  Int I = RocksCollection.GetCount() - 1
  While I >= 0
    ObjectReference rockRef = RocksCollection.GetAt(I)
    Form rockBase = rockRef.GetBaseObject()
    If rockRef.IsDisabled() || rockRef.Is3DLoaded() && rockBase is Flora == False
      RocksCollection.RemoveRef(rockRef)
    EndIf
    I -= 1
  EndWhile
  Int rockTotal = RocksCollection.GetCount()
  rockTotal = Math.Min(harvestTotalMin as Float, rockTotal as Float) as Int
  RQ_Settlement_HarvestMiner_01_MaxCount.SetValueInt(rockTotal)
  RQ_Settlement_HarvestMiner_01_CurrentCount.SetValueInt(0)
  RQ_Settlement_HarvestMiner_01_QTCount.SetValueInt((rockTotal as Float * QTCountPercentage) as Int)
  Self.UpdateCurrentInstanceGlobal(RQ_Settlement_HarvestMiner_01_MaxCount)
  Self.UpdateCurrentInstanceGlobal(RQ_Settlement_HarvestMiner_01_CurrentCount)
EndFunction

Function RegisterRocks()
  Guard RegisterRocksGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.UpdateRocksCollection(False)
    Int rockTotal = RQ_Settlement_HarvestMiner_01_MaxCount.GetValueInt()
    If rockTotal == 0
      Self.SetStage(RocksCollectedStage)
    Else
      Int I = 0
      While I < RocksCollection.GetCount()
        ObjectReference rockRef = RocksCollection.GetAt(I)
        Self.RegisterForActorValueLessThanEvent(rockRef, ProduceUses, 1.0)
        I += 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.ModObjectiveGlobal(1.0, RQ_Settlement_HarvestMiner_01_CurrentCount, RockCollectionObjective, -1.0, True, True, True, False)
  If RQ_Settlement_HarvestMiner_01_CurrentCount.GetValueInt() as Float >= RQ_Settlement_HarvestMiner_01_MaxCount.GetValue()
    Self.SetStage(RocksCollectedStage)
  EndIf
EndEvent
