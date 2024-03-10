ScriptName CompanionDebugScript Extends Actor
{ holds various functions for ease of debugging that you can call directly on the actor from the console }

;-- Structs -----------------------------------------
Struct QuestStageDatum
  Quest QuestToSet
  Int StageToSet
EndStruct


;-- Variables ---------------------------------------
companionactorscript CompanionRef

;-- Properties --------------------------------------
ActorValue Property COM_DEBUG_OnPlayerShip Auto Const mandatory
{ autofill }
companiondebugscript:queststagedatum[] Property QuestStageData Auto Const
{ set quest stages when Calling DebugMakeActiveCompanion to prepare them for being testable as companions }
sq_companions_activecompanionscript Property ActiveCompanion Auto Const mandatory
{ pointer to ActiveCompanion alias in SQ_Companions }

;-- Functions ---------------------------------------

Function DebugIsPlayerLoitering()
  ; Empty function
EndFunction

Function DebugTestConditionForm(conditionform ConditionFormToTest)
  ; Empty function
EndFunction

Event OnInit()
  CompanionRef = (Self as Actor) as companionactorscript
EndEvent

Function DebugMakeAvailableCompanion()
  CompanionRef.SQ_Companions.SetRoleAvailable(Self as Actor, True)
  CompanionRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugMakeActiveCompanion()
  If QuestStageData.Length > 0
    Int I = 0
    While I < QuestStageData.Length
      companiondebugscript:queststagedatum currentDatum = QuestStageData[I]
      currentDatum.QuestToSet.SetStage(currentDatum.StageToSet)
      I += 1
    EndWhile
  EndIf
  CompanionRef.RemoveKeyword(CompanionRef.COM_PreventStoryGateScenes)
  CompanionRef.SQ_Companions.SetRoleActive(Self as Actor, True, True, 0.0, 0.0)
  CompanionRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugMakeInactiveCompanion()
  CompanionRef.SQ_Companions.SetRoleInactive(Self as Actor, True, False, True)
EndFunction

Function DebugSetAffinityLevel(GlobalVariable AffinityLevel)
  CompanionRef.SQ_Companions.SetAffinityLevel(Self as Actor, AffinityLevel)
EndFunction

Function DebugModAffinity(Float Amount)
  CompanionRef.SQ_Companions.DebugModAffinity(Self as Actor, Amount)
EndFunction

Function DebugSetStoryGateTimerComplete()
  CompanionRef.COM_CompanionQuest.DebugSetStoryGateTimerComplete()
EndFunction

Function DebugSetAngerLevel(GlobalVariable AngerLevel, GlobalVariable AngerReason)
  CompanionRef.COM_CompanionQuest.SetAngerLevel(AngerLevel, AngerReason)
EndFunction

Function DebugExpireAngerCoolDownTimer()
  CompanionRef.COM_CompanionQuest.ExpireAngerCoolDownTimer()
EndFunction

Function DebugAwardSecondChance()
  CompanionRef.COM_CompanionQuest.AwardSecondChance()
EndFunction

Function DebugMakeRomantic()
  ActorValue COM_AffinityLevel = CompanionRef.SQ_Companions.COM_AffinityLevel
  GlobalVariable COM_AffinityLevel_2_Affection = CompanionRef.SQ_Companions.COM_AffinityLevel_2_Affection
  If CompanionRef.GetValue(COM_AffinityLevel) < COM_AffinityLevel_2_Affection.GetValue()
    CompanionRef.COM_CompanionQuest.SetAffinityLevel(COM_AffinityLevel_2_Affection)
  EndIf
  CompanionRef.COM_CompanionQuest.MakeRomantic()
EndFunction

Function DebugSetOnPlayerShip()
  CompanionRef.SetValue(COM_DEBUG_OnPlayerShip, 1.0)
EndFunction

Function DebugExpireFlirtCooldown()
  CompanionRef.SetValue(CompanionRef.COM_CompanionQuest.COM_FlirtCooldownExpiry, 0.0)
EndFunction

Function DebugExpireTravelAffinityCoolDown()
  ActiveCompanion.StartTimer_AffinityTravelCoolDown(True)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
