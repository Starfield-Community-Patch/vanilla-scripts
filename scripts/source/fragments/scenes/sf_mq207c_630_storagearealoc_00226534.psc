ScriptName Fragments:Scenes:SF_MQ207C_630_StorageAreaLoc_00226534 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnnouncementMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Alias_AnnouncementMarker.TryToMoveTo(Game.GetPlayer() as ObjectReference)
EndFunction
