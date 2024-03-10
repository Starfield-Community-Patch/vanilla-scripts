ScriptName ShipbuilderMenuActivator Extends ObjectReference
{ script for buying ships via a kiosk activator 
    NOTE: kiosk should either be linked to a landing marker, OR be linked to another kiosk which is linked to the landing marker.ShipVendorScript
    So, if you have multiple kiosks, only link one to the landing marker, link the others to that kiosk. }

;-- Variables ---------------------------------------
Bool initialized = False

;-- Properties --------------------------------------
ActorBase Property ShipbuilderVendor Auto Const mandatory
{ vendor to create when built - needs to have ShipVendorScript }
shipvendorscript Property myVendor Auto hidden
{ holds the ship vendor for the "master" kiosk }
ShipbuilderMenuActivator Property myLinkedParent Auto hidden
{ linked kiosk that holds the vendor to use }
Message Property ShipBuilderVendorMessage Auto Const
{ the message that pops up on activation }

;-- Functions ---------------------------------------

Event OnLoad()
  If initialized == False
    If myVendor == None && myLinkedParent == None
      myLinkedParent = Self.GetLinkedRef(None) as ShipbuilderMenuActivator
      If myLinkedParent == None
        myVendor = Self.PlaceAtMe(ShipbuilderVendor as Form, 1, False, True, True, None, None, True) as shipvendorscript
        myVendor.Initialize(Self.GetLinkedRef(None))
      EndIf
    EndIf
    initialized = True
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    shipvendorscript theShipServicesActor = myVendor
    If theShipServicesActor == None
      theShipServicesActor = myLinkedParent.myVendor
    EndIf
    If theShipServicesActor
      Int messageIndex = ShipBuilderVendorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If messageIndex == 0
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, False)
      ElseIf messageIndex == 1
        theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor as Actor, None, True)
      EndIf
    EndIf
  EndIf
EndEvent
