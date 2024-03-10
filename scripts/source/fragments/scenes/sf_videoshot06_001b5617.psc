ScriptName Fragments:Scenes:SF_VideoShot06_001B5617 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weapon Property Grendel Auto Const mandatory
Armor Property Spacesuit_Constellation_Backpack_01 Auto Const mandatory
ReferenceAlias Property VideoActorRefAlias Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack_01 as Form, False, False)
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 1, False, None)
EndFunction
