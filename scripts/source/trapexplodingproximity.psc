ScriptName TrapExplodingProximity Extends TrapExplodingBase
{ Adds the ability to trigger an explosion based on proximity }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapExplodingProximityData
  Keyword Property LinkCustom01 Auto Const mandatory
  { Link Keyword from pivot to living or dead actor trigger }
  Keyword Property LinkCustom02 Auto Const mandatory
  { Link Keyword from pivot to projectile trigger }
  Float Property TimeToExplode = 0.0 Auto Const
  { Number of seconds until explosion }
  Bool Property ProjectileProximityTrigger = True Auto Const
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnActivate")
  If Self.GetLinkedRef(LinkCustom01)
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter")
  EndIf
  If Self.GetLinkedRef(LinkCustom02)
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter")
  EndIf
  Parent.HandleOnLoad()
EndFunction

Function HandleOnUnload()
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnActivate")
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter")
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter")
  Parent.HandleOnUnload()
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter")
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter")
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnActivate")
  Self.Disarm()
EndEvent

Event OnTimer(Int aiTimerID)
  If bDisarmed == False
    Self.Explode()
  EndIf
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If TimeToExplode > 0.0
    Self.StartTimer(TimeToExplode, 0)
    Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter")
    Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter")
  Else
    Self.Explode()
  EndIf
EndEvent
