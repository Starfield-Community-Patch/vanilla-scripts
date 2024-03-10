ScriptName DialogueParadisoDirkRemoveDiscount Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Daily_Default Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly_Default Auto Const mandatory
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const mandatory
Quest Property MS06 Auto Const mandatory
Int Property MS06EndingCRewardStage = 3120 Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If PD_PlayerHasHotelRoomDiscount.GetValue() > 0.0
    PD_PlayerHasHotelRoomDiscount.SetValue(0.0)
    If !MS06.GetStageDone(MS06EndingCRewardStage)
      PD_Hotel_RoomCost_Daily.SetValue(PD_Hotel_RoomCost_Daily_Default.GetValue())
      PD_Hotel_RoomCost_Weekly.SetValue(PD_Hotel_RoomCost_Weekly_Default.GetValue())
    EndIf
  EndIf
EndEvent
