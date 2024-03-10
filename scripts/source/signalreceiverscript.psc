ScriptName SignalReceiverScript Extends ObjectReference
{ Receives signal(s) from one or more ObjectReferences with a SignalSenderScript attached }

;-- Structs -----------------------------------------
Struct Result
  Keyword Signal
  { Result fires on this Signal }
  Int ResultTypeEnum
  { 0 = Custom
1 = Rename Object
2 = Set ActorValue
3 = Damage ActorValue [NOT IMPLMENTED]
4 = Restore ActorValue [NOT IMPLMENTED]
5 = Increment/Decrement ActorValue ( positive ADDs to if negative SUBTRACTs from current value and then Sets the value to that) [NOT IMPLMENTED]
6 = Enable
7 = Disable
8 = Toggle Enable/Disable State
9 = PlaceAtMe (places at TargetRef)
10 = PlaceActorAtMe (places at TargetRef)
11 = Show Message }
  Form FormParam1
  { Depending on ResultType this param is expected to be a particular type.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): Message that contains the new name
2-5 (change AV): ActorValue to change
6-8 (enable/disable): N/A
9-10 (place at me): The thing to place (Leveled List, BaseObject, BaseActor, etc.)
11 (show message): the message to show }
  Float ValueParam1
  { Depending on ResultType this param is will mean a particular thing.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): N/A
2 (set av): The new value for the AV
3 (dmg av): The amount to damage the AV by
4 (restore av): The about to restore the AV by
5 (inc/dec av): The amount to add to the AV (to decrement use a negatve value)
6-8 (enable/disable): N/A
9 (place at me): count of things to place
10 (place actor me): encounter level of actor to place
11 (show message): N/A }
  GlobalVariable GlobalParam1
  { Depending on ResultType this param is will mean a particular thing.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): N/A
2 (set av): The new value for the AV [OVERRIDES ValueParm1]
3 (dmg av): The amount to damage the AV by [OVERRIDES ValueParm1]
4 (restore av): The about to restore the AV by [OVERRIDES ValueParm1]
5 (inc/dec av): The amount to add to the AV (to decrement use a negatve value) [OVERRIDES ValueParm1]
6-8 (enable/disable): N/A
9-10 (place at me): N/A
11 (show message): N/A }
  Int TargetRefEnum = 0
  { Thing to do the result on:
0 = self
1 = linkedRef
2 = linkedRefChain
3 = linkedRefChildren (things linkedref to self) }
  Keyword LinkedRefKeyword
  { Optional: the keyword used when getting TargetRefs if TargetRefEnum is a LinkedRef type }
  conditionform Conditions
  { Optional: Conditions that must be true for Result to fire when receiving the Signal.
RunOn SUBJECT will be THIS reference (the object this script is attached to)
RunOn TARGET will be the TargetRef(s) as described by TargetRefEnum }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Results
  signalreceiverscript:result[] Property Results Auto Const
  { All standard results will fire for matching signals
	This may change as the script develops further }
EndGroup

Int Property iResultType_Custom = 0 AutoReadOnly
Int Property iResultType_Rename = 1 AutoReadOnly
Int Property iResultType_SetAV = 2 AutoReadOnly
Int Property iResultType_DamageAV = 3 AutoReadOnly
Int Property iResultType_RestoreAV = 4 AutoReadOnly
Int Property iResultType_IncrementDecrementAV = 5 AutoReadOnly
Int Property iResultType_Enable = 6 AutoReadOnly
Int Property iResultType_Disable = 7 AutoReadOnly
Int Property iResultType_ToggleEnableState = 8 AutoReadOnly
Int Property iResultType_PlaceAtMe = 9 AutoReadOnly
Int Property iResultType_PlaceActorAtMe = 10 AutoReadOnly
Int Property iResultType_ShowMessage = 11 AutoReadOnly
Int Property iTargetRef_Self = 0 AutoReadOnly
Int Property iTargetRef_LinkedRef = 1 AutoReadOnly
Int Property iTargetRef_LinkedRefChain = 2 AutoReadOnly
Int Property iTargetRef_LinkedRefChildren = 3 AutoReadOnly

;-- Functions ---------------------------------------

Function HandleCustomResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  ; Empty function
EndFunction

