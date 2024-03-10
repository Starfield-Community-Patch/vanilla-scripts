ScriptName BELandingQuestScript Extends Quest
{ Script for BELandingQuest. }

;-- Variables ---------------------------------------
Int CONST_EncounterMode_Dropship = 1 Const
Int CONST_Timer_RecheckLandingTimerDelay = 180 Const
Int CONST_Timer_RecheckLandingTimerID = 1 Const
spaceshipreference shipRef

;-- Properties --------------------------------------
Group Properties
  ReferenceAlias Property Ship Auto Const mandatory
  ActorValue Property SpaceshipCrew Auto Const mandatory
  ActorValue Property SpaceshipLandedValue Auto Const mandatory
  Keyword Property BEDropship Auto Const mandatory
  Keyword Property BEEncounterTypeSurface Auto Const mandatory
  Keyword Property BESurfaceCrewSize_NoCrew Auto Const mandatory
  Keyword Property BESurfaceCrewSize_25Percent Auto Const mandatory
  Keyword Property BESurfaceCrewSize_50Percent Auto Const mandatory
  Keyword Property BESurfaceCrewSize_75Percent Auto Const mandatory
  Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  shipRef = Ship.GetShipRef()
  Self.RegisterForRemoteEvent(shipRef as ScriptObject, "OnShipLanding")
  If shipRef.IsLanded()
    Self.StartSurfaceEncounter()
  Else
    shipRef.AddKeyword(SpaceshipPreventRampOpenOnLanding)
  EndIf
EndEvent

Event SpaceshipReference.OnShipLanding(spaceshipreference akSource, Bool abComplete)
  Self.StartSurfaceEncounter()
EndEvent

Function StartSurfaceEncounter()
  Self.CancelTimer(CONST_Timer_RecheckLandingTimerID)
  Int shipCrewPercent = 0
  If shipRef.HasKeyword(BESurfaceCrewSize_NoCrew)
    shipCrewPercent = 0
  ElseIf shipRef.HasKeyword(BESurfaceCrewSize_25Percent)
    shipCrewPercent = 25
  ElseIf shipRef.HasKeyword(BESurfaceCrewSize_50Percent)
    shipCrewPercent = 50
  ElseIf shipRef.HasKeyword(BESurfaceCrewSize_75Percent)
    shipCrewPercent = 75
  Else
    shipCrewPercent = 100
  EndIf
  Int encounterMode = 0
  If shipRef.HasKeyword(BEDropship)
    encounterMode = CONST_EncounterMode_Dropship
  EndIf
  BEEncounterTypeSurface.SendStoryEvent(shipRef.GetCurrentLocation(), None, shipRef as ObjectReference, shipCrewPercent, encounterMode)
  Self.Stop()
EndFunction

Function PATCH_RecheckLanding()
  If Self.IsRunning()
    If Ship.GetRef() == None
      Self.Stop()
    ElseIf Ship.GetShipRef().IsLanded()
      Self.StartSurfaceEncounter()
    Else
      Self.StartTimer(CONST_Timer_RecheckLandingTimerDelay as Float, CONST_Timer_RecheckLandingTimerID)
    EndIf
  EndIf
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_Timer_RecheckLandingTimerID
    Self.StartSurfaceEncounter()
  EndIf
EndEvent
