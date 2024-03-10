ScriptName Fragments:TopicInfos:TIF_SE_AC01_EliteCrewEncount_00043468 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property ShipRepairKit Auto Const
Quest Property thisQuest Auto Const
Quest Property BettyECQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None)
EndFunction
