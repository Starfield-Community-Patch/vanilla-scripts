ScriptName VendorActivatorScript Extends ObjectReference
{ script for accessing the vendor menu via an activator }

;-- Variables ---------------------------------------
Actor myVendor
ObjectReference myVendorContainer

;-- Properties --------------------------------------
ActorBase Property Vendor Auto Const mandatory
{ vendor to create on load }
Container Property VendorContainer Auto Const mandatory
{ vendor container to create on load }
Keyword Property VendorContainerKeyword01 Auto Const mandatory
{ used to link vendor container }
Bool Property ClearVendorActorInventoryOnLoad = False Auto Const
{ If true, the spawned Vendor actor will have its inventory cleared each time the Activator loads. }

;-- Functions ---------------------------------------

Event OnLoad()
  If myVendor == None
    myVendor = Self.PlaceActorAtMe(Vendor, 4, None, False, True, True, None, True)
    myVendorContainer = Self.PlaceAtMe(VendorContainer as Form, 1, False, True, True, None, None, True)
    myVendor.SetLinkedRef(myVendorContainer, VendorContainerKeyword01, True)
  EndIf
  If ClearVendorActorInventoryOnLoad
    myVendor.RemoveAllItems(None, False, False)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    myVendor.ShowBarterMenu()
  EndIf
EndEvent
