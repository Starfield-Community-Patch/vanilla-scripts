ScriptName UC01QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct ReleaseDatum
  ReferenceAlias TargetAlias
  Int ActivationStage
EndStruct


;-- Variables ---------------------------------------
Bool bInCooldown
Bool bProcessing
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property UC01_SectorReleaseCountActivated Auto Const mandatory
  { Global tracking how many releases the player has activated }
  GlobalVariable Property UC01_SectorReleaseCountTotal Auto Const mandatory
  { Global tracking how many total releases the player needs to activate }
EndGroup

Group QuestStagesAndObjs
  Int Property StartExamStage = 300 Auto Const
  { Direct the player to proceed to the examination hall }
  Int Property AdaptabilityObj = 310 Auto Const
  { Objective index for the adaptability exam }
  Int Property UnlockPilotingStage = 400 Auto Const
  { Player's completed the Adaptability exam. Unlock the piloting exam. }
EndGroup

Group ReferenceAliases
  ReferenceAlias[] Property OrientationTargets Auto Const mandatory
  { Array of alias for the orientation targets }
  ReferenceAlias Property CurrentOrientationTarget Auto Const mandatory
  { Alias for the currently active orientation target }
EndGroup


;-- Functions ---------------------------------------

Function UpdateOrientationTarget()
  Int I = 0
  Int iLength = OrientationTargets.Length
  While I < iLength
    ReferenceAlias currAlias = OrientationTargets[I]
    ObjectReference currRef = currAlias.GetRef()
    ObjectReference ActiveTarget = CurrentOrientationTarget.GetRef()
    If currRef as Bool && currRef != ActiveTarget
      CurrentOrientationTarget.ForceRefTo(currRef)
      Return 
    EndIf
    I += 1
  EndWhile
EndFunction

Function DisplaySceneComplete(ObjectReference akTargetRef)
  While bProcessing
    Utility.Wait(1.0)
  EndWhile
  bProcessing = True
  Int I = 0
  Int iLength = OrientationTargets.Length
  Bool bFoundTarget = False
  While I < iLength && !bFoundTarget
    ReferenceAlias currAlias = OrientationTargets[I]
    ObjectReference currRef = currAlias.GetRef()
    If currRef == akTargetRef
      currAlias.Clear()
      Self.UpdateOrientationTarget()
      bFoundTarget = True
    EndIf
    I += 1
  EndWhile
  Int j = iLength - 1
  Bool bScenesRemaining = False
  While j >= 0 && !bScenesRemaining
    ReferenceAlias curralias = OrientationTargets[j]
    ObjectReference AvailableRef = curralias.GetRef()
    If curralias.GetRef() != None
      bScenesRemaining = True
    EndIf
    j -= 1
  EndWhile
  If !bScenesRemaining
    Self.SetStage(StartExamStage)
  EndIf
  bProcessing = False
EndFunction

Function DEBUGSkipCurrentDisplay()
  Self.DisplaySceneComplete(CurrentOrientationTarget.GetRef())
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
