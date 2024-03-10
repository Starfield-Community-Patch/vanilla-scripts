ScriptName ENV_Tutorial_EffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_env_tutorialquestscript Property SQ_ENV_Tutorial Auto Const mandatory
EndGroup

Keyword Property TutorialEffectKeyword Auto Const mandatory
{ ***IMPORTANT!!!***
This keyword must ALSO be in the effect's keyword list!
***

filter for: ENV_TutorialEffect_* }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  SQ_ENV_Tutorial.ShowEffectScriptHelpMessage(TutorialEffectKeyword)
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
