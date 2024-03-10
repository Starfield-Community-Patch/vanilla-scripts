ScriptName Ri08_QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer MeetingLayer

;-- Properties --------------------------------------
Group VotingGlobals
  GlobalVariable Property RI08_InfinityNayCount Auto Const mandatory
  GlobalVariable Property RI08_InfinityYayCount Auto Const mandatory
  GlobalVariable Property RI08_AcquiredInfinity Auto Const mandatory
  GlobalVariable Property RI08_NeuroampNayCount Auto Const mandatory
  GlobalVariable Property RI08_NeuroampYayCount Auto Const mandatory
  GlobalVariable Property RI08_ContinuedNeuroampResearch Auto Const mandatory
  GlobalVariable Property RI08_MasakoNayCount Auto Const mandatory
  GlobalVariable Property RI08_MasakoYayCount Auto Const mandatory
  GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
EndGroup

Group UlaruVotes
  Int Property iUlaruYESInfinityLTD Auto Const mandatory
  Int Property iUlaruNOInfinityLTD Auto Const mandatory
  Int Property iUlaruYESNeuroamps Auto Const mandatory
  Int Property iUlaruNONeuroamps Auto Const mandatory
  Int Property iUlaruYESMasako Auto Const mandatory
  Int Property iUlaruNOMasako Auto Const mandatory
EndGroup

Int Property iSetStage Auto Const mandatory
GlobalVariable Property RI05_UlaruDead Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
Int Property iUlaruFired Auto Const mandatory
Int Property iMasakoFired Auto Const mandatory

;-- Functions ---------------------------------------

Function FreezeControlsMeeting()
  Game.GetPlayer().StopCombatAlarm()
  MeetingLayer = inputenablelayer.Create()
  MeetingLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
EndFunction

Function UnfreezeControlsMeeting()
  MeetingLayer = None
EndFunction

Function SetTimer()
  Self.StartTimer(10.0, 1)
EndFunction

Event OnTimer(Int aiTimerID)
  Self.SetStage(iSetStage)
EndEvent

Function CalculateVotes()
  If RI08_InfinityYayCount.GetValue() >= RI08_InfinityNayCount.GetValue()
    RI08_AcquiredInfinity.SetValue(1.0)
  Else
    RI08_AcquiredInfinity.SetValue(0.0)
  EndIf
  If RI08_NeuroampYayCount.GetValue() >= RI08_NeuroampNayCount.GetValue()
    RI08_ContinuedNeuroampResearch.SetValue(1.0)
  Else
    RI08_ContinuedNeuroampResearch.SetValue(0.0)
  EndIf
  If RI08_MasakoYayCount.GetValue() >= RI08_MasakoNayCount.GetValue()
    RI08_MasakoRemainedCEO.SetValue(1.0)
    RI_RadiantQuestGiver.SetValue(1.0)
  Else
    RI08_MasakoRemainedCEO.SetValue(0.0)
    RI_RadiantQuestGiver.SetValue(2.0)
  EndIf
EndFunction

Function ModifyVotes()
  If Self.GetStageDone(iUlaruFired)
    If Self.GetStageDone(iUlaruYESInfinityLTD)
      RI08_InfinityYayCount.SetValue(RI08_InfinityYayCount.GetValue() - 1.0)
    Else
      RI08_InfinityNayCount.SetValue(RI08_InfinityNayCount.GetValue() - 1.0)
    EndIf
    If Self.GetStageDone(iUlaruYESNeuroamps)
      RI08_NeuroampYayCount.SetValue(RI08_NeuroampYayCount.GetValue() - 1.0)
    Else
      RI08_NeuroampNayCount.SetValue(RI08_NeuroampNayCount.GetValue() - 1.0)
    EndIf
    If Self.GetStageDone(iUlaruYESMasako)
      RI08_MasakoYayCount.SetValue(RI08_MasakoYayCount.GetValue() - 1.0)
    Else
      RI08_MasakoNayCount.SetValue(RI08_MasakoNayCount.GetValue() - 1.0)
    EndIf
  EndIf
  If Self.GetStageDone(iMasakoFired)
    RI08_InfinityYayCount.SetValue(RI08_InfinityYayCount.GetValue() - 1.0)
    RI08_NeuroampYayCount.SetValue(RI08_NeuroampYayCount.GetValue() - 1.0)
  EndIf
  Self.CalculateVotes()
EndFunction
