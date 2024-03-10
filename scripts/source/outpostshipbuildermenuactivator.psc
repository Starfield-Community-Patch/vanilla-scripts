ScriptName OutpostShipbuilderMenuActivator Extends OutpostEventHandlerParent

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property OutpostShipbuilderMessage Auto Const mandatory
{ message box listing options }
ActorBase Property OutpostShipbuilderVendor Auto Const mandatory
{ vendor to create when built }
shipvendorscript Property myVendor Auto hidden

;-- Functions ---------------------------------------

Function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
  myVendor = Self.PlaceAtMe(OutpostShipbuilderVendor as Form, 1, False, True, True, None, None, True) as shipvendorscript
  ObjectReference myLandingMarker = Self.GetLinkedRef(None)
  myVendor.Initialize(myLandingMarker)
EndFunction

Function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
  If myVendor
    myVendor.Delete()
    myVendor = None
  EndIf
EndFunction

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    shipvendorscript theShipServicesActor = myVendor
    If theShipServicesActor
      Int messageIndex = OutpostShipbuilderMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If messageIndex == 0
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, False)
      ElseIf messageIndex == 1
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, True)
      EndIf
    EndIf
  EndIf
EndEvent
