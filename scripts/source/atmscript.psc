ScriptName ATMScript Extends ObjectReference
{ script for hackable ATM script }

;-- Variables ---------------------------------------
Int tempStealCount = 0

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard stealGuard

;-- Properties --------------------------------------
Keyword Property ATMLink_Door Auto Const mandatory
{ keyword for linked ref to fake locked door to hack }
Keyword Property ATMLink_Container Auto Const mandatory
{ keyword for linked ref to container holding credits }

;-- Functions ---------------------------------------

Event ObjectReference.OnLockStateChanged(ObjectReference akSource)
  If akSource.IsLocked()
    Self.GotoState("locked")
  EndIf
EndEvent

Function StealFromATM()
  tempStealCount += 1
  Guard stealGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If Self.GetState() == "locked"
      ObjectReference myDoor = Self.GetLinkedRef(ATMLink_Door)
      If myDoor as Bool && myDoor.IsLocked() == False
        Self.GotoState("hacked")
        ObjectReference myContainer = Self.GetLinkedRef(ATMLink_Container)
        If myContainer
          MiscObject credits = Game.GetCredits()
          Int creditsAmount = myContainer.GetItemCount(credits as Form)
          myContainer.SendStealAlarm(Game.GetPlayer())
          myContainer.RemoveAllItems(Game.GetPlayer() as ObjectReference, True, False)
          ObjectReference stealRef = myContainer.PlaceAtMe(credits as Form, creditsAmount, False, False, True, None, None, True)
          stealRef.SetFactionOwner(myContainer.GetFactionOwner(), False)
          stealRef.SendStealAlarm(Game.GetPlayer())
          stealRef.Disable(False)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SetupLockedState()
  ObjectReference myDoor = Self.GetLinkedRef(ATMLink_Door)
  If myDoor as Bool && myDoor.IsLocked()
    Self.RegisterForRemoteEvent(myDoor as ScriptObject, "OnLockStateChanged")
  Else
    Self.GotoState("hacked")
  EndIf
  Self.BlockActivation(True, False)
EndFunction

;-- State -------------------------------------------
State hacked

  Event OnBeginState(String asOldState)
    Self.BlockActivation(True, True)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State locked

  Event ObjectReference.OnLockStateChanged(ObjectReference akSource)
    Self.StealFromATM()
  EndEvent

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      ObjectReference myDoor = Self.GetLinkedRef(ATMLink_Door)
      If myDoor
        If myDoor.IsLocked()
          myDoor.Activate(akActionRef, False)
        Else
          Self.GotoState("hacked")
        EndIf
      EndIf
    EndIf
  EndEvent

  Event OnBeginState(String asOldState)
    Self.SetupLockedState()
  EndEvent

  Event OnInit()
    Self.SetupLockedState()
  EndEvent
EndState
