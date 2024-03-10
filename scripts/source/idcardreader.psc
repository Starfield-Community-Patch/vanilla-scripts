ScriptName IDCardReader Extends ObjectReference
{ Script for ID Card Readers }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RequiredProperties
  Key Property IDCard Auto Const
  { The ID Card required by this card reader. If not present, all activations will fail. }
EndGroup

Group OptionalProperties
  Bool Property ShouldAutoReset = False Auto Const
  { Default=False. If true, return to the Waiting state after a successful activation, instead of remaining in the Success state. }
  Bool Property ShouldDisplaySuccessMessage = False Auto Const
  { Default=False. If true, display IDCardReaderSuccessMessage when used successfully. }
  Quest Property QuestToCheck Auto Const
  { Default=None. If set, QuestToCheck's PrereqStage must be set in order for activation to succeed. }
  Int Property PrereqStage = -1 Auto Const
  { Default=-1. If set, QuestToCheck's PrereqStage must be set in order for activation to succeed. }
EndGroup

Group AutofillProperties collapsedonbase
  Keyword Property LinkIDReader Auto Const mandatory
  Message Property IDCardReaderSuccessMessage Auto Const mandatory
  Message Property IDCardReaderFailMissingCardMessage Auto Const mandatory
  Message Property IDCardReaderFailMissingPrereqMessage Auto Const mandatory
  Message Property IDCardReaderNotRespondingMessage Auto Const mandatory
EndGroup

Bool Property bDoorOpen Auto

;-- Functions ---------------------------------------

Function IDReaderOpenDoor(Bool shouldBeOpen)
  ObjectReference linkedRef = Self.GetLinkedRef(LinkIDReader)
  Int openState = linkedRef.GetOpenState()
  If openState == 1 || openState == 2
    linkedRef.SetOpen(False)
  ElseIf openState == 3 || openState == 4
    linkedRef.SetOpen(True)
  EndIf
  linkedRef.lock(!shouldBeOpen, False, True)
EndFunction

Function GotoSuccessState()
  Self.PlayAnimation("Play01")
  Self.IDReaderOpenDoor(True)
  Self.GotoState("SuccessIDReaderState")
EndFunction

Function ResetIDCardReader()
  Self.PlayAnimation("StateA_Idle")
  Self.IDReaderOpenDoor(False)
  Self.GotoState("IDReaderWaiting")
EndFunction

Function GotoWaitState()
  Self.GotoState("IDReaderWaiting")
EndFunction

Function GotoLockdownState()
  Self.PlayAnimation("StateC_Idle")
  Self.GotoState("LockdownIDReaderState")
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State IDReaderWaiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy")
    Var[] kargs = new Var[1]
    kargs[0] = akActionRef as Var
    Self.SendCustomEvent("idcardreader_IDReaderActivated", kargs)
    If IDCard == None || akActionRef.GetItemCount(IDCard as Form) == 0
      Self.SendCustomEvent("idcardreader_IDReaderActivatedFailure", kargs)
      If IDCardReaderFailMissingCardMessage != None
        Self.PlayAnimation("StateD_Play")
        If akActionRef == Game.getplayer() as ObjectReference
          IDCardReaderFailMissingCardMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        EndIf
      EndIf
      Self.GotoState("IDReaderWaiting")
    ElseIf QuestToCheck != None && PrereqStage >= 0 && !QuestToCheck.GetStageDone(PrereqStage)
      Self.SendCustomEvent("idcardreader_IDReaderActivatedFailure", kargs)
      If IDCardReaderFailMissingPrereqMessage != None && (akActionRef == Game.getplayer() as ObjectReference)
        IDCardReaderFailMissingPrereqMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      Self.GotoState("IDReaderWaiting")
    Else
      Self.SendCustomEvent("idcardreader_IDReaderActivatedSuccess", kargs)
      Self.PlayAnimationAndWait("Play01", "Done")
      If ShouldDisplaySuccessMessage && IDCardReaderSuccessMessage != None && (akActionRef == Game.getplayer() as ObjectReference)
        IDCardReaderSuccessMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      If ShouldAutoReset
        Self.GotoState("IDReaderWaiting")
      Else
        Self.GotoState("SuccessIDReaderState")
      EndIf
      Self.IDReaderOpenDoor(True)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State LockdownIDReaderState

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy")
    If IDCardReaderNotRespondingMessage != None
      Self.PlayAnimationAndWait("Play04", "Done")
      If akActionRef == Game.getplayer() as ObjectReference
        IDCardReaderNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    EndIf
    Self.GotoState("LockdownIDReaderState")
  EndEvent
EndState

;-- State -------------------------------------------
State SuccessIDReaderState

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForInit

  Event OnLoad()
    Self.BlockActivation(True, False)
    Self.GotoState("IDReaderWaiting")
  EndEvent
EndState
