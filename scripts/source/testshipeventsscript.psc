ScriptName TestShipEventsScript Extends ReferenceAlias
{ testing new ships events }

;-- Functions ---------------------------------------

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function
EndEvent

Event OnDeath(ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnDying(ObjectReference akKiller)
  ; Empty function
EndEvent

Event OnInit()
  ; Empty function
EndEvent

Event OnShipRefueled(Int aFuelAdded)
  ; Empty function
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  ; Empty function
EndEvent

Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, Int aState)
  If aState == 0
    
  ElseIf aState == 1
    
  EndIf
EndEvent

Event OnShipGravJump(Location aDestination, Int aState)
  spaceshipreference MyShip = None
  MyShip = Self.GetShipRef()
  If aState == 0
    
  EndIf
  If aState == 1
    
  EndIf
  If aState == 2
    
  EndIf
  If aState == 3
    
  EndIf
EndEvent

Event OnShipTakeOff(Bool abComplete)
  If !abComplete
    
  EndIf
  If abComplete
    
  EndIf
EndEvent

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If !abComplete
    
  EndIf
  If abComplete
    
  EndIf
EndEvent

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If !abComplete
    
  EndIf
  If abComplete
    
  EndIf
EndEvent

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If aElectromagneticDamage
    
  EndIf
EndEvent

Event OnShipSystemRepaired(ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  If aElectromagneticDamage
    
  EndIf
EndEvent
