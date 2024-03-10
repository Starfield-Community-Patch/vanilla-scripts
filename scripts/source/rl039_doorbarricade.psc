ScriptName RL039_DoorBarricade Extends ObjectReference Const
{ When this locked door barricade is unlocked it is disabled, plays a sound, and unlocks and makes usable a linked door. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkToBarricadedDoor Auto Const mandatory
Message Property DoorActivationOverrideName Auto Const mandatory
Message Property DoorActivationInfoMessage Auto Const mandatory
Int Property LockLevel = 254 Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference linkedDoor = Self.GetLinkedRef(LinkToBarricadedDoor)
  If linkedDoor
    linkedDoor.SetLockLevel(LockLevel)
    linkedDoor.Lock(True, False, True)
    linkedDoor.SetActivateTextOverride(DoorActivationOverrideName)
    Self.RegisterForRemoteEvent(linkedDoor as ScriptObject, "OnActivate")
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  DoorActivationInfoMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndEvent

Event OnActivate(ObjectReference akActionRef)
  ObjectReference linkedDoor = Self.GetLinkedRef(LinkToBarricadedDoor)
  If linkedDoor
    linkedDoor.Lock(False, False, True)
    linkedDoor.SetActivateTextOverride(None)
    Self.UnregisterForRemoteEvent(linkedDoor as ScriptObject, "OnActivate")
  EndIf
  Self.DisableNoWait(False)
EndEvent
