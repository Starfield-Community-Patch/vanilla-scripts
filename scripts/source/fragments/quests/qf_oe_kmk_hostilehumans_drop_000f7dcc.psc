ScriptName Fragments:Quests:QF_OE_KMK_HostileHumans_Drop_000F7DCC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(-1)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_MapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.setstage(500)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.setstage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LaunchShip(0, None, False)
  Utility.wait(Utility.RandomFloat(1.0, 3.0))
  kmyQuest.LaunchShip(1, None, False)
  Utility.wait(Utility.RandomFloat(1.0, 3.0))
  kmyQuest.LaunchShip(2, None, False)
  If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword)
    Alias_MapMarker.TryToDisable()
  EndIf
EndFunction
