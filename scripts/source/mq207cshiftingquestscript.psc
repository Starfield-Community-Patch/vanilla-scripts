ScriptName MQ207CShiftingQuestScript Extends Quest
{ Quest script for MQ207C, Entangled. }

;-- Variables ---------------------------------------
Int CONST_DistanceFromDistortionToForceFallback = 8 Const
Int CONST_EmergencyShutdownStage = 720 Const
Int NishinaIIx
Int NishinaIx
ObjectReference[] distortionRefs
Actor player
mq207cquestscript selfAsQuestScript
ObjectReference shiftingActivatorRef
ObjectReference[] shiftingTriggerRefs

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ShiftingGuard

;-- Properties --------------------------------------
Group ShiftingSystemProperties
  ReferenceAlias Property NishinaIOriginMarker Auto Const mandatory
  { A marker representing the position of Nishina I, set below the minimum X coordinate for Nishina I. Used to calculate the position offset to Nishina II, and to determine which Nishina the player is in. }
  ReferenceAlias Property NishinaIIOriginMarker Auto Const mandatory
  { A marker representing the position of Nishina II, set below the minimum X coordinate for Nishina II. Used to calculate the position offset to Nishina I, and to determine which Nishina the player is in. }
  ReferenceAlias Property ShiftingActivator Auto Const mandatory
  { Activator that handles the shifting imagespace animation. }
  Scene[] Property ScenesToStopOnShift Auto Const
  { List of scenes to force-stop when the player shifts. }
EndGroup

Group AutofillProperties
  RefCollectionAlias Property ShiftingTriggers Auto Const mandatory
  RefCollectionAlias Property Distortions01 Auto Const mandatory
  RefCollectionAlias Property Distortions02 Auto Const mandatory
  RefCollectionAlias Property Nishina01_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_SecurityCameras_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_RobotsAndTurrets_All_I Auto Const mandatory
  Cell Property LC116Nishina01 Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToA Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToB Auto Const mandatory
  Keyword Property MQ207CLinkTarget Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup

Int Property NishinaOffset Auto hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
  ; Empty function
EndEvent

Event OnQuestInit()
  selfAsQuestScript = (Self as Quest) as mq207cquestscript
  player = Game.GetPlayer()
  NishinaIx = NishinaIOriginMarker.GetRef().GetPositionX() as Int
  NishinaIIx = NishinaIIOriginMarker.GetRef().GetPositionX() as Int
  NishinaOffset = NishinaIIx - NishinaIx
  shiftingActivatorRef = ShiftingActivator.GetRef()
  shiftingTriggerRefs = ShiftingTriggers.GetArray()
  Int I = 0
  While I < shiftingTriggerRefs.Length
    Self.RegisterForRemoteEvent(shiftingTriggerRefs[I] as ScriptObject, "OnTriggerEnter")
    I += 1
  EndWhile
  distortionRefs = Distortions01.GetArray()
  ObjectReference[] distortionRefs2 = Distortions02.GetArray()
  I = 0
  While I < distortionRefs2.Length
    distortionRefs.add(distortionRefs2[I], 1)
    I += 1
  EndWhile
  I = 0
  While I < distortionRefs.Length
    distortionRefs[I].BlockActivation(True, True)
    distortionRefs[I].DisableNoWait(False)
    I += 1
  EndWhile
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function
EndEvent

Bool Function ShouldPerformShift(ObjectReference akSource, mq207cshiftingobjectscript shiftingObject)
  If akSource != player as ObjectReference
    Return False
  ElseIf shiftingObject.PrereqStage >= 0 && !Self.GetStageDone(shiftingObject.PrereqStage)
    Return False
  ElseIf shiftingObject.TurnOffStage >= 0 && Self.GetStage() > shiftingObject.TurnOffStage
    Return False
  ElseIf Self.GetStageDone(CONST_EmergencyShutdownStage)
    Return False
  Else
    Return True
  EndIf
EndFunction

