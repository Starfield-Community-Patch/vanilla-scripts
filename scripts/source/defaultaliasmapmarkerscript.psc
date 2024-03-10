ScriptName DefaultAliasMapMarkerScript Extends ReferenceAlias Const default
{ default script to set map marker data on a map marker in an alias }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property AllowGravJump = False Auto Const
{ allow grav jump to the map marker? (only valid for space map markers) }
Bool Property VisibleOnStarMap = True Auto Const
{ Visible on Star Map? }
Bool Property Discovered = False Auto Const
{ set the map marker "discovered"? }
Int Property UndiscoveredVisibility = -1 Auto Const
{ undiscovered visibility: -1 = don't change
  0 = Always (default)
  1 = System
  2 = Planet }
Int Property MapMarkerType = -1 Auto Const
{ map marker type. See SetMapMarkerType in CS wiki for enum values
    -1 = don't change }
Int Property MapMarkerCategory = -1 Auto Const
{ map marker category. See SetMapMarkerCategory in CS wiki for enum values
    -1 = don't change }
Message Property UnexploredName Auto Const
{ OPTIONAL - unexplored name to set on map marker if supplied }
Bool Property EnableOnInit = True Auto Const
{ Enables the map marker on init (usually irrelevant but required for default space cell map markers which are all initially disabled) }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.UpdateMapMarkerFlags()
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  Self.UpdateMapMarkerFlags()
EndEvent

Function UpdateMapMarkerFlags()
  ObjectReference mapMarkerRef = Self.GetRef()
  If mapMarkerRef
    mapMarkerRef.SetMarkerAllowGravJump(AllowGravJump)
    mapMarkerRef.SetMarkerVisibleOnStarMap(VisibleOnStarMap)
    If UndiscoveredVisibility > -1
      mapMarkerRef.SetMarkerUndiscoveredVisibility(UndiscoveredVisibility)
    EndIf
    If MapMarkerType > -1
      mapMarkerRef.SetMapMarkerType(MapMarkerType)
    EndIf
    If MapMarkerCategory > -1
      mapMarkerRef.SetMapMarkerCategory(MapMarkerCategory)
    EndIf
    If UnexploredName
      mapMarkerRef.SetMapMarkerUnexploredName(UnexploredName)
    EndIf
    If EnableOnInit
      mapMarkerRef.Enable(False)
    EndIf
    If Discovered
      mapMarkerRef.SetMarkerDiscovered()
    EndIf
  EndIf
EndFunction
