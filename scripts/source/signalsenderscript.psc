ScriptName SignalSenderScript Extends ObjectReference hidden
{ Sends signals to ObjectReferences with SignalReceiverScripts attached.

This script must be extended and call SendSignal from an event that should trigger the signal to be sent. }

;-- Structs -----------------------------------------
Struct ConditionReferences
  ObjectReference Subject
  ObjectReference Target
EndStruct

Struct SignalParameters
  ObjectReference Ref1
  ActorValue AV1
EndStruct

Struct SignalSignature
  SignalSenderScript SendingRef
  Keyword Signal
EndStruct

Struct SignalToSend
  Keyword Signal
  conditionform Conditions
  { optional: condition form that must be true before sending this signal.
See script level documentation text for details on what the Subject and Target refs will be for the condition form. }
EndStruct


;-- Variables ---------------------------------------
Int previousSignalIndex = -1

;-- Properties --------------------------------------
Group Signals
  Int Property ListTypeEnum = 0 Auto Const
  { 0 = Sequence (repeating)
1 = Stack [NOT IMPLEMENTED]
2 = Simultaneous [NOT IMPLEMENTED] }
  signalsenderscript:signaltosend[] Property SignalsToSend Auto Const mandatory
  { list of keywords (signals) and conditions (that must be true to send) }
  conditionform Property Conditions Auto Const
  { optional: condition form that must be true before attempting to send any signal.
See script level documentation text for details on what the Subject and Target refs will be for the condition form. }
EndGroup

Group ReceiverConnection collapsedonbase collapsedonref
{ Sends to linkedRef by default... for additional settings DOUBLE LEFT-CLICK! }
  Int Property ReceiverTypeEnum = 0 Auto Const
  { 0 = LinkedRef  (default)
 1 = LinkedRefChain
 2 = LinkedRefChildren
 3 = Self (send to object THIS script is attached to) 
 4 = Self *AND* LinkedRef }
  Keyword Property LinkedRefKeyword Auto Const
  { optional: keyword for defining which LinkedRef(Chain) or LinkedRefChildren to send signal to.
Meaningless if ReceiverTypeEnum == 3 (self) }
EndGroup

Int Property iReceiverType_LinkedRef = 0 AutoReadOnly
Int Property iReceiverType_LinkedRefChain = 1 AutoReadOnly
Int Property iReceiverType_LinkedRefChildren = 2 AutoReadOnly
Int Property iReceiverType_Self = 3 AutoReadOnly
Int Property iReceiverType_SelfAndLinkedRef = 4 AutoReadOnly
Int Property iListType_Sequence = 0 AutoReadOnly
Int Property iListType_Stack = 1 AutoReadOnly
Int Property iListType_Simultaneous = 2 AutoReadOnly

;-- Functions ---------------------------------------

Event OnInit()
  ; Empty function
EndEvent

Function SendSignal(signalsenderscript:signalparameters SignalParameters, signalsenderscript:conditionreferences ConditionReferences)
  If Conditions == None || Conditions.IsTrue(ConditionReferences.Subject, ConditionReferences.Target)
    signalsenderscript:signaltosend SignalToSend = SignalsToSend[Self.GetNextSignalIndex()]
    If SignalToSend.Conditions == None || SignalToSend.Conditions.IsTrue(ConditionReferences.Subject, ConditionReferences.Target)
      signalsenderscript:signalsignature SignalSignature = new signalsenderscript:signalsignature
      SignalSignature.SendingRef = Self
      SignalSignature.Signal = SignalToSend.Signal
      ObjectReference[] receiverRefs = Self.GetPossibleReceiverRefs()
      Int I = 0
      While I < receiverRefs.Length
        signalreceiverscript currentReceiverRef = receiverRefs[I] as signalreceiverscript
        If currentReceiverRef
          currentReceiverRef.ReceiveSignal(SignalSignature, SignalParameters)
        EndIf
        I += 1
      EndWhile
    EndIf
  EndIf
EndFunction

Int Function GetNextSignalIndex()
  Int iNext = 0
  If ListTypeEnum == Self.iListType_Sequence
    iNext = (previousSignalIndex + 1) % SignalsToSend.Length
  EndIf
  previousSignalIndex = iNext
  Return iNext
EndFunction

ObjectReference[] Function GetPossibleReceiverRefs()
  ObjectReference[] receiverRefs = None
  If ReceiverTypeEnum == Self.iReceiverType_LinkedRef
    receiverRefs = Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
  ElseIf ReceiverTypeEnum == Self.iReceiverType_LinkedRefChain
    receiverRefs = Self.GetLinkedRefChain(LinkedRefKeyword, 100)
  ElseIf ReceiverTypeEnum == Self.iReceiverType_LinkedRefChildren
    receiverRefs = Self.GetRefsLinkedToMe(LinkedRefKeyword, None)
  ElseIf ReceiverTypeEnum == Self.iReceiverType_Self
    receiverRefs = Self.GetSingleRefArray()
  ElseIf ReceiverTypeEnum == Self.iReceiverType_SelfAndLinkedRef
    receiverRefs = Self.GetSingleRefArray()
    receiverRefs.add(Self.GetLinkedRef(LinkedRefKeyword), 1)
  EndIf
  Return receiverRefs
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
