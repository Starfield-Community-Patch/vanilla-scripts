ScriptName MotionDetectorScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ Link from pivot to Trigger }
Keyword Property LinkCustom02 Auto Const mandatory
{ Link from pivot to Motion Detector }
Keyword Property LinkCustom03 Auto Const mandatory
Bool Property UnlockOnOpen = False Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter")
EndEvent

Event OnUnload()
  Self.UnregisterForAllRemoteEvents()
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference LinkedDoor = Self.GetLinkedRef(LinkCustom03)
  If LinkedDoor
    If UnlockOnOpen || LinkedDoor.isLocked() == False
      LinkedDoor.SetOpen(True)
    EndIf
  EndIf
EndEvent
