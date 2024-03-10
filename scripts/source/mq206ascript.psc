ScriptName MQ206AScript Extends Quest conditional

;-- Variables ---------------------------------------
Int MemorialTalksTotalBarrett = 11
Int MemorialTalksTotalSam = 12
Int MemorialTalksTotalSarah = 11
Int MemorialTalksTotalStandard = 10

;-- Properties --------------------------------------
inputenablelayer Property MQ206AEnableLayer Auto hidden
ReferenceAlias Property CompanionWhoDies Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
Int Property MemorialTalkDoneStage = 500 Auto Const
Int Property MemorialReadyStage = 20 Auto Const
Int Property MemorialPlayerArrivedStage = 35 Auto Const
Int Property MemorialPlayerSkippedStage = 900 Auto Const
Int Property SonaStage = 1000 Auto Const
GlobalVariable Property MQ206AMemorialDays Auto Const mandatory
GlobalVariable Property GameDaysPassed Auto Const mandatory
Float Property MemorialGameDaysPassed Auto
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
GlobalVariable Property COM_SQ01_SonaLeft Auto Const mandatory
Int Property MemorialTalksCount Auto conditional

;-- Functions ---------------------------------------

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 10
    If GameDaysPassed.GetValue() >= MemorialGameDaysPassed
      Self.SetStage(MemorialReadyStage)
    ElseIf Self.ModObjectiveGlobal(-1.0, MQ206AMemorialDays, -1, 0.0, False, True, True, False)
      Self.SetStage(MemorialReadyStage)
    Else
      Self.StartTimerGameTime(24.0, 10)
    EndIf
  ElseIf aiTimerID == 20
    If Self.GetStageDone(MemorialPlayerArrivedStage) == False
      Self.SetStage(MemorialPlayerSkippedStage)
    EndIf
  EndIf
EndEvent

Function CallMemorialTimer()
  Self.StartTimerGameTime(24.0, 20)
EndFunction

Function CancelMemorialTimer()
  Self.CancelTimerGameTime(20)
EndFunction

Function SetMemorialWaitGameDay()
  MemorialGameDaysPassed = GameDaysPassed.GetValue() + 5.0
  Self.StartTimerGameTime(24.0, 10)
EndFunction

Function UpdateGameTimeOnSkip()
  Self.CancelMemorialTimer()
  Float SkipTimeFloat = (MemorialGameDaysPassed - GameDaysPassed.GetValue()) * 24.0
  Int SkipTimeInt = Math.Floor(SkipTimeFloat)
  Game.PassTime(SkipTimeInt)
  Utility.Wait(0.100000001)
  Self.SetStage(19)
EndFunction

Function SetMemorialTalksTotal()
  Actor DeadCompanionREF = CompanionWhoDies.GetActorRef()
  If DeadCompanionREF == SarahMorgan.GetActorRef()
    MemorialTalksCount = MemorialTalksTotalSarah
    If COM_Quest_SarahMorgan_Q01.GetStageDone(SonaStage) && COM_SQ01_SonaLeft.GetValueInt() >= 1
      MemorialTalksCount += 1
    EndIf
  ElseIf DeadCompanionREF == Barrett.GetActorRef()
    MemorialTalksCount = MemorialTalksTotalBarrett
  ElseIf DeadCompanionREF == SamCoe.GetActorRef()
    MemorialTalksCount = MemorialTalksTotalSam
  Else
    MemorialTalksCount = MemorialTalksTotalStandard
  EndIf
EndFunction

Function CheckMemorialTalks()
  MemorialTalksCount -= 1
  If MemorialTalksCount <= 0
    Self.SetStage(MemorialTalkDoneStage)
  EndIf
EndFunction
