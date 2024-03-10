ScriptName CompanionActorScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { autofill; this is a pointer to the main companion system quest and script }
  ActorValue Property COM_Affinity Auto Const mandatory
  { Autofill }
  Keyword Property COM_PreventStoryGateScenes Auto Const mandatory
  { Autofill }
EndGroup

Group Properties
  com_companionquestscript Property COM_CompanionQuest Auto Const mandatory
  { Filter for "COM_Companion_*" }
  GlobalVariable Property COM_CompanionID Auto Const mandatory
  { the global "enum" that means this companion. Can be stored in other globals, variables, etc. when needing a numeric ID for this companion }
  Activator Property COM_PQ_TxtReplace_QuestName Auto Const mandatory
  { holds a pointer to an activator with a name the same as the personal quest name, for use in message text replacement.
	
	Filter for:
	COM_PQ_TxtReplace_QuestName* }
EndGroup


;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  SQ_Companions.SetRoleInactive(Self as Actor, True, False, True)
  SQ_Companions.SetRoleUnavailable(Self as Actor, True)
EndEvent

GlobalVariable Function GetCompanionIDGlobal()
  Return COM_CompanionID
EndFunction

Float Function GetCompanionIDValue()
  Return Self.GetCompanionIDGlobal().GetValue()
EndFunction

Int Function GetCompanionIDValueInt()
  Return Self.GetCompanionIDGlobal().GetValue() as Int
EndFunction

Function SetGlobalToCompanionID(GlobalVariable GlobalToSet)
  Float companionIDValue = Self.GetCompanionIDValue()
  GlobalToSet.SetValue(companionIDValue)
EndFunction

Bool Function HasGreaterAffinityThanTestedCompanion(CompanionActorScript TestedCompanion)
  Bool returnVal = False
  If TestedCompanion == None
    returnVal = True
  ElseIf Self.GetValue(SQ_Companions.COM_AffinityLevel) > TestedCompanion.GetValue(SQ_Companions.COM_AffinityLevel)
    returnVal = True
  ElseIf Self.GetValue(SQ_Companions.COM_Affinity) > TestedCompanion.GetValue(SQ_Companions.COM_Affinity)
    returnVal = True
  EndIf
  Return returnVal
EndFunction

Bool Function IsRomantic()
  Return SQ_Companions.IsCompanionRomantic(Self)
EndFunction

Function AddAffinity(Int AmountToAdd)
  Self.AddPassiveAffinity(AmountToAdd as Float)
  COM_CompanionQuest.CheckAndSetWantsToTalk(True)
EndFunction

Function AllowStoryGatesAndRestartTimer()
  Self.RemoveKeyword(COM_PreventStoryGateScenes)
  Self.RestartStoryGateTimer(1)
EndFunction

Function RestartStoryGateTimer(Int nextStoryGate)
  COM_CompanionQuest.StartStoryGateTimer(nextStoryGate)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
