ScriptName PlanetTraitScanTargetScript Extends ObjectReference
{ script for uncovering a planet trait when all the loc refs in this location are scanned }

;-- Variables ---------------------------------------
Location myLocation

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
{ use to get planet trait data }
ObjectReference Property PlanetTraitScanTargetRef Auto Const mandatory
{ ref from ScanTargetNames array on SQ_ParentScript to use for name }

;-- Functions ---------------------------------------

Function testIsScanned()
  ; Empty function
EndFunction

Event OnLoad()
  myLocation = Self.GetCurrentLocation()
  Self.BlockActivation(True, True)
  SQ_Parent.CheckForScanTargetUpdate(Self as ObjectReference)
EndEvent

;-- State -------------------------------------------
State done

  Event OnScanned()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State ready

  Event OnScanned()
    Self.gotoState("done")
    SQ_Parent.DiscoverMatchingPlanetTraits(Self as ObjectReference, True)
  EndEvent
EndState
