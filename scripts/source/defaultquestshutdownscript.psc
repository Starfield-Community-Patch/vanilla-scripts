ScriptName DefaultQuestShutdownScript Extends Quest Const default
{ shuts the quest down when a timer expires }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StartTimerStage = 10 Auto Const
{ quest stage which will start the shutdown timer }
Float Property ShutdownTimerDuration = 1.0 Auto Const
{ time (in game hours) before shutdown }

;-- Functions ---------------------------------------

Event OnStageSet(Int auiStageID, Int auiItemID)
  Self.StartTimerGameTime(ShutdownTimerDuration, 0)
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.Stop()
EndEvent
