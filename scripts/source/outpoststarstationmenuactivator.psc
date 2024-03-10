ScriptName OutpostStarstationMenuActivator Extends ObjectReference

;-- Variables ---------------------------------------
outpoststarstationactorscript myVendor

;-- Properties --------------------------------------
Message Property OutpostStarstationMessage Auto Const mandatory
{ message box listing options }
ActorBase Property OutpostStarstationVendor Auto Const mandatory
{ vendor to create when built }

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  myVendor = Self.PlaceAtMe(OutpostStarstationVendor as Form, 1, False, True, True, None, None, True) as outpoststarstationactorscript
  myVendor.Initialize(Self.GetLinkedRef(None))
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  If myVendor
    myVendor.Cleanup()
    myVendor.Delete()
    myVendor = None
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    outpoststarstationactorscript theShipServicesActor = myVendor
    If theShipServicesActor
      Int messageIndex = OutpostStarstationMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If messageIndex == 0
        theShipServicesActor.ModifyStarstation()
      EndIf
    EndIf
  EndIf
EndEvent
