ScriptName Fragments:Scenes:SF_VideoShot07_001B4BFE Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const
ReferenceAlias Property VideoActorRefAlias Auto Const
Armor Property Spacesuit_Constellation_Backpack Auto Const mandatory
Weapon Property Grendel Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack as Form, False, False)
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 1, False, None)
EndFunction

Function Fragment_Phase_01_End()
  VideoDoor.GetRef().SetOpen(False)
EndFunction

Function Fragment_Phase_03_End()
  VideoDoor.GetRef().SetOpen(True)
EndFunction
