ScriptName Fragments:Scenes:SF_MQ207C_620_AcceleratorAre_00226535 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnnouncementMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Alias_AnnouncementMarker.TryToMoveTo(Game.GetPlayer() as ObjectReference)
EndFunction
