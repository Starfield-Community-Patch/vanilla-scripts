ScriptName AliasSetStageOnActorValueChanged Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property WatchedValue Auto Const mandatory
{ The actor value to watch for }
Int Property AVThreshold Auto Const mandatory
{ When your actor value get BELOW this number, set the appropriate stage. So if you want it to fire when your AV is zero, set this to a number more than zero }
Int Property StageToSet Auto Const mandatory
{ Stage to set when "ValueTarget" is reached on WatchedValue }
Int Property PrereqStage = -1 Auto Const
{ OPTIONAL: Don't start watching for this value until this stage is set }
Int Property ShutdownStage = -1 Auto Const
{ OPTIONAL: If this stage is set, you can clean up this registration }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference currRef = Self.GetRef()
  If currRef != None
    If ShutdownStage <= -1 || !Self.GetOwningQuest().GetStageDone(ShutdownStage)
      If PrereqStage >= 0
        Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
      Else
        Self.AliasValueRegistration(currRef)
      EndIf
    EndIf
    If ShutdownStage > 0 && !Self.GetOwningQuest().GetStageDone(ShutdownStage)
      Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    EndIf
  EndIf
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    ObjectReference currRef = Self.GetRef()
    If currRef != None
      Self.AliasValueRegistration(currRef)
    EndIf
  ElseIf auiStageID == ShutdownStage
    ObjectReference currref = Self.GetRef()
    Self.UnregisterForActorValueLessThanEvent(currref, WatchedValue, AVThreshold as Float)
  EndIf
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Quest OQ = Self.GetOwningQuest()
  ObjectReference currRef = Self.GetRef()
  Bool passedThreshold = False
  If (OQ.GetStageDone(PrereqStage) || PrereqStage < 0) && (!OQ.GetStageDone(ShutdownStage) || ShutdownStage < 0)
    Int currentValue = Math.Ceiling(currRef.GetValue(WatchedValue))
    If akObjRef == currRef && akActorValue == WatchedValue && currentValue < AVThreshold
      passedThreshold = True
      OQ.SetStage(StageToSet)
    EndIf
  EndIf
  If !passedThreshold
    Self.AliasValueRegistration(akObjRef)
  EndIf
EndEvent

Function AliasValueRegistration(ObjectReference akTargetRef)
  If akTargetRef != None
    Self.RegisterForActorValueLessThanEvent(akTargetRef, WatchedValue, AVThreshold as Float)
  EndIf
EndFunction
