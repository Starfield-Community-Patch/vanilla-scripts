ScriptName MQ204ArmillaryMountScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ00 Auto Const mandatory
Message Property ArmillaryNoArtifactsAddedMSG Auto Const mandatory
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const mandatory
Message Property MQBlockArmillaryShipScreenMSGBox Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryPlaceArtifact Auto Const mandatory

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  Actor PlayerREF = Game.GetPlayer()
  (Self.GetLinkedRef(None) as armillaryscript).BuildArmillary(PlayerREF, None)
  (MQ00 as mq00questscript).StartArmillaryTimer(Self.GetWorkshop())
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  Actor PlayerREF = Game.GetPlayer()
  (Self.GetLinkedRef(None) as armillaryscript).PackupArmillary(PlayerREF)
  (MQ00 as mq00questscript).StartArmillaryTimer(Self.GetWorkshop())
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerREF = Game.GetPlayer()
  ObjectReference ArmillaryMountOrScreenREF = MQ00_ArmillaryMountOrScreen.GetRef()
  If akActionRef == PlayerREF as ObjectReference
    If ArmillaryMountOrScreenREF != Self as ObjectReference
      MQBlockArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf PlayerREF.GetItemCount(ObjectTypeMQArtifact as Form) > 0
      WwiseEvent_AMBArtifactArmillaryPlaceArtifact.Play(Self as ObjectReference, None, None)
      armillaryscript ArmillaryREF = Self.GetLinkedRef(None) as armillaryscript
      ArmillaryREF.BuildArmillary(PlayerREF, Self as ObjectReference)
    Else
      ArmillaryNoArtifactsAddedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndEvent
