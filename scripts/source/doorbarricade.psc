ScriptName DoorBarricade Extends ObjectReference
{ When this locked door barricade is unlocked it is disabled, plays a sound, and unlocks and makes usable a linked door. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkToBarricadedDoor Auto Const mandatory
Int Property LockLevel = 251 Auto Const
wwiseevent Property WwiseEvent_DRS_Barricade_Unlock Auto Const

;-- Functions ---------------------------------------

Function SetupBarricade()
  Self.EnableNoWait(False)
  If Self.GetLinkedRef(LinkToBarricadedDoor)
    If Self.GetLockLevel() != 0
      Self.GetLinkedRef(LinkToBarricadedDoor).BlockActivation(True, True)
      Self.GetLinkedRef(LinkToBarricadedDoor).SetLockLevel(LockLevel)
      Self.GetLinkedRef(LinkToBarricadedDoor).Lock(True, False, True)
    Else
      Self.DisableNoWait(False)
    EndIf
  EndIf
  Self.GoToState("Done")
EndFunction

Event OnLockStateChanged()
  If !Self.IsLocked()
    If Self.GetLinkedRef(LinkToBarricadedDoor)
      WwiseEvent_DRS_Barricade_Unlock.Play(Self.GetLinkedRef(LinkToBarricadedDoor), None, None)
      Self.GetLinkedRef(LinkToBarricadedDoor).Lock(False, False, True)
      Self.GetLinkedRef(LinkToBarricadedDoor).BlockActivation(False, False)
    EndIf
    Self.DisableNoWait(False)
  EndIf
EndEvent

Event OnReset()
  Self.GoToState("Initial")
  If Self.GetLinkedRef(None) == None
    Self.SetupBarricade()
  EndIf
EndEvent

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnCellLoad()
    Self.SetupBarricade()
  EndEvent
EndState
