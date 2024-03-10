ScriptName CuttableWallOnOpenScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom02 Auto Const mandatory
Int Property QuestStageToSet Auto Const
Int Property QuestPrereqStage = -1 Auto Const
Int Property QuestTurnOffStage = -1 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(Self.GetRef().GetLinkedRef(LinkCustom02) as ScriptObject, "OnOpen")
EndEvent

Event ObjectReference.OnOpen(ObjectReference akSender, ObjectReference akActionRef)
  Quest MyQuest = Self.GetOwningQuest()
  MyQuest.SetStage(QuestStageToSet)
EndEvent
