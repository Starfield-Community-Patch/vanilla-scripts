ScriptName TrapBreakableStructure Extends TrapBase
{ Breakable Structure trap script, structure breaks when it is hit by dt_structural damage) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapCatwalkScriptData
  Keyword Property LinkCustom01 Auto Const mandatory
  { Link from pivot to the catwalk segment }
  Keyword Property LinkCustom02 Auto Const mandatory
  { Link from pivot to the NAVCUT volume }
  ActorValue Property Stim_Health_Structural Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  If bDisarmed == False
    ObjectReference BreakableSegment = Self.GetLinkedRef(LinkCustom01)
    Self.GetLinkedRef(LinkCustom02).Disable(False)
    Self.RegisterForActorValueLessThanEvent(BreakableSegment, Stim_Health_Structural, 100.0)
  EndIf
EndFunction

Function HandleOnUnload()
  ObjectReference BreakableSegment = Self.GetLinkedRef(LinkCustom01)
  Self.UnregisterForActorValueLessThanEvent(BreakableSegment, Stim_Health_Structural, 100.0)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.BreakStructure()
EndEvent

Function BreakStructure()
  Self.Disarm()
  Self.GetLinkedRef(LinkCustom01).Disable(False)
  Self.GetLinkedRef(LinkCustom02).Enable(False)
EndFunction
