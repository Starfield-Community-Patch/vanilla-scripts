ScriptName Fragments:Scenes:SF_MQ101_015_VascoTL_Trade_0011876E Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Vasco Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  Vasco.GetActorReference().OpenInventory(True, None, True)
EndFunction
