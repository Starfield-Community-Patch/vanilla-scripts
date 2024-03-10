ScriptName DialogueCydoniaConvoCommunityScript Extends Quest
{ Shared script for the Cydonia Community Center Conversation quests }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property MeetingDuration Auto Const mandatory
Int Property StageToCheckGetDone Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.StartTimerGameTime(MeetingDuration, 0)
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If !Self.GetStageDone(StageToCheckGetDone)
    Self.Stop()
  EndIf
EndEvent
