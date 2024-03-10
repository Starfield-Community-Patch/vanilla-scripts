ScriptName Fragments:Scenes:SF_TestPetrovScene_003625FD Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ArtifactHolder Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  ArtifactHolder.GetRef().PlayAnimation("TurnOn")
EndFunction
