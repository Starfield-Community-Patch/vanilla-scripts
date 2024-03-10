ScriptName SQ_HoteliersQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PrimaryAliasHotelier Auto Const mandatory
RefCollectionAlias Property RentedBeds Auto Const mandatory
Int Property VisitRoomObjective = 1 Auto Const

;-- Functions ---------------------------------------

Function SetRoomPrices()
  sq_hoteliersactorscript hotelierActor = PrimaryAliasHotelier.GetActorReference() as sq_hoteliersactorscript
  hotelierActor.SetPrices()
EndFunction

Function RentedRoomDaily()
  sq_hoteliersactorscript hotelierActor = PrimaryAliasHotelier.GetActorReference() as sq_hoteliersactorscript
  hotelierActor.RentRoomDaily()
EndFunction

Function RentedRoomWeekly()
  sq_hoteliersactorscript hotelierActor = PrimaryAliasHotelier.GetActorReference() as sq_hoteliersactorscript
  hotelierActor.RentRoomWeekly()
EndFunction

Function UpdateBedsAliasAndObjective(ObjectReference BedRef, sq_hoteliersactorscript HotelierRef)
  If BedRef == None
    Return 
  EndIf
  If HotelierRef.IsRoomRented()
    RentedBeds.AddRef(BedRef)
    BedRef.SetActorOwner(Game.GetPlayer().GetBaseObject() as ActorBase, False)
    Self.SetObjectiveDisplayed(VisitRoomObjective, True, False)
  Else
    BedRef.SetActorOwner(HotelierRef.GetBaseObject() as ActorBase, False)
    RentedBeds.RemoveRef(BedRef)
    If RentedBeds.GetCount() == 0
      Self.SetObjectiveDisplayed(VisitRoomObjective, False, False)
    EndIf
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
