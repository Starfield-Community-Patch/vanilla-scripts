ScriptName DefaultPassengerQuestScript Extends Quest default
{ Manages handling passengers getting on and off your ship at a destination, and setting quest stages dealing with passengers and delivery.

IMPORTANT: If you want to have you actors continue to walk to the destination marker after they leave the ship,
you need to put DefaultPassengerPackage on the alias you hook up to Alias_Passengers property.

Call these functions to make aliases into passengers (which also adds them to this script's Alias_Passengers RefCollectionAlias)
*AddPassenger(Alias_To_Make_A_Passenger)
*AddPassengers(RefCollectionAlias_To_Make_Passengers)

You shouldn't need to do this, but if you find a reason you need to manually remove an actor from being a passenger:
*RemovePassengerActor(Actor_To_Stop_Being_Passenger) }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard PassengerGuard

;-- Properties --------------------------------------
Group AutofillProperties
  sq_playershipscript Property SQ_Playership Auto Const mandatory
  Keyword Property LinkPassengerShipMarker Auto Const mandatory
  Keyword Property LinkPassengerDestinationMarker Auto Const mandatory
  ActorValue Property DefaultPassengerState Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_0_WalkToShipThenSandbox Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_1_RunToShipThenSandbox Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_2_WalkToDestination Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_3_RunToDestination Auto Const mandatory
EndGroup

Group Aliases
  RefCollectionAlias Property Alias_Passengers Auto Const mandatory
  { The references in this alias should be managed by this script. Use AddPassenger() and AddPassengers() to add refs to this alias. }
  LocationAlias Property Alias_PassengerDestination Auto Const mandatory
  { Location alias that represents the destination you are delivering the passenger to. }
  ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const mandatory
  { A marker for where you want the passengers to walk to when they disembark at the destination. }
EndGroup

Group Stages
  Int Property StageToSetOnPlayerShipArrivesAtDestination Auto Const mandatory
  { will set this stage when player's ship arrives at Alias_PassengerDestination }
  Int Property StageToSetWhenAllPassengersDisembark Auto Const mandatory
  { will set this stage when all the Passengers exit the ship after it arrives at Alias_PassengerDestination }
  Float Property ArrivalDistance = 5.0 Auto Const
  { how close to the Arrival Marker do Passengers need to be to be considered to have arrived? }
EndGroup

Group Default_Passenger_Behavior_REMEMBER_Add_DefaultPassengerAlias_to_Passengers_Alias
{ IMPORTANT: If you want to have you actors continue to walk to the destination marker after they leave the ship,
you need to put DefaultPassengerPackage on the alias you hook up to Alias_Passengers property. }
  Bool Property RunToShip = True Auto Const
  { (Default: false) If true, passengers will run instead of walk to get to the player ship. }
  Bool Property RunToDestination = False Auto Const
  { (Default: false) If true, passengers will run instead of walk to get to the destination upon arrival. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
  String Property CustomLog = "" Auto Const
  { *Default: "") If not empy, will trace to this log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Alias_PassengerDestinationMarker as ScriptObject, "OnAliasChanged")
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnAliasChanged")
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnDeath")
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnUnload")
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnExitShipInterior")
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipLanding")
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipTakeoff")
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipDock")
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipUndock")
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Alias_PassengerDestinationMarker
    If abRemove
      Self._UpdatePassengerDestinationLinks(None)
    Else
      Self._UpdatePassengerDestinationLinks(Alias_PassengerDestinationMarker.GetReference())
    EndIf
  EndIf
EndEvent

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If akSender == Alias_Passengers
      ObjectReference destinationMarkerRef = Alias_PassengerDestinationMarker.GetReference()
      If abRemove
        Self.UnregisterForDistanceEvents(akObject as ScriptObject, destinationMarkerRef as ScriptObject, -1)
        akObject.SetLinkedRef(None, LinkPassengerDestinationMarker, True)
      Else
        Self.RegisterForDistanceLessThanEvent(akObject as ScriptObject, destinationMarkerRef as ScriptObject, ArrivalDistance, 0)
        akObject.SetLinkedRef(destinationMarkerRef, LinkPassengerDestinationMarker, True)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If akSender == Alias_Passengers
      Self.RemovePassengerActor(akSenderRef as Actor)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSender, ObjectReference akSenderRef)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If akSender == Alias_Passengers && Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination)
      Self._HandlePassengerArrival(akSenderRef)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If akSender == Alias_Passengers && Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination)
      Self._HandlePassengerArrival(akSenderRef)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference passengerRef = None
    If Alias_Passengers.find(akObj1) > -1
      passengerRef = akObj1
    ElseIf Alias_Passengers.find(akObj2) > -1
      passengerRef = akObj2
    EndIf
    If passengerRef
      Self._HandlePassengerArrival(passengerRef)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, Bool abComplete)
  Self.ShipArriving(akSender, abComplete)
