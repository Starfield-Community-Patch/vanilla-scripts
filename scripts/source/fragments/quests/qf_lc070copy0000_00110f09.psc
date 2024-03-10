ScriptName Fragments:Quests:QF_LC070COPY0000_00110F09 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PowerCell Auto Const mandatory
ActorValue Property AmbushTriggered Auto Const
ReferenceAlias Property Alias_AmbushEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_PowerCell.getref().ModValue(AmbushTriggered, 1.0)
  Alias_AmbushEnableMarker.getref().enable(False)
EndFunction
