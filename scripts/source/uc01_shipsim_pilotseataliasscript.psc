ScriptName UC01_ShipSim_PilotSeatAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StartupStage = 150 Auto Const
{ Stage to set when the player sits in the sim seat for the 1st time }

;-- Functions ---------------------------------------

Event OnEnterFurniture(Actor akActionRef)
  uc01_shipsimulationquestscript OQ = Self.GetOwningQuest() as uc01_shipsimulationquestscript
  If !OQ.GetStageDone(StartupStage)
    OQ.SetStage(StartupStage)
  ElseIf OQ.bSequencePaused && !OQ.bResetRequired
    OQ.ResumeCombatSequence()
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
