ScriptName MQ104AScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TemplePuzzleTrigger Auto Const mandatory
Int Property StageToSet = 500 Auto Const

;-- Functions ---------------------------------------

Function TempleArrived()
  Self.RegisterForCustomEvent((TemplePuzzleTrigger.GetRef() as sbringpuzzlenewscript) as ScriptObject, "sbringpuzzlenewscript_PuzzleSolvedEvent")
EndFunction

Event SBRingPuzzleNEWScript.PuzzleSolvedEvent(sbringpuzzlenewscript akSender, Var[] akArgs)
  Self.SetStage(StageToSet)
  Self.UnRegisterForCustomEvent((TemplePuzzleTrigger.GetRef() as sbringpuzzlenewscript) as ScriptObject, "sbringpuzzlenewscript_PuzzleSolvedEvent")
EndEvent
