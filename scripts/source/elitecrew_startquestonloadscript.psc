ScriptName EliteCrew_StartQuestonLoadScript Extends Actor
{ Script to start Elite Crew quests on load }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property ECQuest Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.goToState("Done")
    ECQuest.Start()
  EndEvent
EndState
