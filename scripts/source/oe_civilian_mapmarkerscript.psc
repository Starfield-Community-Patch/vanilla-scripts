ScriptName OE_Civilian_MapMarkerScript Extends ObjectReference Const
{ sets the name to standard name based on NPC type on init, if visible on starmap }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  SQ_Parent.CheckForRenameMapMarker(Self as ObjectReference)
EndEvent
