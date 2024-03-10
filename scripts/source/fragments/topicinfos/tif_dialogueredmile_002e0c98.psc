ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002E0C98 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Drink_Alcohol_Any Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().AddItem(LL_Drink_Alcohol_Any as Form, 1, False)
EndFunction
