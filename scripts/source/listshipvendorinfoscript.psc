ScriptName LISTShipVendorInfoScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_playershipscript Property playerShipScript Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False
    Actor theVendor = None
    ObjectReference landingMarker = playerShipScript.PlayerShipLandingMarker.GetRef()
    If akSpeakerRef == Game.GetPlayer() as ObjectReference
      theVendor = (akSpeakerRef as Actor).GetDialogueTarget()
    Else
      theVendor = akSpeakerRef as Actor
    EndIf
    If theVendor as Bool && landingMarker as Bool
      landingMarker.ShowHangarMenu(0, theVendor, None, False)
    EndIf
  EndIf
EndEvent
