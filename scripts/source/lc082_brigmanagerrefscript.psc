ScriptName LC082_BrigManagerRefScript Extends ObjectReference
{ Script for the LC082 Brig Manager ref. Initializes the Brig when its cell loads for the first time. }

;-- Variables ---------------------------------------
Bool initialized

;-- Properties --------------------------------------
Group AutofillProperties
  lc082_brigquestscript Property LC082 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Bool Function HasInitilized()
  Return initialized
EndFunction

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellLoad()
    Self.GoToState("initialized")
    initialized = True
    LC082.InitBrig()
  EndEvent
EndState

;-- State -------------------------------------------
State initialized
EndState
