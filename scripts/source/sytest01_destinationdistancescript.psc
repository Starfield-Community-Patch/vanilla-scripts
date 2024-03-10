ScriptName SYTest01_DestinationDistanceScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == 400
    PlayerShip.RefillAlias()
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 21000.0, 0)
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If Self.GetOwningQuest().GetStageDone(440)
    Self.GetOwningQuest().SetStage(460)
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 1000.0, 0)
  ElseIf Self.GetOwningQuest().GetStageDone(430)
    Self.GetOwningQuest().SetStage(440)
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 1000.0, 0)
  ElseIf Self.GetOwningQuest().GetStageDone(420)
    Self.GetOwningQuest().SetStage(430)
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 5000.0, 0)
  ElseIf Self.GetOwningQuest().GetStageDone(410)
    Self.GetOwningQuest().SetStage(420)
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 8000.0, 0)
  ElseIf Self.GetOwningQuest().GetStageDone(400)
    Self.GetOwningQuest().SetStage(410)
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 14000.0, 0)
  EndIf
EndEvent
