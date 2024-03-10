ScriptName DefaultQuestDistanceCheckScript Extends Quest Const default
{ Checks alias's distance to player, then sets stage }

;-- Structs -----------------------------------------
Struct DistanceCheckStage
  ReferenceAlias TargetAlias
  { The alias we're interested in }
  Int StageToSet = -1
  { Stage to Set }
  Float TargetDistance
  { The needed distance between this and the target }
  Bool DistanceLessThan = True
  { OPTIONAL - If true (default) checks if distance is less than. If false, checks if distance is greater than. }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultquestdistancecheckscript:distancecheckstage[] Property DistanceCheckStages Auto Const
{ array of stage/distance check data }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor player = Game.GetPlayer()
  Int I = 0
  While I < DistanceCheckStages.Length
    defaultquestdistancecheckscript:distancecheckstage theDistanceCheck = DistanceCheckStages[I]
    Self.RegisterForDistanceCheck(theDistanceCheck, player as ObjectReference)
    I += 1
  EndWhile
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.CheckDistanceStages(True, akObj2)
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.CheckDistanceStages(False, akObj2)
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  Int index = 0
  While index > -1 && index < DistanceCheckStages.Length
    index = DistanceCheckStages.findstruct("PrereqStage", auiStageID, index)
    If index > -1
      defaultquestdistancecheckscript:distancecheckstage theDistanceCheck = DistanceCheckStages[index]
      If Self.GetStageDone(theDistanceCheck.StageToSet) == False && (theDistanceCheck.TurnOffStage == -1 || Self.GetStage() < theDistanceCheck.TurnOffStage)
        Self.RegisterForDistanceCheck(theDistanceCheck, Game.GetPlayer() as ObjectReference)
      EndIf
      index += 1
    EndIf
  EndWhile
EndEvent

Function CheckDistanceStages(Bool bDistanceLessThan, ObjectReference theRef)
  Int I = 0
  While I < DistanceCheckStages.Length
    defaultquestdistancecheckscript:distancecheckstage theDistanceCheck = DistanceCheckStages[I]
    If theDistanceCheck.TargetAlias.GetRef() == theRef && theDistanceCheck.DistanceLessThan == bDistanceLessThan
      If theDistanceCheck.TurnOffStage == -1 || Self.GetStage() < theDistanceCheck.TurnOffStage
        Self.SetStage(theDistanceCheck.StageToSet)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function RegisterForDistanceCheck(defaultquestdistancecheckscript:distancecheckstage theDistanceCheck, ObjectReference targetRef)
  If theDistanceCheck.PrereqStage == -1 || Self.GetStageDone(theDistanceCheck.PrereqStage)
    If theDistanceCheck.DistanceLessThan
      Self.RegisterForDistanceLessThanEvent(targetRef as ScriptObject, theDistanceCheck.TargetAlias as ScriptObject, theDistanceCheck.TargetDistance, 0)
    Else
      Self.RegisterForDistanceGreaterThanEvent(targetRef as ScriptObject, theDistanceCheck.TargetAlias as ScriptObject, theDistanceCheck.TargetDistance, 0)
    EndIf
  EndIf
EndFunction
