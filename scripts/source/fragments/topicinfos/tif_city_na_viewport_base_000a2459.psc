ScriptName Fragments:TopicInfos:TIF_City_NA_Viewport_Base_000A2459 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Drink_BarRestaurant_Upscale_75 Auto Const mandatory
Quest Property City_NA_Viewport01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().AddItem(LL_Drink_BarRestaurant_Upscale_75 as Form, 1, False)
EndFunction
