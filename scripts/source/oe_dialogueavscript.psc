ScriptName OE_DialogueAVScript Extends Quest
{ script to handle setting actorvalues that will be used as conditions for dialogue }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property OE_Civilians_DIAL_CanIHelp Auto Const mandatory
  ActorValue Property OE_Civilians_DIAL_WhatsGoingOn Auto Const mandatory
  ActorValue Property OE_Civilians_DIAL_HowsLife Auto Const mandatory
  ActorValue Property OE_Civilians_DIAL_Topic04 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SetCanIHelp(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_CanIHelp, InfoNumber as Float)
EndFunction

Function SetWhatsGoingOn(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_WhatsGoingOn, InfoNumber as Float)
EndFunction

Function SetHowsLife(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_HowsLife, InfoNumber as Float)
EndFunction

Function SetTopic04(ObjectReference SpeakerRef, Int InfoNumber)
  SpeakerRef.SetValue(OE_Civilians_DIAL_Topic04, InfoNumber as Float)
EndFunction

Function ShowMissionTerminalObjective(ObjectReference SpeakerRef)
  ((Self as Quest) as oe_missionterminalquestscript).PlayerToldAboutMissionTerminal(SpeakerRef)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
