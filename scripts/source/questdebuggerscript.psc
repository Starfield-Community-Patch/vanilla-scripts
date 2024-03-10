ScriptName QuestDebuggerScript Extends Quest
{ You can call the following on this Quest:
Function SetDebugStage(int DebugStage, bool FastFowarding = false)
Function SetActorValueOnPlayer(ActorValue ActorValueToSet, float ValueToSetTo)
Function MoveToDebugStageMarker(int DebugStage)
Function MoveToLatestDebugStageMarker()
Function MoveToNextDebugStageMarker()

In server console like:
CQF <QuestEditorID> FunctionName Param1 Param2 etc. }

;-- Structs -----------------------------------------
Struct DebugStageDatum
  Int Stage
  Bool TriggerOnStandardStageSet = False
  { IDefault: False. If true, setting the actual quest stage will also cause this DebugStage to trigger.
	Use this for stages that are only ever "Debug stages" and not "real" stages }
  ObjectReference RefToMoveTo
  { reference to move player to }
  ReferenceAlias RefAliasToMoveTo
  { if RefToMoveTo is none, it will try to move the player to this RefAlias }
  ReferenceAlias RefAliasToKill
  { kill this ReferenceAlias }
  RefCollectionAlias RefColToKill
  { kills everything in this refcol to the player }
  Form FormToAdd
  { add this for to player }
  ReferenceAlias AliasRefToAdd1
  { add this reference to the player }
  ReferenceAlias AliasRefToAdd2
  { add this reference to the player }
  RefCollectionAlias RefColToAdd
  { adds everything in this refcol to the player }
  ActorValue ActorValueToSet
  { set this actorvalue on player }
  Float ValueToSetTo
  { set actor value to this value }
  Scene SceneToStopWhenFastForwarding
  { stop scene instances of this scene when fast forwarding THROUGH this stage }
  Bool SetStageOnFastForward = True
  { if true (default), if fastforwarding past this stage, do this along the way }
  Bool RefToMoveToOnFastForward = False
  { if true, if fastforwarding past this stage, do this along the way }
  Bool RefToKillOnFastForward = False
  { if true, if fastforwarding past this stage, do this along the way }
  Bool AddToPlayerOnFastForward = True
  { if true (default), if fastforwarding past this stage, do this along the way }
  Bool SetActorValueOnFastForward = True
  { if true (default), if fastforwarding past this stage, do this along the way }
EndStruct


;-- Variables ---------------------------------------
Actor PlayerRef

;-- Properties --------------------------------------
questdebuggerscript:debugstagedatum[] Property DebugStageData Auto Const mandatory
{ THESE MUST BE DEFINED IN SEQUENTIAL ORDER }

;-- Functions ---------------------------------------

