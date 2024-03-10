ScriptName Fragments:Scenes:SF_MQ202_006_PetrovEscortSce_002C79B7 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArtifactHolder Auto Const
ReferenceAlias Property Alias_CaptainPetrov Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_08_End()
  Alias_ArtifactHolder.GetRef().PlayAnimation("TurnOff")
EndFunction
