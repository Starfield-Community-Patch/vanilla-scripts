ScriptName LC165ShiftingQuestScript Extends Quest
{ One of the quest scripts for LC165, Buried Temple. Handles the memory space shifting for the quest. }

;-- Structs -----------------------------------------
Struct ShiftDatum
  String Name
  { Required. A name for this shift destination. }
  ObjectReference PlayerMoveTarget
  { Required. Marker to move the player to. }
  ObjectReference CompanionMoveTarget
  { Optional. Marker to move the Companion to. If none, Companion will be moved to the fallback point. }
  ObjectReference AllyMoveTarget
  { Optional. Marker to move the Ally to. If none, Ally will be moved to the fallback point. }
  ObjectReference AdversaryMoveTargets
  { Optional. The first marker in a chain of markers to move the StarbornAdversary_Duplicates to. If none, StarbornAdversary_Duplicates will not be moved. }
  ReferenceAlias EnableParent
  { Optional. Enable parent of the geometry for this area. }
  RefCollectionAlias RefsToDisableOnShiftTo
  { Optional. RefCollection of refs to disable when we shift to this location. }
  RefCollectionAlias RefsToEnableOnShiftTo
  { Optional. RefCollection of refs to enable and move to package locations when we shift to this location. }
  RefCollectionAlias RefsToDisableOnShiftAway
  { Optional. RefCollection of refs to disable when we shift away from this location. }
  RefCollectionAlias RefsToEnableOnShiftAway
  { Optional. RefCollection of refs to enable and move to package locations when we shift away from this location. }
  String FunctionToCallDuringShift
  { Optional. Function to call on the quest script during the shift. }
  Bool IsShiftToPrimaryUniverse = False
  { Optional. If True, this is a shift back to the player's primary universe. Affects SFX. }
  Int StageToSetBeforeShift = -1
  { Optional. Stage to set on this quest at the beginning of the shift process. }
  Int StageToSetAfterShift = -1
  { Optional. Stage to set on this quest at the end of the shift process. }
  Bool SetAfterStageAfterVFX = False
  { Optional. If True, set the After stage only after lifting the VFX. Otherwise, set just before doing so. }
  Bool IsCrossCellMove = False
  { Optional. If True, use MoveTo instead of PopPlayerTo, and omit all VFX. }
  Bool ShouldEnableHandScanner = True
  { Optional. If True, enable the hand scanner following the shift. If False, disable it. }
  Float UpdateAdversaryDelay = 0.0
  { Optional. Amount of time to delay, after the shift has finished, before moving the Adversary. }
  Bool ShouldStopCombatOnShift = False
  { Optional. Should we stop combat on the player on shift? }
  Bool hasUpdatedAdversary = False
  { Runtime. Set when the adversary has been updated. }
EndStruct


;-- Variables ---------------------------------------
Float CONST_AdversaryTeleportInDelay = 0.25 Const
Int CONST_DistortionID_EnterScow = 2 Const
Int CONST_DistortionID_EnterVectera = 0 Const
Int CONST_DistortionID_LeaveScow = 3 Const
Int CONST_DistortionID_LeaveVectera = 1 Const
Int CONST_Objective_CompleteScowDistortion = 150 Const
Int CONST_Objective_CompleteVecteraDistortion = 110 Const
Int CONST_Objective_EnterScowDistortion = 140 Const
Int CONST_Objective_EnterVecteraDistortion = 100 Const
Int CONST_Objective_FindWayOutOfScowDistortion = 145 Const
Int CONST_Stage_FoundWayOutOfScowDistortion = 780 Const
Int CONST_WaitForAdversaryUpdateFailsafe = 1000 Const
inputenablelayer inputLayer
Actor player
lc165questscript selfAsQuestScript
ObjectReference shiftingActivatorRef
Bool updateAdversaryInProgress

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ShiftingGuard

;-- Properties --------------------------------------
Group ShiftingSystemProperties
  lc165shiftingquestscript:shiftdatum[] Property ShiftData Auto mandatory
  { List of Memory Spaces shifting targets. }
EndGroup

Group AutofillProperties
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ReferenceAlias Property Ally Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_Duplicates Auto Const mandatory
  RefCollectionAlias Property Followers Auto Const mandatory
  ReferenceAlias Property ShiftingActivator Auto Const mandatory
  ObjectReference Property LC165_Shift_CompanionFallbackMarkerRef Auto Const mandatory
  ObjectReference Property LC165_Shift_AllyFallbackMarkerRef Auto Const mandatory
  ObjectReference Property LC165AllyHoldingPenMarkerRef Auto Const mandatory
  ImageSpaceModifier Property MQ206DShiftFadeHoldImod Auto Const mandatory
  ImageSpaceModifier Property MQ206DShiftFadeInImod Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToA Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToB Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  Keyword Property LC165_StarbornAdversaryInaccessibleKeyword Auto Const mandatory
EndGroup

lc165shiftingquestscript:shiftdatum Property currentShift Auto hidden

;-- Functions ---------------------------------------

Event OnQuestInit()
  selfAsQuestScript = (Self as Quest) as lc165questscript
  player = Game.GetPlayer()
  inputLayer = inputenablelayer.Create()
  shiftingActivatorRef = ShiftingActivator.GetRef()
  Int I = 0
  While I < ShiftData.Length
    ShiftData[I].RefsToEnableOnShiftTo.ResetAll()
    I += 1
  EndWhile
EndEvent

Function ShiftTo(String Name, String FunctionToCallDuringShift, ObjectReference distortion, Int DistortionID, Actor[] stopCombatWith)
  Int index = ShiftData.findstruct("Name", Name, 0)
  If index < 0
    
  ElseIf ShiftData[index] == currentShift
    
  Else
    Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      lc165shiftingquestscript:shiftdatum oldShift = currentShift
      currentShift = ShiftData[index]
      If !currentShift.IsCrossCellMove
        If currentShift.IsShiftToPrimaryUniverse == True
          WwiseEvent_QSTMQ207C_ShiftToB.Play(player as ObjectReference, None, None)
        Else
          WwiseEvent_QSTMQ207C_ShiftToA.Play(player as ObjectReference, None, None)
        EndIf
        If distortion == None
          shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
        Else
          shiftingActivatorRef.MoveTo(distortion, 0.0, 0.0, 0.0, True, False)
        EndIf
        shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done")
      EndIf
      inputLayer.DisablePlayerControls(True, False, True, True, True, True, True, True, True, True, True)
      If currentShift.AdversaryMoveTargets != None
        updateAdversaryInProgress = True
        player.AddKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
        Game.PopPlayerTo(LC165AllyHoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False)
      EndIf
      If oldShift != None && oldShift.RefsToEnableOnShiftAway != None
        oldShift.RefsToEnableOnShiftAway.EnableAll(False)
      EndIf
      If oldShift != None && oldShift.RefsToDisableOnShiftAway != None
        oldShift.RefsToDisableOnShiftAway.DisableAll(False)
      EndIf
      If currentShift.StageToSetBeforeShift >= 0
        Self.SetStage(currentShift.StageToSetBeforeShift)
      EndIf
      If currentShift.EnableParent != None
        currentShift.EnableParent.TryToEnable()
      EndIf
      If currentShift.RefsToEnableOnShiftTo != None
        ObjectReference[] refsToEnable = currentShift.RefsToEnableOnShiftTo.GetArray()
        Int I = 0
        While I < refsToEnable.Length
          refsToEnable[I].Enable(False)
          I += 1
        EndWhile
      EndIf
      If currentShift.RefsToDisableOnShiftTo != None
        currentShift.RefsToDisableOnShiftTo.DisableAll(False)
      EndIf
      If !currentShift.IsCrossCellMove
        Game.PopPlayerTo(currentShift.PlayerMoveTarget, 0.0, 0.0, 0.0, True, False)
      Else
        player.MoveTo(currentShift.PlayerMoveTarget, 0.0, 0.0, 0.0, True, False)
      EndIf
      If FunctionToCallDuringShift != ""
        selfAsQuestScript.CallFunction(FunctionToCallDuringShift, None)
      EndIf
      If currentShift.FunctionToCallDuringShift != ""
        selfAsQuestScript.CallFunction(currentShift.FunctionToCallDuringShift, None)
      EndIf
      If currentShift.CompanionMoveTarget != None
        SQ_Followers.TeleportFollowers(currentShift.CompanionMoveTarget, None, True, True, True, False, True)
      Else
        SQ_Followers.TeleportFollowers(LC165_Shift_CompanionFallbackMarkerRef, None, True, True, False, True, True)
      EndIf
      Actor allyRef = Ally.GetActorRef()
      If allyRef != None
        Actor[] allyRefArray = new Actor[1]
        allyRefArray[0] = allyRef
        If currentShift.AllyMoveTarget != None
          SQ_Followers.TeleportFollowers(currentShift.AllyMoveTarget, allyRefArray, True, True, True, False, True)
        Else
          SQ_Followers.TeleportFollowers(LC165_Shift_AllyFallbackMarkerRef, allyRefArray, True, True, False, True, True)
        EndIf
      EndIf
      If currentShift.ShouldStopCombatOnShift
        player.StopCombat()
        If stopCombatWith != None
          Int i = 0
          While i < stopCombatWith.Length
            Actor current = stopCombatWith[i]
            If current != None
              current.StopCombat()
            EndIf
            i += 1
          EndWhile
        EndIf
      EndIf
      If !currentShift.SetAfterStageAfterVFX && currentShift.StageToSetAfterShift >= 0
        Self.SetStage(currentShift.StageToSetAfterShift)
      EndIf
      If DistortionID >= 0
        Self.UpdateObjectivesWhenEnteringDistortion(DistortionID)
      EndIf
      inputLayer.Reset()
      inputLayer.EnableHandScanner(currentShift.ShouldEnableHandScanner)
      If !currentShift.IsCrossCellMove
        shiftingActivatorRef.PlayAnimation("Stop01")
      EndIf
      If currentShift.SetAfterStageAfterVFX && currentShift.StageToSetAfterShift >= 0
        Self.SetStage(currentShift.StageToSetAfterShift)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndFunction

Function ShiftAdversary(String adversaryShiftName)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If currentShift == None
      
    ElseIf currentShift.Name != adversaryShiftName
      
    ElseIf currentShift.AdversaryMoveTargets == None
      
    ElseIf currentShift.hasUpdatedAdversary
      
    ElseIf currentShift.UpdateAdversaryDelay == 0.0
      Self.UpdateAdversary(currentShift.Name, currentShift.UpdateAdversaryDelay)
    Else
      Var[] akArgs = new Var[2]
      akArgs[0] = currentShift.Name as Var
      akArgs[1] = currentShift.UpdateAdversaryDelay as Var
      Self.CallFunctionNoWait("UpdateAdversary", akArgs)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function UpdateAdversary(String Name, Float delay)
  Utility.Wait(delay)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If currentShift == None
      
    Else
      Int index = ShiftData.findstruct("Name", Name, 0)
      If ShiftData[index] != currentShift
        
      ElseIf ShiftData[index].hasUpdatedAdversary
        
      Else
        Self.Private_UpdateAdversary()
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Private_UpdateAdversary()
  currentShift.hasUpdatedAdversary = True
  Actor[] adversaryArray = StarbornAdversary_Duplicates.GetArray() as Actor[]
  ObjectReference[] adversaryTargets = currentShift.AdversaryMoveTargets.GetLinkedRefChain(None, 100)
  adversaryTargets.insert(currentShift.AdversaryMoveTargets, 0)
  Int adversaryIndex = 0
  Int targetIndex = 0
  While adversaryIndex < adversaryArray.Length
    Actor current = adversaryArray[adversaryIndex]
    Bool currentIsDead = current.IsDead()
    If !currentIsDead
      Float targetHealth = current.GetValue(Health)
      ObjectReference currentTarget = adversaryTargets[targetIndex]
      selfAsQuestScript.TeleportIn(currentTarget, None, None)
      current.MoveTo(currentTarget, 0.0, 0.0, 0.0, True, False)
      current.RemoveKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
      current.SetNoBleedoutRecovery(False)
      current.RestoreValue(Health, 1.0)
      current.SetNoBleedoutRecovery(True)
      Float damageHealth = current.GetValue(Health) - targetHealth
      If damageHealth > 0.0
        current.DamageValue(Health, damageHealth)
      EndIf
      current.StartCombat(player as ObjectReference, False)
      current.EvaluatePackage(False)
      targetIndex = Math.Min((targetIndex + 1) as Float, (adversaryTargets.Length - 1) as Float) as Int
    EndIf
    adversaryIndex += 1
  EndWhile
  player.RemoveKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
  updateAdversaryInProgress = False
EndFunction

ObjectReference Function GetShiftEnableParentMarker(String Name)
  Int index = ShiftData.findstruct("Name", Name, 0)
  If index < 0
    Return None
  Else
    ReferenceAlias enableParentAlias = ShiftData[index].EnableParent
    If enableParentAlias == None
      Return None
    Else
      Return ShiftData[index].EnableParent.GetRef()
    EndIf
  EndIf
EndFunction

Function ShutdownShifting()
  If inputLayer != None
    inputLayer.Delete()
  EndIf
EndFunction

Function WaitForAdversaryUpdateToFinish()
  Int failsafe = 0
  While updateAdversaryInProgress && failsafe < CONST_WaitForAdversaryUpdateFailsafe
    Utility.Wait(0.25)
    failsafe += 1
  EndWhile
  If updateAdversaryInProgress
    
  EndIf
EndFunction

Function UpdateObjectivesWhenEnteringDistortion(Int DistortionID)
  If DistortionID == CONST_DistortionID_EnterVectera
    Self.SetObjectiveCompleted(100, True)
    Self.SetObjectiveDisplayed(110, True, False)
  ElseIf DistortionID == CONST_DistortionID_LeaveVectera
    Self.SetObjectiveDisplayed(110, False, False)
    Self.SetObjectiveCompleted(100, False)
    Self.SetObjectiveDisplayed(100, True, False)
  ElseIf DistortionID == CONST_DistortionID_EnterScow
    Self.SetObjectiveCompleted(140, True)
    If !Self.GetStageDone(CONST_Stage_FoundWayOutOfScowDistortion)
      Self.SetObjectiveDisplayed(145, True, False)
    Else
      Self.SetObjectiveDisplayed(150, True, False)
    EndIf
  ElseIf DistortionID == CONST_DistortionID_LeaveScow
    Self.SetObjectiveDisplayed(145, False, False)
    Self.SetObjectiveDisplayed(150, False, False)
    Self.SetObjectiveCompleted(140, False)
    Self.SetObjectiveDisplayed(140, True, False)
  EndIf
EndFunction
