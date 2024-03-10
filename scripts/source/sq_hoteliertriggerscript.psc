ScriptName SQ_HotelierTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Float TimerDur = 3.0 Const

;-- Properties --------------------------------------
sq_hoteliersquestscript Property SQ_Hoteliers Auto Const mandatory
{ autofill }
Keyword Property SQ_Hoteliers_Bed_Link Auto Const mandatory
{ autofill; linkref type that links this room trigger volume to the bed. }
Keyword Property SQ_Hoteliers_Door_Link Auto Const mandatory
{ autofill; linkref type that links this room trigger volume to the door. }
Keyword Property SQ_Hoteliers_Trigger_Link Auto Const mandatory
{ autofill; keyword that links Hotelier NPC to the room trigger. }

;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  Self._SetDoorState()
EndEvent

Event OnLoad()
  Self.Update()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.Update()
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  Self.Update()
EndEvent

Function Update()
  Self.StartTimer(TimerDur, 0)
EndFunction

sq_hoteliersactorscript Function GetHotelierNPC()
  Return Self.GetRefsLinkedToMe(SQ_Hoteliers_Trigger_Link, None)[0] as sq_hoteliersactorscript
EndFunction

Function _SetDoorState()
  sq_hoteliersactorscript hotelierRef = Self.GetHotelierNPC()
  ObjectReference[] doorRefs = Self.GetLinkedRefChain(SQ_Hoteliers_Door_Link, 100)
  If hotelierRef == None
    Return 
  EndIf
  If doorRefs == None
    Return 
  EndIf
  Bool isRoomRented = hotelierRef.isRoomRented()
  Int countInTrigger = Self.GetTriggerObjectCount()
  Int I = 0
  Int iLength = doorRefs.Length
  If isRoomRented == True || countInTrigger > 0
    While I < iLength
      doorRefs[I].Unlock(False)
      I += 1
    EndWhile
  Else
    While I < iLength
      doorRefs[I].SetOpen(False)
      doorRefs[I].SetLockLevel(255)
      doorRefs[I].Lock(True, False, True)
      I += 1
    EndWhile
  EndIf
  ObjectReference bedRef = Self.GetLinkedRef(SQ_Hoteliers_Bed_Link)
  SQ_Hoteliers.UpdateBedsAliasAndObjective(bedRef, hotelierRef)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
