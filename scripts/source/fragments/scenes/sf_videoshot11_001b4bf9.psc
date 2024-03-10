ScriptName Fragments:Scenes:SF_VideoShot11_001B4BF9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const
Weapon Property Grendel Auto Const mandatory
Armor Property Spacesuit_Constellation_Backpack_01 Auto Const mandatory
ReferenceAlias Property VideoActorRefAlias Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoDoor.GetRef().SetOpen(False)
  VideoActorRefAlias.GetActorRef().RemoveItem(Spacesuit_Constellation_Backpack_01 as Form, 1, False, None)
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 1, False, None)
EndFunction