Event OnQuestInit()
  PlayerRef = Game.GetPlayer()
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  questdebuggerscript:debugstagedatum[] matchingDebugStages = DebugStageData.GetMatchingStructs("Stage", auiStageID, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
  Int I = 0
  While I < matchingDebugStages.Length
    questdebuggerscript:debugstagedatum currentDebugStageDatum = matchingDebugStages[I]
    If currentDebugStageDatum.TriggerOnStandardStageSet
      Self._SetDebugStageDatum(currentDebugStageDatum, False)
    EndIf
    I += 1
  EndWhile
EndEvent

Function SetDebugStage(Int DebugStage, Bool FastFowarding)
  Bool SetSpecifiedStage = False
  If FastFowarding == False
    questdebuggerscript:debugstagedatum foundDatum = Self._GetDebugStageDatum(DebugStage)
    If foundDatum
      Self._SetDebugStageDatum(foundDatum, False)
      SetSpecifiedStage = True
    EndIf
  Else
    Int I = 0
    While I < DebugStageData.Length && DebugStageData[I].Stage <= DebugStage
      If DebugStageData[I].Stage == DebugStage
        Self._SetDebugStageDatum(DebugStageData[I], False)
        SetSpecifiedStage = True
      Else
        Self._SetDebugStageDatum(DebugStageData[I], True)
      EndIf
      I += 1
    EndWhile
  EndIf
  If SetSpecifiedStage == False
    Self.SetStage(DebugStage)
  EndIf
EndFunction

Function _SetDebugStageDatum(questdebuggerscript:debugstagedatum DebugStageDatumToSet, Bool FastFowardedThru)
  If FastFowardedThru == False || DebugStageDatumToSet.SetStageOnFastForward
    Self.SetStage(DebugStageDatumToSet.Stage)
  EndIf
  If FastFowardedThru == False || DebugStageDatumToSet.RefToMoveToOnFastForward
    If DebugStageDatumToSet.RefToMoveTo
      PlayerRef.MoveTo(DebugStageDatumToSet.RefToMoveTo, 0.0, 0.0, 0.0, True, False)
    ElseIf DebugStageDatumToSet.RefAliasToMoveTo
      PlayerRef.MoveTo(DebugStageDatumToSet.RefAliasToMoveTo.GetReference(), 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
  If FastFowardedThru == False || DebugStageDatumToSet.RefToKillOnFastForward
    If DebugStageDatumToSet.RefAliasToKill
      DebugStageDatumToSet.RefAliasToKill.TryToKill(None)
    EndIf
    If DebugStageDatumToSet.RefColToKill.GetCount() > 0
      DebugStageDatumToSet.RefColToKill.KillAll(None)
    EndIf
  EndIf
  If FastFowardedThru == False || DebugStageDatumToSet.AddToPlayerOnFastForward
    If DebugStageDatumToSet.FormToAdd
      PlayerRef.AddItem(DebugStageDatumToSet.FormToAdd, 1, False)
    EndIf
    If DebugStageDatumToSet.AliasRefToAdd1
      Self.AddRefAliasToPlayer(DebugStageDatumToSet.AliasRefToAdd1)
    EndIf
    If DebugStageDatumToSet.AliasRefToAdd2
      Self.AddRefAliasToPlayer(DebugStageDatumToSet.AliasRefToAdd2)
    EndIf
    If DebugStageDatumToSet.RefColToAdd
      ObjectReference[] itemsToAdd = DebugStageDatumToSet.RefColToAdd.GetArray()
      Int I = 0
      While I < itemsToAdd.Length
        PlayerRef.AddItem(itemsToAdd[I] as Form, 1, False)
        I += 1
      EndWhile
    EndIf
  EndIf
  If FastFowardedThru == False || DebugStageDatumToSet.SetActorValueOnFastForward
    If DebugStageDatumToSet.ActorValueToSet
      PlayerRef.SetValue(DebugStageDatumToSet.ActorValueToSet, DebugStageDatumToSet.ValueToSetTo)
    EndIf
  EndIf
  If FastFowardedThru && DebugStageDatumToSet.SceneToStopWhenFastForwarding as Bool
    DebugStageDatumToSet.SceneToStopWhenFastForwarding.Stop()
  EndIf
EndFunction

Int Function GetNextDebugStage()
  questdebuggerscript:debugstagedatum nextDatum = Self._GetNextDebugStageDatum()
  If nextDatum
    Return nextDatum.Stage
  Else
    Return -1
  EndIf
EndFunction

questdebuggerscript:debugstagedatum Function _GetDebugStageDatum(Int StageToFind)
  Int iFound = DebugStageData.findstruct("Stage", StageToFind, 0)
  If iFound > -1
    Return DebugStageData[iFound]
  EndIf
  Return None
EndFunction

questdebuggerscript:debugstagedatum Function _GetLatestDebugStageDatum()
  questdebuggerscript:debugstagedatum latestDatum = None
  Int I = Self._GetLatestDebugStageDatumIndex()
  If I > -1
    latestDatum = DebugStageData[I]
  EndIf
  Return latestDatum
EndFunction

Int Function _GetLatestDebugStageDatumIndex()
  Int index = -1
  Int I = 0
  While I < DebugStageData.Length
    If Self.GetStageDone(DebugStageData[I].Stage)
      index = I
      I = DebugStageData.Length
    EndIf
    I += 1
  EndWhile
  Return index
EndFunction

questdebuggerscript:debugstagedatum Function _GetNextDebugStageDatum()
  Int iLatest = Self._GetLatestDebugStageDatumIndex()
  Int iNext = 0
  If iLatest > -1
    iNext = iLatest + 1
  Else
    iNext = 0
  EndIf
  If iNext <= DebugStageData.Length
    Return DebugStageData[iNext]
  EndIf
  Return None
EndFunction

Function MoveToDebugStageMarker(Int DebugStage)
  questdebuggerscript:debugstagedatum datumToUse = Self._GetDebugStageDatum(DebugStage)
  Self._MoveToDatumRefToMoveTo(datumToUse)
EndFunction

Function MoveToLatestDebugStageMarker()
  questdebuggerscript:debugstagedatum datumToUse = Self._GetLatestDebugStageDatum()
  Self._MoveToDatumRefToMoveTo(datumToUse)
EndFunction

Function MoveToNextDebugStageMarker()
  questdebuggerscript:debugstagedatum datumToUse = Self._GetNextDebugStageDatum()
  Self._MoveToDatumRefToMoveTo(datumToUse)
EndFunction

Function _MoveToDatumRefToMoveTo(questdebuggerscript:debugstagedatum datumToUse)
  ObjectReference RefToMoveTo = None
  If datumToUse
    If datumToUse.RefToMoveTo
      RefToMoveTo = datumToUse.RefToMoveTo
    ElseIf datumToUse.RefAliasToMoveTo
      RefToMoveTo = datumToUse.RefAliasToMoveTo.GetReference()
    EndIf
    If RefToMoveTo
      PlayerRef.MoveTo(RefToMoveTo, 0.0, 0.0, 0.0, True, False)
    ElseIf RefToMoveTo
      PlayerRef.MoveTo(RefToMoveTo, 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndFunction

Function AddRefAliasToPlayer(ReferenceAlias AliasRefToAdd)
  ObjectReference refToAdd = AliasRefToAdd.GetReference()
  PlayerRef.AddItem(refToAdd as Form, 1, False)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String DejaSubChannel, Bool bShowNormalTrace)
  Return Debug.TraceLog(CallingObject, asTextToPrint, "default", DejaSubChannel, aiSeverity, bShowNormalTrace, False, False, True)
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String DejaSubChannel, Bool bShowNormalTrace)
  Game.warning(CallingObject as String + asTextToPrint)
EndFunction
