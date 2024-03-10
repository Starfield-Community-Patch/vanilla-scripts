ScriptName FABSpaceLocationChangeScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property LocationToCheck Auto Const mandatory
Int Property StageToSet Auto Const
Int Property ConditionalStage Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest MyQuest = Self.GetOwningQuest()
  If MyQuest.GetStageDone(ConditionalStage)
    If akNewLoc == LocationToCheck
      MyQuest.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
