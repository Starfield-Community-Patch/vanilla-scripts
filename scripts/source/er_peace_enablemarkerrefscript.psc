ScriptName ER_Peace_EnableMarkerRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_ER_Peace Auto Const mandatory
{ Quest to check for completion to trigger this state change }
Int Property StageToCheck = 1000 Auto Const
{ Stage we're looking for completion on City_ER_Peace }

;-- Functions ---------------------------------------

Event OnUnload()
  If City_ER_Peace.GetStageDone(StageToCheck) && !Self.IsDisabled()
    Self.Disable(False)
  EndIf
EndEvent
