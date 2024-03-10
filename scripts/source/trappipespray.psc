ScriptName TrapPipeSpray Extends TrapBase

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapPipeSprayData
  ActorValue Property Health Auto Const mandatory
  ActorValue Property TRP_AV_Broken Auto Const mandatory
  ActorValue Property TRP_AV_Pressurized Auto Const mandatory
  Keyword Property TrapStartUnbrokenKeyword Auto Const mandatory
  { Add this keyword to the reference if the pipe segment should start unbroken. }
  Keyword Property LinkCustom01 Auto Const mandatory
  { Link to FX }
  Keyword Property LinkCustom02 Auto Const mandatory
  { Link to Hazard }
  Keyword Property LinkCustom03 Auto Const mandatory
  { Link to Weak PipeSegment }
  Float Property DamageThreshold = 99.0 Auto Const
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  ObjectReference PipeSegment = Self.GetLinkedRef(LinkCustom03)
  Self.GetLinkedRef(LinkCustom02).Disable(False)
  Self.SetValue(TRP_AV_Pressurized, 1.0)
  Self.RegisterForActorValueLessThanEvent(PipeSegment, Health, DamageThreshold)
  If Self.HasKeyword(TrapStartUnbrokenKeyword) == False
    Self.BreakPipe()
  EndIf
EndFunction

Function HandleOnUnload()
  Self.StopSpray()
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.BreakPipe()
EndEvent

Function BecomeActive()
  Self.SetValue(TRP_AV_Pressurized, 1.0)
  If Self.GetValue(TRP_AV_Broken) == 1.0
    Self.StartSpray()
  EndIf
EndFunction

Function BecomeInactive()
  Self.SetValue(TRP_AV_Pressurized, 0.0)
  Self.StopSpray()
EndFunction

Function BreakPipe()
  Self.GetLinkedRef(LinkCustom03).Disable(False)
  Self.SetValue(TRP_AV_Broken, 1.0)
  If Self.GetValue(TRP_AV_Pressurized) == 1.0
    Self.StartSpray()
  EndIf
EndFunction

Function StartSpray()
  Self.GetLinkedRef(LinkCustom01).PlayAnimation("Play01")
  Self.GetLinkedRef(LinkCustom02).Enable(False)
EndFunction

Function StopSpray()
  Self.GetLinkedRef(LinkCustom02).Disable(False)
  Self.GetLinkedRef(LinkCustom01).PlayAnimation("StopEffect")
EndFunction
