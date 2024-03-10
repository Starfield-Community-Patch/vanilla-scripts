ScriptName Fragments:Quests:QF_OE_KMK_HostileHumans_002308A3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
RefCollectionAlias Property Alias_NPCs_Sandboxers Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
RefCollectionAlias Property Alias_NPCs_ShipC Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
GlobalVariable Property OE_HostileShipTakeoffChance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(-1)
  If Alias_NPCs_Sandboxers.GetCount() == 0
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_MapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Game.GetDieRollSuccess(OE_HostileShipTakeoffChance.GetValueInt(), 1, 100, -1, -1)
    Self.SetStage(500)
  EndIf
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
