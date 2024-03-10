ScriptName DebugStopAllScenesQuestScript Extends Quest Const default
{ Stops all current scenes for specified aliases }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias[] Property Aliases Auto Const mandatory

;-- Functions ---------------------------------------

Function StopAllScenes()
  Int I = 0
  While I < Aliases.Length
    ObjectReference refToStopSceneFor = Aliases[I].GetReference()
    If refToStopSceneFor
      Scene sceneToStop = refToStopSceneFor.GetCurrentScene()
      If sceneToStop
        sceneToStop.Stop()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction
