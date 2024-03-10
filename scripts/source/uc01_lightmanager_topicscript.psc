ScriptName UC01_LightManager_TopicScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property StarterLight Auto Const mandatory
{ Ref alias for the light that kicks off this show. }
Bool Property TriggerLightOnBegin = True Auto Const
{ Do we trigger our light show when this topic begins or ends? }
Bool Property ShutoffAllLights = False Auto Const
{ If true, when this line completes, tell all the lights here to can it }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If TriggerLightOnBegin
    (StarterLight.GetRef() as uc01_lighttimingrefscript).TriggerLightUpdate(False)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If ShutoffAllLights
    (StarterLight.GetRef() as uc01_lighttimingrefscript).StartLightTimer(True)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
