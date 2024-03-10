ScriptName DefaultCounterQuestRefColIncOnDeath Extends RefCollectionAlias default hidden
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Int Property TargetRemainingCount = -1 Auto Const
  { After incrementing, if there are this many objects left in the collection or fewer, set RemainingStage. }
  Int Property RemainingStage = -1 Auto Const
  { After incrementing, if there are TargetRemainingCount objects left in the collection or fewer, set this stage. }
  Bool Property CheckForOnDyingInstead = False Auto Const
  { DefaultL FALSE. If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later. }
  Bool Property RemoveWhenDead = False Auto Const
  { Default: FALSE. After incrementing, remove the alias from the collection. If MaintainTargetValue=TRUE, also decrement the counter by 1. It essentially stays at 0 while the list shrinks. }
  Bool Property MaintainTargetValue = False Auto Const
  { Default: FALSE. Before incrementing, always set the counter's Target Value to match the length of this collection. }
EndGroup


;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue
    (Self.GetOwningQuest() as defaultcounterquest).TargetValue = Self.GetCount()
  EndIf
  (Self.GetOwningQuest() as defaultcounterquest).Increment()
  If RemoveWhenDead
    Self.RemoveRef(akSenderRef)
    If MaintainTargetValue
      (Self.GetOwningQuest() as defaultcounterquest).Decrement()
    EndIf
  EndIf
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1
    Self.GetOwningQuest().SetStage(RemainingStage)
  EndIf
EndFunction

;-- State -------------------------------------------
Auto State WaitingForDeath

  Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
    If CheckForOnDyingInstead
      Self.Increment(akSenderRef)
    EndIf
  EndEvent

  Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    If !CheckForOnDyingInstead
      Self.Increment(akSenderRef)
    EndIf
  EndEvent
EndState
