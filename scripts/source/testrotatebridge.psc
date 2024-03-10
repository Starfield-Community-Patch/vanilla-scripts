ScriptName TestRotateBridge Extends ObjectReference
{ Placeholder for rotating bridge }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Keyword Property LinkCustom03 Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Keyword Property LinkCustom05 Auto Const mandatory
Keyword Property LinkCustom06 Auto Const mandatory
Keyword Property LinkCustom07 Auto Const mandatory
Float Property RotationSpeed = 10.0 Auto Const

;-- State -------------------------------------------
Auto State Closed

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving")
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False)
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100)
    Int index = 0
    While index < BridgeSegments.Length
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), 1.0, RotationSpeed)
      index += 1
    EndWhile
    Self.GotoState("Open")
    Self.GetLinkedRef(LinkCustom06).Enable(False)
    Self.GetLinkedRef(LinkCustom05).Disable(False)
  EndEvent

  Event OnLoad()
    Self.GetLinkedRef(LinkCustom07).Disable(False)
    Self.GetLinkedRef(LinkCustom06).Disable(False)
    Self.GetLinkedRef(LinkCustom05).Enable(False)
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100)
    Int index = 0
    While index < BridgeSegments.Length
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 0.0, 0.0)
      index += 1
    EndWhile
  EndEvent
EndState

;-- State -------------------------------------------
State Moving
EndState

;-- State -------------------------------------------
State Open

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving")
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False)
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100)
    Int index = BridgeSegments.Length
    While index > 0
      index -= 1
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 1.0, RotationSpeed)
    EndWhile
    Self.GotoState("Closed")
    Self.GetLinkedRef(LinkCustom05).Enable(False)
    Self.GetLinkedRef(LinkCustom06).Disable(False)
  EndEvent
EndState
