ScriptName LC088_Key_RestrainingRefScript Extends ObjectReference
{ In LC088_Key, script for objects that are restraining actors. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LC088_Key_LinkRestraintKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function ReleaseRestraint()
  ; Empty function
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.ReleaseRestraint()
  EndEvent

  Event OnOpen(ObjectReference akActionRef)
    Self.ReleaseRestraint()
  EndEvent

  Function ReleaseRestraint()
    Self.GoToState("Done")
    ObjectReference[] restrainedRefs = Self.GetRefsLinkedToMe(LC088_Key_LinkRestraintKeyword, None)
    Int I = 0
    While I < restrainedRefs.Length
      Actor currentActor = restrainedRefs[I] as Actor
      LC088_Key_RestrainingRefScript currentRestrainingRef = restrainedRefs[I] as LC088_Key_RestrainingRefScript
      If currentActor != None
        currentActor.SetLinkedRef(None, LC088_Key_LinkRestraintKeyword, True)
        currentActor.EvaluatePackage(False)
      ElseIf currentRestrainingRef != None
        currentRestrainingRef.ReleaseRestraint()
      EndIf
      I += 1
    EndWhile
  EndFunction

  Event OnTriggerEnter(ObjectReference akTriggerRef)
    Self.ReleaseRestraint()
  EndEvent
EndState
