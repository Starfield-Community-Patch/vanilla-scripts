ScriptName MQ105PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property MoveWalterQuestStage = 17 Auto Const
Int Property WalterFollowingQuestStage = 20 Auto Const
Int Property LeaveNeonQuestStage = 900 Auto Const
Int Property TalkWalterQuestStage = 910 Auto Const

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(WalterFollowingQuestStage)
    myQuest.SetStage(MoveWalterQuestStage)
  EndIf
  If myQuest.GetStageDone(LeaveNeonQuestStage)
    myQuest.SetStage(TalkWalterQuestStage)
  EndIf
EndEvent
