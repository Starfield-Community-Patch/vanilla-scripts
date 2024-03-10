ScriptName SQ_Airlock_DoorwayVolumeScript Extends ObjectReference Const
{ script attached to trigger volume placed between airlock doors which it is linkedref to,
and watches for states of to add/remove actors to a refcollection managing their "inside" state }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_airlock_questscript Property SQ_Airlock Auto Const mandatory
  Keyword Property SQ_Airlock_Link_Door_Inside Auto Const mandatory
  Keyword Property SQ_Airlock_Link_Door_Outside Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference InsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Inside)
  ObjectReference OutsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Outside)
  Self.RegisterForRemoteEvent(InsideDoor as ScriptObject, "OnClose")
  Self.RegisterForRemoteEvent(OutsideDoor as ScriptObject, "OnClose")
  OutsideDoor.SetOpen(False)
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
  Actor[] actorsInTrigger = Self.GetAllRefsInTrigger() as Actor[]
  ObjectReference InsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Inside)
  ObjectReference OutsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Outside)
  If akSender == OutsideDoor
    SQ_Airlock.SetActorsInside(actorsInTrigger, True)
  ElseIf akSender == InsideDoor
    SQ_Airlock.SetActorsInside(actorsInTrigger, False)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
