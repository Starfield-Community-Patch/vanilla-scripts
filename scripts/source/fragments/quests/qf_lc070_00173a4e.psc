ScriptName Fragments:Quests:QF_LC070_00173A4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PowerCell Auto Const mandatory
ActorValue Property AmbushTriggered Auto Const
ReferenceAlias Property Alias_AmbushEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_LightEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_AmbushEnableMarker.getref().enable(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_LightEnableMarker.getref().enable(False)
EndFunction