Function Shift(mq207cshiftingobjectscript shiftingObject, Bool shiftingObjectIsTrigger, Bool shouldForceFallback, Int additionalStageToSet, ObjectReference shiftToMarker)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.Private_Shift(shiftingObject, shiftingObjectIsTrigger, shouldForceFallback, additionalStageToSet, shiftToMarker, False, False)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ShiftNoFX(mq207cshiftingobjectscript shiftingObject, Bool shiftingObjectIsTrigger, Bool shouldForceFallback, Int additionalStageToSet, ObjectReference shiftToMarker)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.Private_Shift(shiftingObject, shiftingObjectIsTrigger, shouldForceFallback, additionalStageToSet, shiftToMarker, True, True)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function Private_Shift(mq207cshiftingobjectscript shiftingObject, Bool shiftingObjectIsTrigger, Bool shouldForceFallback, Int additionalStageToSet, ObjectReference shiftToMarker, Bool useCollisionCheck, Bool omitFX)
  Int currentUniverse = Self.GetCurrentUniverse()
  Int newUniverse = 0
  If currentUniverse == 1
    newUniverse = 2
  Else
    newUniverse = 1
  EndIf
  If !omitFX
    If currentUniverse == 1
      WwiseEvent_QSTMQ207C_ShiftToB.Play(player as ObjectReference, None, None)
    Else
      WwiseEvent_QSTMQ207C_ShiftToA.Play(player as ObjectReference, None, None)
    EndIf
    If shiftingObjectIsTrigger || shiftingObject == None
      shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
    Else
      shiftingActivatorRef.MoveTo(shiftingObject as ObjectReference, 0.0, 0.0, 0.0, True, False)
    EndIf
    shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done")
  EndIf
  Var[] akArgs = new Var[1]
  akArgs[0] = newUniverse as Var
  Self.CallFunctionNoWait("StopCombatOnShift", akArgs)
  Int offset = 0
  If currentUniverse == 1
    offset = NishinaOffset
  Else
    offset = -NishinaOffset
  EndIf
  If shiftingObject != None
    If shiftingObject.shouldForceFallback
      shouldForceFallback = True
      shiftToMarker = shiftingObject.GetLinkedRef(MQ207CLinkTarget)
    ElseIf shiftingObjectIsTrigger && !shiftingObject.IsInTrigger(player as ObjectReference)
      shouldForceFallback = True
    ElseIf !shiftingObjectIsTrigger && (player.GetDistance(shiftingObject as ObjectReference) > CONST_DistanceFromDistortionToForceFallback as Float)
      shouldForceFallback = True
    EndIf
  EndIf
  If shiftToMarker != None
    Game.PopPlayerTo(shiftToMarker, 0.0, 0.0, 0.0, True, False)
  ElseIf shouldForceFallback
    Self.PerformFallbackShift(shiftingObject as ObjectReference, offset)
  ElseIf omitFX
    Game.PopPlayerTo(player as ObjectReference, offset as Float, 0.0, 0.0, True, False)
  Else
    Bool popSuccessful = Game.PopPlayerTo(player as ObjectReference, offset as Float, 0.0, 0.0, True, useCollisionCheck)
    If !popSuccessful
      Self.PerformFallbackShift(shiftingObject as ObjectReference, offset)
    EndIf
  EndIf
  Int I = 0
  While I < ScenesToStopOnShift.Length
    ScenesToStopOnShift[I].Stop()
    I += 1
  EndWhile
  If shiftingObject != None && shiftingObject.StageToSetOnShift > 0
    Self.SetStage(shiftingObject.StageToSetOnShift)
  EndIf
  If additionalStageToSet > 0
    Self.SetStage(additionalStageToSet)
  EndIf
  If shiftingObjectIsTrigger
    selfAsQuestScript.UpdateGuidanceTriggerAV()
  EndIf
  selfAsQuestScript.SilenceNishina02AlarmsNoWait()
  selfAsQuestScript.Private_UpdateLabResearchLabStateOnShift(newUniverse)
  If !omitFX
    shiftingActivatorRef.PlayAnimation("Stop01")
  EndIf
EndFunction

