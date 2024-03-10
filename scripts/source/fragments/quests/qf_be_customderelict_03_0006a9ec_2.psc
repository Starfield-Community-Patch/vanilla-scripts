ScriptName Fragments:Quests:QF_BE_CustomDerelict_03_0006A9EC_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property LocTypeBEDerelict Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
EndFunction
