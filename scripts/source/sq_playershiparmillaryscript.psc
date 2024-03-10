ScriptName SQ_PlayerShipArmillaryScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
Message Property MQAddArtifactEnterShipMSG Auto Const mandatory
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory
GlobalVariable Property MQAllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property MQ00_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If MQAllowArmillaryGravDrive.GetValueInt() >= 1
    Actor PlayerREF = Game.GetPlayer()
    If abRemove == True
      (akObject as armillaryscript).PackupArmillary(PlayerREF)
      akObject.Disable(False)
    EndIf
  EndIf
EndEvent
