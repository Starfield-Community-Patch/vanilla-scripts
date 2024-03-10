ScriptName Fragments:Scenes:SF_VideoShot09_001BFFAE Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoActorRefAlias Auto Const
Weapon Property Grendel Auto Const mandatory
Armor Property Spacesuit_Constellation_Backpack_01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoActorRefAlias.GetActorRef().RemoveItem(Spacesuit_Constellation_Backpack_01 as Form, 1, False, None)
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 1, False, None)
EndFunction
