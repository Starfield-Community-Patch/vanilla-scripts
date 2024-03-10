ScriptName Fragments:TopicInfos:TIF_SE_JP01_00134BDB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property HailingShip Auto Const
ReferenceAlias Property Attacking Auto Const
ReferenceAlias Property AttackingShip01 Auto Const
ReferenceAlias Property AttackingShip02 Auto Const
ReferenceAlias Property playerShip Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Self.GetOwningQuest().SetStage(200)
  AttackingShip01.GetShipReference().EnableWithGravJump()
  AttackingShip01.GetShipReference().StartCombat(playerShip.GetShipReference(), False)
  AttackingShip02.GetShipReference().EnableWithGravJump()
  AttackingShip02.GetShipReference().StartCombat(playerShip.GetShipReference(), False)
EndFunction
