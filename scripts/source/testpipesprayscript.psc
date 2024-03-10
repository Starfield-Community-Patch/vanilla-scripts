ScriptName TestPipeSprayScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTraps Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ActorValue Property HAZ_AV_Broken Auto Const mandatory
ActorValue Property HAZ_AV_Pressurized Auto Const mandatory
Float Property DamageThreshold = 90.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference PipeSegment = Self.GetLinkedRef(None)
  Self.RegisterForActorValueLessThanEvent(PipeSegment, Health, DamageThreshold)
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkTraps) as ScriptObject, "OnActivate")
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.GetLinkedRef(None).Disable(False)
  Self.SetValue(HAZ_AV_Broken, 1.0)
  If Self.GetValue(HAZ_AV_Pressurized) == 1.0
    Self.StartSpray()
  EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If Self.GetValue(HAZ_AV_Pressurized) == 1.0
    Self.SetValue(HAZ_AV_Pressurized, 0.0)
    Self.StopSpray()
  Else
    Self.SetValue(HAZ_AV_Pressurized, 1.0)
    If Self.GetValue(HAZ_AV_Broken) == 1.0
      Self.StartSpray()
    EndIf
  EndIf
EndEvent

Function StartSpray()
  Self.GetLinkedRef(None).GetLinkedRef(None).Enable(False)
EndFunction

Function StopSpray()
  Self.GetLinkedRef(None).GetLinkedRef(None).Disable(False)
EndFunction
