ScriptName OutpostBeaconScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Bool bShowNormalTrace = True Const
Float fAttackTimerMaxSeconds = 48.0 Const
Float fAttackTimerMinSeconds = 12.0 Const
Int iCheckForAttackTimerID = 1 Const

;-- Properties --------------------------------------
Group outpostAttacks
  sq_parentscript Property SQ_Parent Auto Const mandatory
  { holds outpost attack data/functions }
  Bool Property AllowAttacks = True Auto conditional Const
  { set to FALSE to prevent ALL random attacks }
EndGroup

sq_crewscript Property SQ_Crew Auto Const mandatory
{ to handle crew assign/dismiss events }
outposttutorialscript Property OutpostTutorial Auto Const mandatory
{ handle outpost tutorial events }
companionaffinityeventsscript Property SQ_Companions Auto Const mandatory
{ to handle companions responding to things the player builds }
ActorValue Property OutpostSurveyBoost Auto Const mandatory
{ actor value to flag when an outpost has reported a planet survey boost }
Message Property OutpostSurveyBoostMessage Auto Const mandatory
{ message first time player returns to outpost after fully surveying planet }
Keyword Property LocTypeOutpost Auto Const mandatory
{ make sure outpost locations have this keyword }

;-- Functions ---------------------------------------

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  SQ_Crew.HandleOnCrewAssigned(akCrew, Self as ObjectReference)
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  SQ_Crew.HandleOnCrewDismissed(akCrew, Self as ObjectReference)
EndEvent

Event OnUnload()
  SQ_Crew.HandleCrewGoingHomeUnloaded(SQ_Crew.CrewGoingToOutposts)
EndEvent

Event OnLoad()
  Self.GetCurrentLocation().AddKeyword(LocTypeOutpost)
  SQ_Crew.HandleCrewGoingHomeUnloaded(SQ_Crew.CrewGoingToOutposts)
  If Self.GetValue(OutpostSurveyBoost) == 0.0 && Self.GetCurrentPlanet().GetSurveyPercent() >= 1.0
    Self.SetValue(OutpostSurveyBoost, 1.0)
    OutpostSurveyBoostMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
  Self.StartAttackTimer()
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  SQ_Companions.OutpostObjectPlaced(akReference)
  resource[] resources = akReference.GetValueResources()
  If resources
    Self.StartAttackTimer()
  EndIf
EndEvent

Event OnWorkshopMode(Bool aStart)
  If aStart && OutpostTutorial.IsRunning()
    OutpostTutorial.EnterWorkshopMenu(Self as ObjectReference)
  EndIf
EndEvent

Function StartAttackTimer()
  Float checkForAttackTime = Utility.RandomFloat(fAttackTimerMinSeconds, fAttackTimerMaxSeconds)
  Self.StartTimer(checkForAttackTime, iCheckForAttackTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCheckForAttackTimerID
    SQ_Parent.CheckForAttack(Self, False, 0, 0.0)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