Function ReceiveSignalCustom(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  ; Empty function
EndFunction

Function ReceiveSignal(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Self.HandleResults(SignalSignature, SignalParameters)
  Self.ReceiveSignalCustom(SignalSignature, SignalParameters)
EndFunction

ObjectReference[] Function GetValidTargetRefs(signalreceiverscript:result Result)
  ObjectReference[] targetRefs = None
  If Result.TargetRefEnum == Self.iTargetRef_Self
    targetRefs = Self.GetSingleRefArray()
  ElseIf Result.TargetRefEnum == Self.iTargetRef_LinkedRef
    targetRefs = Self.GetLinkedRef(Result.LinkedRefKeyword).GetSingleRefArray()
  ElseIf Result.TargetRefEnum == Self.iTargetRef_LinkedRefChain
    targetRefs = Self.GetLinkedRefChain(Result.LinkedRefKeyword, 100)
  ElseIf Result.TargetRefEnum == Self.iTargetRef_LinkedRefChildren
    targetRefs = Self.GetRefsLinkedToMe(Result.LinkedRefKeyword, None)
  EndIf
  Int I = targetRefs.Length
  While I >= 0
    ObjectReference currentRef = targetRefs[I]
    If Result.Conditions as Bool && Result.Conditions.IsTrue(Self as ObjectReference, currentRef) == False
      targetRefs.remove(I, 1)
    EndIf
    I -= 1
  EndWhile
  Return targetRefs
EndFunction

Bool Function IsChangeAVResultType(Int ResultTypeEnum)
  Return ResultTypeEnum == Self.iResultType_SetAV || ResultTypeEnum == Self.iResultType_DamageAV || ResultTypeEnum == Self.iResultType_RestoreAV || ResultTypeEnum == Self.iResultType_IncrementDecrementAV
EndFunction

Bool Function IsChangeEnableStateResultType(Int ResultTypeEnum)
  Return ResultTypeEnum == Self.iResultType_Enable || ResultTypeEnum == Self.iResultType_Disable || ResultTypeEnum == Self.iResultType_ToggleEnableState
EndFunction

Function HandleResults(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  signalreceiverscript:result[] matchingResults = Results.GetMatchingStructs("Signal", SignalSignature.Signal, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
  Int I = 0
  While I < matchingResults.Length
    signalreceiverscript:result currentResult = matchingResults[I]
    ObjectReference[] ValidTargetRefs = Self.GetValidTargetRefs(currentResult)
    If currentResult.ResultTypeEnum == Self.iResultType_Custom
      Self.HandleCustomResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters)
    ElseIf currentResult.ResultTypeEnum == Self.iResultType_Rename
      Self.HandleRenameResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters)
    ElseIf Self.IsChangeAVResultType(currentResult.ResultTypeEnum)
      Self.HandleChangeAVResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters)
    ElseIf Self.IsChangeEnableStateResultType(currentResult.ResultTypeEnum)
      Self.HandleEnableOrDisableResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters)
    ElseIf currentResult.ResultTypeEnum == Self.iResultType_PlaceAtMe || currentResult.ResultTypeEnum == Self.iResultType_PlaceActorAtMe
      Self.HandlePlaceAtMeResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters)
    ElseIf currentResult.ResultTypeEnum == Self.iResultType_ShowMessage
      Self.HandleShowMessageResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters)
    EndIf
    I += 1
  EndWhile
EndFunction

Function HandleRenameResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Message newNameMsg = Result.FormParam1 as Message
  Int I = 0
  While I < ValidTargetRefs.Length
    ObjectReference currentTargetRef = ValidTargetRefs[I]
    currentTargetRef.SetOverrideName(newNameMsg)
    I += 1
  EndWhile
EndFunction

Function HandleChangeAVResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  ActorValue AV = Result.FormParam1 as ActorValue
  Float changeValue = 0.0
  If Result.GlobalParam1
    changeValue = Result.GlobalParam1.GetValue()
  Else
    changeValue = Result.ValueParam1
  EndIf
  Int I = 0
  While I < ValidTargetRefs.Length
    ObjectReference currentTargetRef = ValidTargetRefs[I]
    Float oldValue = currentTargetRef.GetValue(AV)
    Float newValue = changeValue
    If Result.ResultTypeEnum == Self.iResultType_IncrementDecrementAV
      newValue = oldValue + changeValue
    EndIf
    If Result.ResultTypeEnum == Self.iResultType_SetAV || Result.ResultTypeEnum == Self.iResultType_IncrementDecrementAV
      currentTargetRef.SetValue(AV, newValue)
    ElseIf Result.ResultTypeEnum == Self.iResultType_DamageAV
      currentTargetRef.DamageValue(AV, newValue)
    ElseIf Result.ResultTypeEnum == Self.iResultType_RestoreAV
      currentTargetRef.RestoreValue(AV, newValue)
    EndIf
    I += 1
  EndWhile
EndFunction

Function HandleEnableOrDisableResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Int I = 0
  While I < ValidTargetRefs.Length
    ObjectReference currentTargetRef = ValidTargetRefs[I]
    Bool shouldEnable = False
    If Result.ResultTypeEnum == Self.iResultType_Enable
      shouldEnable = True
    ElseIf Result.ResultTypeEnum == Self.iResultType_Disable
      shouldEnable = False
    ElseIf Result.ResultTypeEnum == Self.iResultType_ToggleEnableState
      shouldEnable = !currentTargetRef.IsEnabled()
    EndIf
    If shouldEnable
      currentTargetRef.EnableNoWait(False)
    Else
      currentTargetRef.DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function HandlePlaceAtMeResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Int I = 0
  While I < ValidTargetRefs.Length
    ObjectReference currentTargetRef = ValidTargetRefs[I]
    If Result.ResultTypeEnum == Self.iResultType_PlaceAtMe
      Int count = Math.max(Result.ValueParam1, 1.0) as Int
      ObjectReference placedRef = currentTargetRef.PlaceAtMe(Result.FormParam1, count, False, False, True, None, None, True)
    ElseIf Result.ResultTypeEnum == Self.iResultType_PlaceActorAtMe
      ObjectReference placedref = currentTargetRef.PlaceActorAtMe(Result.FormParam1 as ActorBase, Result.ValueParam1 as Int, None, False, False, True, None, True) as ObjectReference
    EndIf
    I += 1
  EndWhile
EndFunction

Function HandleShowMessageResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Int I = 0
  While I < ValidTargetRefs.Length
    ObjectReference currentTargetRef = ValidTargetRefs[I]
    (Result.FormParam1 as Message).Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
