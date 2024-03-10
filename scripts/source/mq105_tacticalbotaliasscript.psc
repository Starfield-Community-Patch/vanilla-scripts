ScriptName MQ105_TacticalBotAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property RobotSeesPlayerStage = 650 Auto Const
Int Property RobotSeesPlayerPrereqStage = 600 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.GetOwningQuest().GetStageDone(RobotSeesPlayerStage) == False
    Self.RegisterForDistanceLessThanEvent(Self.getActorRef() as ScriptObject, Game.GetPlayer() as ScriptObject, 4.0, 0)
  EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(RobotSeesPlayerPrereqStage) && myQuest.GetStageDone(RobotSeesPlayerStage) == False
    myQuest.SetStage(RobotSeesPlayerStage)
  EndIf
EndEvent

Event OnUnLoad()
  Self.UnregisterForDistanceEvents(Self.getActorRef() as ScriptObject, Game.GetPlayer() as ScriptObject, -1)
EndEvent
