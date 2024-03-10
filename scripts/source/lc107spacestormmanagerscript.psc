ScriptName LC107SpaceStormManagerScript Extends ObjectReference
{ Script for the LC107 Space Storm Manager object. }

;-- Variables ---------------------------------------
Float CONST_AmbientShakeDurationMax = 0.5 Const
Float CONST_AmbientShakeDurationMin = 0.200000003 Const
Float CONST_AmbientShakeStrengthMax = 0.050000001 Const
Float CONST_AmbientShakeStrengthMin = 0.01 Const
Float CONST_AmbientShakeTimerDelayMax = 5.0 Const
Float CONST_AmbientShakeTimerDelayMin = 3.0 Const
Int CONST_AmbientShakeTimerID = 1 Const
Int CONST_FarTravelStateDeparture = 0 Const
Int CONST_GravJumpStateAnimStarted = 1 Const
Bool spaceStormIsActive

;-- Properties --------------------------------------
Group RequiredProperties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
EndGroup

Group AutofillProperties
  VisualEffect Property Space_HazardLightning_BG_00 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnCellAttach()
  Self.StartSpaceStormVFX()
EndEvent

Event OnCellDetach()
  Self.StopSpaceStormVFX()
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSource, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  Self.StopSpaceStormVFX()
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSource, Location aDestination, Int aState)
  If aState == CONST_GravJumpStateAnimStarted
    Self.StopSpaceStormVFX()
  EndIf
EndEvent

Function StartSpaceStormVFX()
  spaceStormIsActive = True
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump")
  Space_HazardLightning_BG_00.Play(PlayerShip.GetShipRef() as ObjectReference, -1.0, None)
  Self.StartTimer(Utility.RandomFloat(CONST_AmbientShakeTimerDelayMin, CONST_AmbientShakeTimerDelayMax), CONST_AmbientShakeTimerID)
EndFunction

Function StopSpaceStormVFX()
  spaceStormIsActive = False
  Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel")
  Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump")
  Space_HazardLightning_BG_00.Stop(PlayerShip.GetShipRef() as ObjectReference)
EndFunction

Event OnTimer(Int timerID)
  If spaceStormIsActive
    Self.PlayAmbientShake()
    Self.StartTimer(Utility.RandomFloat(CONST_AmbientShakeTimerDelayMin, CONST_AmbientShakeTimerDelayMax), CONST_AmbientShakeTimerID)
  EndIf
EndEvent

Function PlayAmbientShake()
  Float shakeStrength = Utility.RandomFloat(CONST_AmbientShakeStrengthMin, CONST_AmbientShakeStrengthMax)
  Float shakeDuration = Utility.RandomFloat(CONST_AmbientShakeDurationMin, CONST_AmbientShakeDurationMax)
  Game.ShakeCamera(None, shakeStrength, shakeDuration)
EndFunction
