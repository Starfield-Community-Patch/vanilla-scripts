ScriptName AddPowerRequirement Extends ObjectReference Const
{ Make this activator inaccessible if it does not have power. }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard UpdatePowerGuard

;-- Properties --------------------------------------
Keyword Property LinkToPowerSource Auto Const mandatory
Message Property PowerRequiredMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.GetLinkedRef(LinkToPowerSource).IsPowered() == False
    Self.BlockActivation(True, False)
    Self.SetActivateTextOverride(PowerRequiredMessage)
  EndIf
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkToPowerSource) as ScriptObject, "OnPowerOn")
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkToPowerSource) as ScriptObject, "OnPowerOff")
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
  Self.StartTimer(0.300000012, 0)
EndEvent

Event ObjectReference.OnPowerOff(ObjectReference akSender)
  Self.StartTimer(0.300000012, 0)
EndEvent

Event OnTimer(Int aiTimerID)
  Self.UpdatePowerState()
EndEvent

Function UpdatePowerState()
  Guard UpdatePowerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If Self.GetLinkedRef(LinkToPowerSource).IsPowered()
      Self.SetActivateTextOverride(None)
      Self.BlockActivation(False, False)
    Else
      Self.BlockActivation(True, False)
      Self.SetActivateTextOverride(PowerRequiredMessage)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
