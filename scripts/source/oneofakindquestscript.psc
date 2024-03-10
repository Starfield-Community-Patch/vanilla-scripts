ScriptName OneOfAKindQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CageDoor Auto Const mandatory
{ Ref alias for the Ecliptic base cage door. }

;-- Functions ---------------------------------------

Function OpenCageGate()
  ObjectReference CageREF = CageDoor.GetRef()
  Int currOpenState = CageREF.GetOpenState()
  If currOpenState == 1
    CageREF.SetOpen(False)
  ElseIf currOpenState == 3
    CageREF.SetOpen(True)
    Self.SetStage(200)
  EndIf
EndFunction
