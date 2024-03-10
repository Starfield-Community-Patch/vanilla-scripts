ScriptName LC012_VaultLockdown Extends ObjectReference Const
{ Lock Down the Vault in LC012 when activated. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const
{ Reference to the vault door }
Keyword Property LinkCustom02 Auto Const
{ Reference to Guards who should have UseCombatTravel AV set to 1. }
Keyword Property LinkCustom03 Auto Const
{ Link to collision volume to enable }
ActorValue Property UseCombatTravel Auto Const
{ AV that the linked guards will check in their custom package }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference LockDownDoor = Self.GetLinkedRef(None)
  ObjectReference VaultDoor = Self.GetLinkedRef(LinkCustom01)
  Self.GetLinkedRef(LinkCustom03).Enable(False)
  LockDownDoor.SetLockLevel(254)
  LockDownDoor.SetOpen(False)
  VaultDoor.SetLockLevel(254)
  VaultDoor.SetOpen(False)
  ObjectReference[] Guards = Self.GetLinkedRefChain(LinkCustom02, 100)
  Int I = 0
  While I < Guards.Length
    Guards[I].SetValue(UseCombatTravel, 1.0)
    (Guards[I] as Actor).EvaluatePackage(False)
    I += 1
  EndWhile
  Int j = 0
  While j <= 9
    If LockDownDoor.GetOpenState() == 3
      LockDownDoor.Lock(True, False, True)
    EndIf
    If VaultDoor.GetOpenState() == 3
      VaultDoor.Lock(True, False, True)
    EndIf
    Utility.Wait(0.300000012)
    j += 1
  EndWhile
  VaultDoor.Lock(True, False, True)
  LockDownDoor.Lock(True, False, True)
EndEvent
