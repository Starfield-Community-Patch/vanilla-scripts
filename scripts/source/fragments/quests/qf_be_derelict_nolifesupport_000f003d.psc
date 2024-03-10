ScriptName Fragments:Quests:QF_BE_Derelict_NoLifeSupport_000F003D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LocTypeBEDerelict Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
EndFunction
