ScriptName Fragments:Quests:QF_BE_Derelict_ZeroG_000F003E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LocTypeBEDerelict Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
EndFunction
