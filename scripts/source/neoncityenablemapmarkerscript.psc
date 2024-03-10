ScriptName NeonCityEnableMapMarkerScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference[] myRefs = Self.GetRefsLinkedToMe(None, None)
  If myRefs.Length > 0
    ObjectReference myMapMarker = myRefs[0]
    If myMapMarker.IsDisabled()
      myMapMarker.EnableNoWait(False)
      myMapMarker.SetMarkerDiscovered()
      myMapMarker.OnMapMarkerDiscovered()
      myMapMarker.SetMarkerVisibleOnStarMap(True)
    EndIf
  EndIf
EndEvent
