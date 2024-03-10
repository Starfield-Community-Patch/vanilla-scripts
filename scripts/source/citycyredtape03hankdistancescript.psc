ScriptName CityCYRedTape03HankDistanceScript Extends Quest
{ Checks Hank's distance to his ship, then sets stage }

;-- Structs -----------------------------------------
Struct DistanceCheckStage
  Int StageToSet = -1
  { Stage to Set }
  Float TargetDistance
  { The needed distance between this and the target }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute }
  Int TurnOffStageDone = -1
  { OPTIONAL - If stage TurnOffStageDone is set, this script's functionality is ignored }
EndStruct


;-- Variables ---------------------------------------
Int I = 0

;-- Properties --------------------------------------
ReferenceAlias Property Hank Auto Const mandatory
ReferenceAlias Property EquipmentMarker Auto Const mandatory
citycyredtape03hankdistancescript:distancecheckstage[] Property DistanceCheckStages Auto Const
{ array of stage/distance check data }

;-- Functions ---------------------------------------

Function StartDistanceCheck()
  If I < DistanceCheckStages.Length
    citycyredtape03hankdistancescript:distancecheckstage theDistanceCheck = DistanceCheckStages[I]
    Self.RegisterForDistanceLessThanEvent(Hank.GetRef() as ScriptObject, EquipmentMarker.GetRef() as ScriptObject, theDistanceCheck.TargetDistance, 0)
  EndIf
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  citycyredtape03hankdistancescript:distancecheckstage theDistanceCheck = DistanceCheckStages[I]
  If (theDistanceCheck.PrereqStage == -1 || Self.GetStageDone(theDistanceCheck.PrereqStage)) && (theDistanceCheck.TurnOffStageDone == -1 || !Self.GetStageDone(theDistanceCheck.TurnOffStageDone))
    If I < DistanceCheckStages.Length
      I += 1
    EndIf
    Self.SetStage(theDistanceCheck.StageToSet)
  EndIf
EndEvent
