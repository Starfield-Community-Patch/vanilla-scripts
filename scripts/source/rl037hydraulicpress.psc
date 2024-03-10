ScriptName RL037HydraulicPress Extends ObjectReference
{ Script for the Hydraulic Lift used for the Mantis' ship. }

;-- Variables ---------------------------------------
Float CONST_DistanceAlongHelper = 0.449999988 Const

;-- Properties --------------------------------------
ObjectReference Property MovementHelperRef Auto Const mandatory
ObjectReference Property LandingEnableRef Auto Const mandatory
ObjectReference Property CollisionEnableRef Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference
      Self.GotoState("Done")
      ObjectReference soundMarker = Self.GetLinkedRef(LinkCustom01)
      spaceshipreference mantisShipRef = Self.GetLinkedRef(LinkCustom02) as spaceshipreference
      CollisionEnableRef.Enable(False)
      mantisShipRef.Enable(False)
      LandingEnableRef.Enable(False)
      sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript
      SQ_PlayerShip.AddPlayerOwnedShip(mantisShipRef)
      soundMarker.Enable(False)
      MovementHelperRef.SetAnimationVariableFloat("Speed", 0.025)
      MovementHelperRef.SetAnimationVariableFloat("Position", CONST_DistanceAlongHelper)
      MovementHelperRef.PlayAnimationAndWait("Play01", "Done")
      soundMarker.Disable(False)
    EndIf
  EndEvent
EndState
