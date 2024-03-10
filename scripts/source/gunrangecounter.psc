ScriptName GunRangeCounter Extends ObjectReference
{ Receives info from GunRangeTarget }

;-- Variables ---------------------------------------
Int CurrentScore
Int competitionTimerID = 1 Const
Float fStartTime

;-- Properties --------------------------------------
Group Required_Properties
  Int Property ScoreLimit = -1 Auto Const
  { Score to reach }
  Float Property TimeLimit = 10.0 Auto Const
  { Time limit in seconds }
EndGroup

Group Optional_Properties
  Quest Property QuestToSet Auto Const
  { Quest containing the Stage to set }
  Int Property StageToActivateButton = -1 Auto Const
  { Stage to Set }
  Int Property StageToStartCompetition = -1 Auto Const
  { Stage to Set }
  Int Property StageToSetSuccess = -1 Auto Const
  { Stage to Set }
  Int Property StageToSetFail = -1 Auto Const
  { Stage to Set }
  ObjectReference Property ScoreText Auto
  { Debug text to show score }
  ObjectReference Property TimerText Auto
  { Debug text to show timer }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If QuestToSet.GetCurrentStageID() == StageToActivateButton
    QuestToSet.SetStage(StageToStartCompetition)
    CurrentScore = 0
    Self.GoToState("AllowCounting")
  EndIf
EndEvent

Function GunRangeCompetition(Int ScorePerHit)
  ; Empty function
EndFunction

;-- State -------------------------------------------
State AllowCounting

  Function GunRangeCompetition(Int ScorePerHit)
    CurrentScore += ScorePerHit
  EndFunction

  Event OnTimer(Int aiTimerID)
    If aiTimerID == competitionTimerID
      Int timeDisplay = (TimeLimit - Utility.GetCurrentRealTime() - fStartTime) as Int
      timeDisplay = Math.Ceiling(timeDisplay as Float)
      If Utility.GetCurrentRealTime() - fStartTime > TimeLimit
        If CurrentScore < ScoreLimit
          If QuestToSet != None
            QuestToSet.SetStage(StageToSetFail)
          EndIf
        ElseIf QuestToSet != None
          QuestToSet.SetStage(StageToSetSuccess)
        EndIf
        Self.GoToState("StopCounting")
      Else
        Self.StartTimer(0.5, competitionTimerID)
      EndIf
    EndIf
  EndEvent

  Event OnBeginState(String asOldState)
    fStartTime = Utility.GetCurrentRealTime()
    Self.StartTimer(0.5, competitionTimerID)
  EndEvent
EndState

;-- State -------------------------------------------
State StopCounting
EndState
