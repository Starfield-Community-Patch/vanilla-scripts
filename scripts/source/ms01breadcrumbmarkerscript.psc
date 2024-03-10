ScriptName MS01BreadcrumbMarkerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property DistanceTargerAlias Auto Const
Int Property PrereqStage Auto Const
Float Property DistanceToTrigger Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  If PrereqStage > 0
    Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
  Else
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, DistanceTargerAlias as ScriptObject, DistanceToTrigger, 0)
  EndIf
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, DistanceTargerAlias as ScriptObject, DistanceToTrigger, 0)
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.GetRef().Disable(False)
EndEvent
