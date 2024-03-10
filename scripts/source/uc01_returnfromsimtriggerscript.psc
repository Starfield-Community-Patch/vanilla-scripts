ScriptName UC01_ReturnFromSimTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_ShipSim_PlayerEverPassedSequence Auto Const mandatory
{ Only set the stage if the player enters the trigger after this global has been set to 1 }
Int Property StageToSet = 600 Auto Const
{ Stage to set if the player has ever completed the ship sim sequence }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && UC01_ShipSim_PlayerEverPassedSequence.GetValue() >= 1.0
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
