ScriptName LC039QTTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC039Quest Auto Const mandatory
Int Property QuestStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  LC039Quest.SetStage(QuestStage)
EndEvent
