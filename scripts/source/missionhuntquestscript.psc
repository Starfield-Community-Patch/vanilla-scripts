ScriptName MissionHuntQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MissionTypeData
  ReferenceAlias Property MapMarker Auto Const mandatory
  { map marker of target location }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    ObjectReference mapMarkerRef = MapMarker.GetRef()
    If mapMarkerRef
      mapMarkerRef.AddToMapScanned(False)
    EndIf
  EndIf
  Parent.MissionAccepted(bAccepted)
EndFunction
