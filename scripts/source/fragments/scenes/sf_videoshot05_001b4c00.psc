ScriptName Fragments:Scenes:SF_VideoShot05_001B4C00 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const
ReferenceAlias Property VideoActorRefAlias Auto Const
Armor Property Spacesuit_Constellation_Backpack Auto Const mandatory
Weapon Property Grendel Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoDoor.GetRef().SetOpen(False)
  VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack as Form, False, False)
  VideoActorRefAlias.GetActorRef().UnEquipItem(Grendel as Form, False, False)
EndFunction

Function Fragment_End()
  VideoActorRefAlias.GetActorRef().UnEquipItem(Spacesuit_Constellation_Backpack as Form, False, False)
EndFunction
