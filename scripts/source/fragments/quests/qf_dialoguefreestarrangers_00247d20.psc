ScriptName Fragments:Quests:QF_DialogueFreestarRangers_00247D20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueFreestarRangers_MaryHelgaIntroScene Auto Const mandatory
Scene Property DialogueFreestarRangers_AugustEmmaScene Auto Const mandatory
ReferenceAlias Property Alias_HelgaDubray Auto Const mandatory
ReferenceAlias Property Alias_MaryCartwright Auto Const mandatory
ReferenceAlias Property Alias_FreestarMechFactoryMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Alias_FreestarMechFactoryMapMarker.GetReference().Disable(False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  DialogueFreestarRangers_MaryHelgaIntroScene.Start()
EndFunction

Function Fragment_Stage_1150_Item_00()
  Alias_HelgaDubray.GetActorRef().EvaluatePackage(False)
  Alias_MaryCartwright.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  DialogueFreestarRangers_AugustEmmaScene.Start()
EndFunction
