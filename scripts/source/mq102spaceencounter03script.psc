ScriptName MQ102SpaceEncounter03Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ102 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  MQ102.SetStage(605)
EndEvent