EndEvent

Event ReferenceAlias.OnShipTakeOff(ReferenceAlias akSender, Bool abComplete)
  Self.ShipDeparting(akSender, abComplete)
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSender, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Self.ShipArriving(akSender, abComplete)
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSender, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Self.ShipDeparting(akSender, abComplete)
EndEvent

Function ShipArriving(ReferenceAlias akSender, Bool abComplete)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference shipRef = akSender.GetShipReference() as ObjectReference
    If abComplete && shipRef.IsInLocation(Alias_PassengerDestination.GetLocation()) && Self.HavePassengers()
      If Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) == False
        Self.SetStage(StageToSetOnPlayerShipArrivesAtDestination)
        Self.SetAllPassengersGoToDestination()
        SQ_Playership.RemovePassengers(Alias_Passengers)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ShipDeparting(ReferenceAlias akSender, Bool abComplete)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) && Alias_Passengers.GetCount() > 0
      Self.MoveAllPassengersToLinkedRef(LinkPassengerDestinationMarker, ArrivalDistance)
    Else
      Float notOnShipDistance = 1000.0
      Self.MoveAllPassengersToLinkedRef(LinkPassengerShipMarker, notOnShipDistance)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Bool Function HavePassengers()
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Bool returnVal = Alias_Passengers as Bool && Alias_Passengers.GetCount() > 0
    Return returnVal
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function MoveAllPassengersToLinkedRef(Keyword linkedRefKeyword, Float MoveIfDistanceGreaterThan)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor[] passengers = Alias_Passengers.GetActorArray()
    Int I = 0
    While I < passengers.Length
      Actor currentPassenger = passengers[I]
      ObjectReference linkedRef = currentPassenger.GetLinkedRef(linkedRefKeyword)
      If currentPassenger.GetDistance(linkedRef) > MoveIfDistanceGreaterThan
        currentPassenger.MoveTo(currentPassenger.GetLinkedRef(linkedRefKeyword), 0.0, 0.0, 0.0, True, False)
      EndIf
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function _HandlePassengerArrival(ObjectReference arrivingPassenger)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.RemovePassengerActor(arrivingPassenger as Actor)
    Int passengerCount = Alias_Passengers.GetCount()
    If passengerCount == 0
      Self.SetStage(StageToSetWhenAllPassengersDisembark)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function _UpdatePassengerDestinationLinks(ObjectReference DestinationMarker)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference[] passengerRefs = Alias_Passengers.GetArray()
    Int I = 0
    While I < passengerRefs.Length
      ObjectReference currentRef = passengerRefs[I]
      currentRef.SetLinkedRef(DestinationMarker, LinkPassengerDestinationMarker, True)
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function AddPassenger(ReferenceAlias PassengerToAdd)
  Self._AddPassengers(PassengerToAdd.GetReference().GetSingleRefArray() as Actor[])
EndFunction

Function AddPassengers(RefCollectionAlias PassengersToAdd)
  Self._AddPassengers(PassengersToAdd.GetActorArray())
EndFunction

Function _AddPassengers(Actor[] PassengersToAdd)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int I = 0
    While I < PassengersToAdd.Length
      Actor currentActor = PassengersToAdd[I]
      If currentActor.IsDead() == False
        SQ_Playership.AddPassenger(currentActor)
        Alias_Passengers.AddRef(currentActor as ObjectReference)
      EndIf
      I += 1
    EndWhile
    Self.SetAllPassengersGoToShip()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function RemovePassengerActor(Actor ActorToRemove)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    SQ_Playership.RemovePassenger(ActorToRemove)
    Alias_Passengers.RemoveRef(ActorToRemove as ObjectReference)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SetAllPassengersGoToShip()
  If RunToShip
    Self._SetAllPassengersAV(DefaultPassengerState_1_RunToShipThenSandbox)
  Else
    Self._SetAllPassengersAV(DefaultPassengerState_0_WalkToShipThenSandbox)
  EndIf
EndFunction

Function SetAllPassengersGoToDestination()
  If RunToDestination
    Self._SetAllPassengersAV(DefaultPassengerState_3_RunToDestination)
  Else
    Self._SetAllPassengersAV(DefaultPassengerState_2_WalkToDestination)
  EndIf
EndFunction

Function _SetAllPassengersAV(GlobalVariable GlobalWithValue)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ActorValue AV = DefaultPassengerState
    Actor[] passengers = Alias_Passengers.GetActorArray()
    Int I = 0
    While I < passengers.Length
      Actor currentActor = passengers[I]
      currentActor.SetValue(AV, GlobalWithValue.GetValue())
      currentActor.EvaluatePackage(False)
      I += 1
    EndWhile
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
