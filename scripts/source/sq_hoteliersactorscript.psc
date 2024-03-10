ScriptName SQ_HoteliersActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  Quest Property SQ_Hoteliers Auto Const mandatory
  { autofill }
  Keyword Property SQ_Hoteliers_Trigger_Link Auto Const mandatory
  { autofill; keyword that links Hotlier NPC to the room trigger. }
  Keyword Property SQ_Hoteliers_Door_Link Auto Const mandatory
  { autofill; keyword that links room trigger to the room door(s). }
  Keyword Property SQ_Hoteliers_Bed_Link Auto Const mandatory
  { autofill; keyword that links the room trigger to the bed(s). }
  GlobalVariable Property SQ_Hoteliers_RoomCost_Daily_TextReplacementValue Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue Auto Const mandatory
  { autofill }
  ActorValue Property SQ_Hoteliers_RoomExpiry Auto Const mandatory
  { autofill }
EndGroup

Group AutofillOrSetSpecifically
  GlobalVariable Property SQ_Hoteliers_RoomCost_Daily Auto Const mandatory
  { autofill for default, otherwise you can replace with your own global if you want a different cost - this is for a single day rental }
  GlobalVariable Property SQ_Hoteliers_RoomCost_Weekly Auto Const mandatory
  { autofill for default, otherwise you can replace with your own global if you want a different cost - this is for a weekly rental }
EndGroup


;-- Functions ---------------------------------------

Function SetPrices()
  SQ_Hoteliers_RoomCost_Daily_TextReplacementValue.SetValue(SQ_Hoteliers_RoomCost_Daily.GetValue())
  SQ_Hoteliers.UpdateCurrentInstanceGlobal(SQ_Hoteliers_RoomCost_Daily_TextReplacementValue)
  SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue.SetValue(SQ_Hoteliers_RoomCost_Weekly.GetValue())
  SQ_Hoteliers.UpdateCurrentInstanceGlobal(SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue)
EndFunction

Function RentRoomDaily()
  Self.RentRoom(SQ_Hoteliers_RoomCost_Daily, 1)
EndFunction

Function RentRoomWeekly()
  Self.RentRoom(SQ_Hoteliers_RoomCost_Weekly, 7)
EndFunction

Function RentRoom(GlobalVariable Cost, Int Days)
  sq_hoteliertriggerscript triggerRef = Self.GetLinkedRef(SQ_Hoteliers_Trigger_Link) as sq_hoteliertriggerscript
  Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, Cost.GetValueInt(), False, None)
  Float expiryDay = Utility.expiryDay(Days as Float, None, -1.0, Self.GetValue(SQ_Hoteliers_RoomExpiry))
  Self.SetValue(SQ_Hoteliers_RoomExpiry, expiryDay)
  triggerRef.Update()
  ObjectReference[] myDoorRefs = Self.GetLinkedRef(SQ_Hoteliers_Trigger_Link).GetLinkedRefChain(SQ_Hoteliers_Door_Link, 100)
  If myDoorRefs.Length > 1
    Self.CancelTimerGameTime(0)
    Float CurrentTime = Utility.GetCurrentGameTime()
    Float TimeRemaining = expiryDay - CurrentTime
    Self.StartTimerGameTime(Math.DaysAsHours(TimeRemaining), 0)
  EndIf
  If triggerRef != None
    ObjectReference myHotelierRef = Self as ObjectReference
    If triggerRef.GetParentCell() != myHotelierRef.GetParentCell()
      ObjectReference[] BedRefs = triggerRef.GetLinkedRefChain(SQ_Hoteliers_Bed_Link, 100)
      (SQ_Hoteliers as sq_hoteliersquestscript).UpdateBedsAliasAndObjective(BedRefs[0], myHotelierRef as SQ_HoteliersActorScript)
    EndIf
  EndIf
EndFunction

Bool Function IsRoomRented()
  Float AV = Self.GetValue(SQ_Hoteliers_RoomExpiry)
  Return AV > 0.0 && Utility.HasExpiryDayPassed(AV) == False
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If Self.IsRoomRented() == False
    sq_hoteliertriggerscript triggerRef = Self.GetLinkedRef(SQ_Hoteliers_Trigger_Link) as sq_hoteliertriggerscript
    triggerRef.Update()
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
