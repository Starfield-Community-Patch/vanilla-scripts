ScriptName UC01_RockAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bSimStarted

;-- Properties --------------------------------------
Int Property ExitStageToSet = 1000 Auto Const
{ Stage to set if the player has chosen to bail }
Message Property UC01_ShipSim_LeaveSequence Auto Const mandatory
{ Message to display to allow the player to leave the sequence if they haven't passed the exam }
Message Property UC01_ShipSim_LeaveSequence_Success Auto Const mandatory
{ Message to display to allow the player to leave the sequence if they HAVE passed }
Message Property UC01_ShipSim_LeaveSequence_Complete Auto Const mandatory
{ Message to display if the player has completed all enemy tiers }
GlobalVariable Property UC01_ShipSim_MinKillsRequired Auto Const mandatory
{ Min number of kills required to pass this exam }
GlobalVariable Property UC01_ShipSim_PlayerKillCount Auto Const mandatory
{ How many kills the player got on this playerthrough }
GlobalVariable Property UC01_ShipSim_TotalEnemyCount Auto Const mandatory
{ Variable used to keep track of the total number of possible enemy ships }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Message MessageToShow = None
  Float fKillCount = UC01_ShipSim_PlayerKillCount.GetValue()
  Float fTotalEnemies = UC01_ShipSim_TotalEnemyCount.GetValue()
  If fKillCount >= fTotalEnemies
    MessageToShow = UC01_ShipSim_LeaveSequence_Complete
  ElseIf fKillCount >= UC01_ShipSim_MinKillsRequired.GetValue()
    MessageToShow = UC01_ShipSim_LeaveSequence_Success
  Else
    MessageToShow = UC01_ShipSim_LeaveSequence
  EndIf
  If bSimStarted
    Int iButtonResponse = MessageToShow.Show(fKillCount, fTotalEnemies, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If iButtonResponse == 1
      Self.TriggerSimShutdown()
    EndIf
  Else
    Self.TriggerSimShutdown()
  EndIf
EndEvent

Function StartSequence()
  bSimStarted = True
EndFunction

Function TriggerSimShutdown()
  bSimStarted = False
  uc01_shipsimulationquestscript myInst = Self.GetOwningQuest() as uc01_shipsimulationquestscript
  myInst.ShutdownSimulation()
  myInst.SetStage(ExitStageToSet)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
