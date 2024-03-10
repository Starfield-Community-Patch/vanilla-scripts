ScriptName DefaultRefMapMarkerOnDiscoveryScript Extends ObjectReference Const default
{ Set map marker flags OnMapMarkerDiscovered event }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property VisibleOnStarMap = True Auto Const
{ Visible on Star Map? }
Int Property MapMarkerType = -1 Auto Const
{ map marker type. See SetMapMarkerType in CS wiki for enum values
    -1 = don't change }
Int Property MapMarkerCategory = -1 Auto Const
{ map marker category. See SetMapMarkerCategory in CS wiki for enum values
    -1 = don't change }

;-- Functions ---------------------------------------

Event OnMapMarkerDiscovered()
  Self.SetMarkerVisibleOnStarMap(VisibleOnStarMap)
  If MapMarkerType > -1
    Self.SetMapMarkerType(MapMarkerType)
  EndIf
  If MapMarkerCategory > -1
    Self.SetMapMarkerCategory(MapMarkerCategory)
  EndIf
EndEvent
