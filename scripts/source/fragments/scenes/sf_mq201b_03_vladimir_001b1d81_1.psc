ScriptName Fragments:Scenes:SF_MQ201B_03_Vladimir_001B1D81_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
Idle Property IdleAnimObjUnequipAll Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  MQ00_CompanionAtEye.GetActorRef().PlayIdle(IdleAnimObjUnequipAll)
EndFunction
