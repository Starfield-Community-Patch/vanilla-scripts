ScriptName Fragments:TopicInfos:TIF_SE_SD02_00132BA2 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property HailingShip Auto Const
ReferenceAlias Property PlayerShip Auto Const
ReferenceAlias Property EscortShip01 Auto Const
ReferenceAlias Property MinerShip01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  HailingShip.GetShipReference().StartCombat(PlayerShip.GetShipReference(), False)
  EscortShip01.GetShipReference().StartCombat(PlayerShip.GetShipReference(), False)
  MinerShip01.GetShipReference().StartCombat(PlayerShip.GetShipReference(), False)
EndFunction
