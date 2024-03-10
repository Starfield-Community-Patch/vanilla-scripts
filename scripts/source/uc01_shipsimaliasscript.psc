ScriptName UC01_ShipSimAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_ShipSim_PlayerKillCount Auto Const mandatory
{ Player's kill count of enemies }
GlobalVariable Property UC01_ShipSim_MinKillsRequired Auto Const mandatory
{ Mint threshold for progression }
Scene Property UC01_ShipSimulatorHelperQuest_600_PlayerDefeated Auto Const mandatory
{ Scene to play once the player has been defeated }

;-- Functions ---------------------------------------

Event OnEnterBleedout()
  uc01_shipsimulationquestscript myInst = Self.GetOwningQuest() as uc01_shipsimulationquestscript
  myInst.PauseSequence()
  UC01_ShipSimulatorHelperQuest_600_PlayerDefeated.Start()
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
