ScriptName MissionQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MissionStateChangeGuard

;-- Properties --------------------------------------
Group MissionBoardAliases
  LocationAlias Property TargetSystemLocation Auto Const
  LocationAlias Property TargetPlanetLocation Auto Const
  LocationAlias Property TargetLocation Auto Const
  ReferenceAlias Property PrimaryRef Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
EndGroup

missionparentscript Property MissionParent Auto Const mandatory
{ mission parent quest }
Int Property AcceptStage = 10 Auto Const
{ The stage to set when mission is accepted }
Int Property ReadyStage = 5 Auto Const
{ the stage to set when the mission is ready to display on the mission board UI }
Int Property CompleteStage = 100 Auto Const
{ The stage to set when mission is completed }
Int Property FailStage = 200 Auto Const
{ The stage to set when mission has failed (e.g. time expired) }
Bool Property ShutdownOnFailure = True Auto Const
{ should the mission shutdown if it fails? (usually it won't - each mission type handles this differently) }
Bool Property ShutdownOnCompletion = True Auto Const
{ should the mission shutdown on completion? (usually it will) }
Int Property MissionType = 0 Auto Const
{ 0 = Bounty
 1 = Cargo
 2 = Passenger
 3 = Survey Planet (Constellation)
 4 = Survey Trait (Constellation)
 5 = Supply
 6 = Smuggle
 7 = Piracy
 8 = Steal
 9 = Bounty in Space
 10 = Freestar Bounty (Smuggler)
 11 = Freestar Bounty in Space (Pirate)
 12 = Freestar Bounty (Outlaw)
 13 = Freestar Rescue
 14 = Ryujin Hack 
 15 = Ryujin Plant Evidence
 16 = Ryujin Sabotage
 17 = Survey Planet for Life (LIST)
 18 = Hunt creatures }
GlobalVariable Property RewardAmountGlobal Auto Const mandatory
{ The base amount of Credits we're going to reward the player with }
GlobalVariable Property RewardAmountGlobalActual Auto Const mandatory
{ The actual amount of Credits we're going to reward the player with - possibly adjusted by specific mission factors }
GlobalVariable Property MissionIntValue01 Auto Const
{ OPTIONAL - for mission types with integer values
	NOTE: need to make custom Globals for each quest }
GlobalVariable Property MissionIntValue02 Auto Const
{ OPTIONAL - for mission types with integer values
	NOTE: need to make custom Globals for each quest }
GlobalVariable Property MissionTimeHours Auto Const
{ base mission quest timer 
	0 = unlimited time }
GlobalVariable Property MissionTimeHoursActual Auto Const
{ modified base mission quest timer - time for this mission based on mission data }
GlobalVariable Property MissionTimeRemainingDays Auto Const
{ only used if MissionTimeHoursActual is filled in - how long does player have in full days }
GlobalVariable Property MissionTimeRemainingHours Auto Const
{ only used if MissionTimeHoursActual is filled in - the "remainder" of MissionTimeHoursActual after MissionTimeRemainingDays is taken out }
LocationAlias Property PlayerStarSystemLocation Auto Const mandatory
{ The Star System the player is currently in when he sees the bounty }
ActorValue Property MissionBoardAvailableAV Auto Const
{ optional - if supplied, will be incremented +1 when a quest is available at a location; -1 when quest shuts down or is accepted }
Location Property MissionSourceLocation Auto hidden
{ location supplied by the script event, if any }
Bool Property PlayerAcceptedQuest Auto conditional
Bool Property PlayerCompletedQuest Auto conditional
Bool Property PlayerFailedQuest Auto conditional

;-- Functions ---------------------------------------

Function HandlePlayerHomeShipChange()
  ; Empty function
EndFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
  ; Empty function
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  ; Empty function
EndFunction

Function HandlePlayerShipLanding()
  ; Empty function
EndFunction

Function HandlePlayerShipTakeOff()
  ; Empty function
EndFunction

Function HandlePlayerShipUndocking()
  ; Empty function
EndFunction

Function TestGetQuestTimeRemaining()
  ; Empty function
EndFunction

Event OnQuestStarted()
  Actor PlayerREF = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipLanding")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipTakeOff")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipDock")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock")
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnHomeShipSet")
  RewardAmountGlobalActual.SetValue(Self.GetActualReward() as Float)
  Self.UpdateCurrentInstanceGlobal(RewardAmountGlobalActual)
  If RewardAmountGlobalActual.GetValue() == 0.0
    
  EndIf
  Self.SetActualMissionTime()
  Self.SetMissionTimeVariables()
  Self.SetStage(ReadyStage)
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  MissionSourceLocation = akLocation
  If MissionSourceLocation as Bool && MissionBoardAvailableAV as Bool
    MissionSourceLocation.ModValue(MissionBoardAvailableAV, 1.0)
  EndIf
EndEvent

Event OnQuestRejected()
  Self.HandleOnQuestRejected()
EndEvent

Function HandleOnQuestRejected()
  Self.MissionFailed()
EndFunction

Event OnMissionAccepted()
  Self.HandleOnMissionAccepted()
EndEvent

Function HandleOnMissionAccepted()
  If MissionParent.MissionBoardAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
    Self.MissionAccepted(True)
  Else
    Self.MissionAccepted(False)
  EndIf
EndFunction

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    PlayerAcceptedQuest = True
    If MissionBoardAvailableAV as Bool && MissionSourceLocation as Bool
      MissionSourceLocation.ModValue(MissionBoardAvailableAV, -1.0)
    EndIf
    Self.SetStage(AcceptStage)
    MissionParent.SendMissionAcceptedEvent(Self)
    wwiseevent.PlayMenuSound("UITerminalMissionBoardMissionAcceptYes")
  Else
    wwiseevent.PlayMenuSound("UITerminalMissionBoardMissionAcceptNo")
  EndIf
EndFunction

Function MissionComplete()
  Guard MissionStateChangeGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If PlayerAcceptedQuest && PlayerFailedQuest == False && PlayerCompletedQuest == False
      Actor PlayerREF = Game.GetPlayer()
      PlayerCompletedQuest = True
      MissionParent.HandleMissionCompleted(Self)
      If Utility.IsGameMenuPaused() == False
        Utility.Wait(1.0)
      EndIf
      Self.CompleteAllObjectives()
      Self.StopQuestTimer()
      Self.SetStage(CompleteStage)
    EndIf
    If ShutdownOnCompletion
      Self.MissionShutdown()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MissionFailed()
  Guard MissionStateChangeGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If PlayerAcceptedQuest && PlayerCompletedQuest == False
      PlayerFailedQuest = True
      MissionParent.HandleMissionFailed(Self)
      Self.FailAllObjectives()
      Self.SetStage(FailStage)
      Self.StopQuestTimer()
      If ShutdownOnFailure
        Self.MissionShutdown()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Int Function GetActualReward()
  ObjectReference targetRef = PrimaryRef.GetRef()
  Float reward = RewardAmountGlobal.GetValue()
  Float mult = 1.0
  If targetRef
    mult += targetRef.GetValue(MissionParent.MissionRewardMultiplier)
    If mult <= 0.0
      mult = 1.0
    EndIf
  EndIf
  reward *= mult
  Return reward as Int
EndFunction

Function SetActualMissionTime()
  If MissionTimeHours as Bool && MissionTimeHoursActual as Bool
    MissionTimeHoursActual.SetValue(MissionTimeHours.GetValue())
  EndIf
EndFunction

Function SetMissionTimeVariables()
  If ((MissionTimeHoursActual as Bool && MissionTimeHoursActual.GetValue() > 0.0) && MissionTimeRemainingDays as Bool) && MissionTimeRemainingHours as Bool
    Float missionHours = MissionTimeHoursActual.GetValue()
    Int missionDays = Math.Floor(missionHours / 24.0)
    Float missionHoursRemainder = missionHours - (missionDays as Float * 24.0)
    MissionTimeRemainingDays.SetValue(missionDays as Float)
    MissionTimeRemainingHours.SetValue(missionHoursRemainder)
    Self.UpdateCurrentInstanceGlobal(MissionTimeRemainingDays)
    Self.UpdateCurrentInstanceGlobal(MissionTimeRemainingHours)
  EndIf
EndFunction

Function MissionShutdown()
  If PlayerAcceptedQuest == False
    If MissionBoardAvailableAV as Bool && MissionSourceLocation as Bool
      MissionSourceLocation.ModValue(MissionBoardAvailableAV, -1.0)
    EndIf
  EndIf
  Self.Stop()
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Self.HandlePlayerLocationChange(akOldLoc, akNewLoc)
EndEvent

Event Actor.OnHomeShipSet(Actor akSender, spaceshipreference akShip, spaceshipreference akPrevious)
  Self.HandlePlayerHomeShipChange()
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, Bool abComplete)
  If akSender == PlayerShip && abComplete == True
    Self.HandlePlayerShipLanding()
  EndIf
EndEvent

Event ReferenceAlias.OnShipTakeOff(ReferenceAlias akSender, Bool abComplete)
  If akSender == PlayerShip && abComplete == False
    Self.HandlePlayerShipTakeOff()
  EndIf
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSender, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If akSender == PlayerShip && abComplete == True
    Self.HandlePlayerShipDocking(akParent)
  EndIf
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSender, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If akSender == PlayerShip && abComplete == True
    Self.HandlePlayerShipUndocking()
  EndIf
EndEvent
