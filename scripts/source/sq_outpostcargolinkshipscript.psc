ScriptName SQ_OutpostCargoLinkShipScript Extends SpaceshipReference

;-- Variables ---------------------------------------
Float WaitForFuelGameHours
Float WaitToLoadCargoGameHours
Float WaitToTakeoffGameHours
Float fCalendarTimeScaleGround
Bool timersInitialized

;-- Properties --------------------------------------
sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
Keyword Property LinkOutpostCargoShipLandingMarker01 Auto Const mandatory
Keyword Property LinkOutpostCargoShipLandingMarker02 Auto Const mandatory
Keyword Property LinkOutpostCargoShipLandingMarkerCurrent Auto Const mandatory
Keyword Property LandingMarkerKeyword Auto Const mandatory
{ used to find landing marker }
Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
{ used to find landing zone trigger }
ActorValue Property OutpostCargoLinkShipDestination Auto Const mandatory
{ use to condition packages }
Bool Property RequiresFuel = False Auto hidden
{ if false, ignore CanProduce checks
    set by script when created }
String Property fCalendarTimeScaleGroundString = "fCalendarTimeScaleGround" Auto Const
{ gamesetting for time scale multiplier on real time for game time: game time = real time * fCalendarTimeScaleGround }
Int Property WaitToLoadCargoTimerID = 0 Auto Const
Float Property WaitToLoadCargoSeconds = 30.0 Auto Const
{ 0.04 game hours = 30 seconds of real time }
Int Property WaitToTakeoffTimerID = 1 Auto Const
Float Property WaitToTakeoffSeconds = 15.0 Auto Const
{ 0.02 game hours = 15 seconds of real time }
Int Property WaitForFuelTimerID = 2 Auto Const
Float Property WaitForFuelSeconds = 30.0 Auto Const
{ 0.04 game hours = 30 seconds of real time }

;-- Functions ---------------------------------------

Event OnInit()
  Self.InitializeTimers()
EndEvent

Function InitializeTimers()
  If timersInitialized == False
    timersInitialized = True
    fCalendarTimeScaleGround = Game.GetGameSettingFloat(fCalendarTimeScaleGroundString)
    Float secondsToHours = 3600.0
    WaitToLoadCargoGameHours = WaitToLoadCargoSeconds / secondsToHours * fCalendarTimeScaleGround
    WaitToTakeoffGameHours = WaitToTakeoffSeconds / secondsToHours * fCalendarTimeScaleGround
    WaitForFuelGameHours = WaitForFuelSeconds / secondsToHours * fCalendarTimeScaleGround
  EndIf
EndFunction

Function CancelTimers()
  Self.CancelTimerGameTime(WaitToLoadCargoTimerID)
  Self.CancelTimerGameTime(WaitForFuelTimerID)
  Self.CancelTimerGameTime(WaitToTakeoffTimerID)
EndFunction

Function ArriveAtOutpost()
  Bool canproduce = Self.TransferCargo(True)
  If canproduce || RequiresFuel == False
    Float gameTimeHours = WaitToLoadCargoGameHours
    Self.StartTimerGameTime(gameTimeHours, WaitToLoadCargoTimerID)
  Else
    Float gametimehours = WaitForFuelGameHours
    Self.StartTimerGameTime(gametimehours, WaitForFuelTimerID)
  EndIf
EndFunction

Function LeaveOutpost()
  ObjectReference landingMarker01Ref = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker01)
  ObjectReference landingMarker02Ref = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker02)
  ObjectReference landingMarkerCurrent = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent)
  Bool bAtOutpost01 = False
  If landingMarkerCurrent == landingMarker01Ref
    bAtOutpost01 = True
    Self.SetLinkedRef(landingMarker02Ref, LinkOutpostCargoShipLandingMarkerCurrent, True)
    Self.SetValue(OutpostCargoLinkShipDestination, 1.0)
  Else
    bAtOutpost01 = False
    Self.SetLinkedRef(landingMarker01Ref, LinkOutpostCargoShipLandingMarkerCurrent, True)
    Self.SetValue(OutpostCargoLinkShipDestination, 0.0)
  EndIf
  Self.EvaluatePackage(False)
  SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum02_landing)
EndFunction

Bool Function TransferCargo(Bool bUnloadCargo)
  Bool bAtOutpost01 = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker01)
  Bool canproduce = SQ_OutpostCargoLink.TransferCargo(Self, bAtOutpost01, bUnloadCargo)
  Return canproduce
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.InitializeTimers()
  If Self.IsDisabled()
    Return 
  EndIf
  If aiTimerID == WaitToLoadCargoTimerID
    Self.TransferCargo(False)
    Float gameTimeHours = WaitToTakeoffGameHours
    Self.StartTimerGameTime(gameTimeHours, WaitToTakeoffTimerID)
  ElseIf aiTimerID == WaitToTakeoffTimerID
    Self.LeaveOutpost()
  ElseIf aiTimerID == WaitForFuelTimerID
    Self.ArriveAtOutpost()
  EndIf
EndEvent

Event OnShipLanding(Bool abComplete)
  Bool bAtOutpost01 = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker01)
  If abComplete == False
    ObjectReference landingMarker = Self.GetLinkedRef(LandingMarkerKeyword)
    If landingMarker
      landingzonetriggerscript landingZoneTrigger = landingMarker.GetLinkedRef(LandingZoneTriggerKeyword) as landingzonetriggerscript
      If landingZoneTrigger
        landingZoneTrigger.BeginLanding(Self as SpaceshipReference, landingMarker)
      EndIf
    EndIf
    SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum02_landing)
  Else
    SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum03_landed)
  EndIf
EndEvent

Event OnShipTakeOff(Bool abComplete)
  If abComplete
    Bool bAtOutpost01 = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker02)
    SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum01_linked)
  EndIf
EndEvent
