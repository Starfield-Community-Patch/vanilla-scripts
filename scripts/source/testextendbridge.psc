ScriptName TestExtendBridge Extends ObjectReference
{ Placeholder for extending bridge }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ LinkRef from Segments to the position marker for the Closed/Retracted Position }
Keyword Property LinkCustom02 Auto Const mandatory
{ LinkRef from Segments to the position marker for the Open/Extended Position }
Keyword Property LinkCustom03 Auto Const mandatory
{ LinkRef Chain through all the moving segments in the system }
Keyword Property LinkCustom04 Auto Const mandatory
{ Link to other activators in the system }
Keyword Property LinkCustom05 Auto Const mandatory
{ Link to Navcut collision volume }
Float Property TranslationSpeed = 1.0 Auto Const
Bool Property StartOpen = False Auto Const
{ Start in the Open/Extended position }
Bool Property BlockNavOnExtendedState = False Auto Const
{ Open is the Extended State, Closed is the Retracted State }

;-- State -------------------------------------------
Auto State Closed

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving")
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False)
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100)
    Int index = 0
    While index < BridgeSegments.Length
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), TranslationSpeed, 0.0)
      index += 1
    EndWhile
    Self.GotoState("Open")
    Self.GetLinkedRef(LinkCustom05).Disable(False)
  EndEvent

  Event OnLoad()
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100)
    If !StartOpen
      Int index = 0
      While index < BridgeSegments.Length
        BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 100.0, 0.0)
        index += 1
      EndWhile
    Else
      Self.GetLinkedRef(LinkCustom05).Disable(False)
      Int index = 0
      While index < BridgeSegments.Length
        BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), 100.0, 0.0)
        index += 1
      EndWhile
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State Moving
EndState

;-- State -------------------------------------------
State Open

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving")
    Self.GetLinkedRef(LinkCustom05).Enable(False)
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False)
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100)
    Int index = BridgeSegments.Length
    While index > 0
      index -= 1
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), TranslationSpeed, 0.0)
    EndWhile
    Self.GotoState("Closed")
  EndEvent
EndState
