ScriptName Fragments:Scenes:SF_MQ101_001b_MiningWalkScen_00017F63 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Heller Auto Const
Keyword Property AnimFlavorTechReader Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  Heller.GetActorRef().AddKeyword(AnimFlavorTechReader)
EndFunction
