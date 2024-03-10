ScriptName NewAtlantisTransitScript Extends ObjectReference
{ Controls the transit system for New Atlantis }

;-- Variables ---------------------------------------
Bool carWaiting = False
ObjectReference myLinkCustom01
ObjectReference myTrack
Bool playerInsideCar = False

;-- Properties --------------------------------------
String Property offRamp = "offRamp" Auto Const
{ event to call the car off the line }
String Property onRamp = "takeOff" Auto Const
{ event to call the car back on the line }
String Property offRampDone = "IdleStop" Auto Const
{ event that fires when offRamp is done }
Keyword Property LinkCustom01 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myTrack = Self.getLinkedRef(None)
  myLinkCustom01 = Self.getLinkedRef(LinkCustom01)
  Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerEnter")
  Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerLeave")
  Self.RegisterForRemoteEvent(myTrack as ScriptObject, "OnActivate")
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && carWaiting == False
    myTrack.PlayAnimationAndWait(offRamp, offRampDone)
    carWaiting = True
    myLinkCustom01.enable(False)
  EndIf
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If carWaiting == True
      playerInsideCar = True
    EndIf
    Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerEnter")
  EndIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    playerInsideCar = False
    Self.RegisterForRemoteEvent(myLinkCustom01 as ScriptObject, "OnTriggerLeave")
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If carWaiting == True && playerInsideCar == True
      carWaiting = False
      myTrack.PlayAnimation(onRamp)
    ElseIf carWaiting == False
      myTrack.PlayAnimationAndWait(offRamp, offRampDone)
      carWaiting = True
    EndIf
    Self.RegisterForRemoteEvent(myTrack as ScriptObject, "OnActivate")
  EndIf
EndEvent
