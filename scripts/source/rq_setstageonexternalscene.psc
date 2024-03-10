ScriptName RQ_SetStageOnExternalScene Extends Quest
{ typically for audio log scenes }

;-- Structs -----------------------------------------
Struct SceneStageDatum
  Scene ExternalScene
  Int StageToSetOnEnd
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
rq_setstageonexternalscene:scenestagedatum[] Property SceneStageData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int I = 0
  While I < SceneStageData.Length
    Scene currentScene = SceneStageData[I].ExternalScene
    Self.RegisterForRemoteEvent(currentScene as ScriptObject, "OnEnd")
    I += 1
  EndWhile
EndEvent

Event Scene.OnEnd(Scene akSender)
  Int iFound = SceneStageData.findstruct("ExternalScene", akSender, 0)
  rq_setstageonexternalscene:scenestagedatum foundSceneStageDatum = None
  If iFound > -1
    foundSceneStageDatum = SceneStageData[iFound]
    Self.SetStage(foundSceneStageDatum.StageToSetOnEnd)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
