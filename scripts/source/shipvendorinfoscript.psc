ScriptName ShipVendorInfoScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property OpenToShipForSale = False Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False
    sq_shipservicesactorscript theVendor = None
    If akSpeakerRef == Game.GetPlayer() as ObjectReference
      theVendor = (akSpeakerRef as Actor).GetDialogueTarget() as sq_shipservicesactorscript
    Else
      theVendor = akSpeakerRef as sq_shipservicesactorscript
    EndIf
    If theVendor as Bool && theVendor.myLandingMarker as Bool
      Utility.Wait(0.200000003)
      spaceshipreference shipForSale = None
      If OpenToShipForSale
        shipForSale = theVendor.GetShipForSale(0)
      EndIf
      theVendor.myLandingMarker.ShowHangarMenu(0, theVendor as Actor, shipForSale, OpenToShipForSale)
    EndIf
  EndIf
EndEvent
