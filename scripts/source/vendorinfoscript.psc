ScriptName VendorInfoScript Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False
    Actor vendorRef = None
    spaceshipreference vendorShipRef = None
    If akSpeakerRef == Game.GetPlayer() as ObjectReference
      vendorRef = (akSpeakerRef as Actor).GetDialogueTarget()
    Else
      vendorRef = akSpeakerRef as Actor
      If vendorRef == None
        vendorShipRef = akSpeakerRef as spaceshipreference
      EndIf
    EndIf
    If vendorShipRef
      Utility.Wait(0.200000003)
      vendorShipRef.ShowBarterMenu()
    ElseIf vendorRef
      Utility.Wait(0.200000003)
      vendorRef.ShowBarterMenu()
    EndIf
  EndIf
EndEvent