Function PerformFallbackShift(ObjectReference shiftingObject, Int offset)
  If shiftingObject == None
    
  Else
    ObjectReference fallbackLink = shiftingObject.GetLinkedRef(MQ207CLinkTarget)
    If fallbackLink != None
      Game.PopPlayerTo(fallbackLink, 0.0, 0.0, 0.0, True, False)
    Else
      ObjectReference marker = shiftingObject.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True)
      marker.MoveTo(marker, offset as Float, 0.0, 0.0, True, False)
      marker.MoveToNearestNavmeshLocation()
      marker.SetAngle(0.0, 0.0, player.GetAngleZ())
      Game.PopPlayerTo(marker, 0.0, 0.0, 0.0, True, False)
      marker.Delete()
    EndIf
  EndIf
EndFunction

Function StopCombatOnShift(Int newUniverse)
  player.StopCombat()
  If player.GetParentCell() == LC116Nishina01
    If newUniverse == 1
      Nishina01_CreaturesAll_II.StopCombat()
    EndIf
  ElseIf newUniverse == 1
    Nishina02_CreaturesAll_II.StopCombat()
  Else
    Nishina02_SecurityCameras_I.StopCombat()
    Nishina02_RobotsAndTurrets_All_I.StopCombat()
  EndIf
EndFunction

Function PlaySpecialEndingFadeOut()
  shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
  shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done")
  WwiseEvent_QSTMQ207C_ShiftToA.Play(player as ObjectReference, None, None)
EndFunction

Function PlaySpecialEndingFadeIn()
  shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False)
  shiftingActivatorRef.PlayAnimation("Stop01")
EndFunction

Function EnableShiftingTriggers(Bool shouldBeEnabled)
  Int I = 0
  While I < shiftingTriggerRefs.Length
    If shouldBeEnabled
      shiftingTriggerRefs[I].EnableNoWait(False)
    Else
      shiftingTriggerRefs[I].DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function EnableDistortions(Bool shouldBeEnabled)
  Int I = 0
  While I < distortionRefs.Length
    If shouldBeEnabled
      distortionRefs[I].EnableNoWait(False)
    Else
      distortionRefs[I].DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetDistortionsActivationBlocked(Bool shouldBeActivationBlocked)
  Int I = 0
  While I < distortionRefs.Length
    distortionRefs[I].BlockActivation(shouldBeActivationBlocked, shouldBeActivationBlocked)
    If shouldBeActivationBlocked
      Self.UnregisterForRemoteEvent(distortionRefs[I] as ScriptObject, "OnActivate")
    Else
      Self.RegisterForRemoteEvent(distortionRefs[I] as ScriptObject, "OnActivate")
    EndIf
    I += 1
  EndWhile
EndFunction

Int Function GetCurrentUniverse()
  If player.GetPositionX() < NishinaIIx as Float
    Return 1
  Else
    Return 2
  EndIf
EndFunction

Function ClearVariables()
  shiftingActivatorRef = None
  shiftingTriggerRefs = None
  distortionRefs = None
EndFunction

;-- State -------------------------------------------
State ProcessingShift
EndState

;-- State -------------------------------------------
Auto State WaitingForShift

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GoToState("ProcessingShift")
    Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      mq207cshiftingobjectscript shiftingObject = akSource as mq207cshiftingobjectscript
      If shiftingObject != None && distortionRefs.find(shiftingObject as ObjectReference, 0) >= 0 && Self.ShouldPerformShift(akActivator, shiftingObject)
        Self.Private_Shift(shiftingObject, False, False, -1, None, True, False)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    Self.GoToState("WaitingForShift")
  EndEvent

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
    Self.GoToState("ProcessingShift")
    Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      mq207cshiftingobjectscript shiftingObject = akSource as mq207cshiftingobjectscript
      If shiftingObject != None && shiftingTriggerRefs.find(shiftingObject as ObjectReference, 0) >= 0 && Self.ShouldPerformShift(akTriggerRef, shiftingObject)
        Self.Private_Shift(shiftingObject, True, False, -1, None, True, False)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
    Self.GoToState("WaitingForShift")
  EndEvent
EndState
