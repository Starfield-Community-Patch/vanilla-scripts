ScriptName Fragments:Quests:QF_SE_ZW08_SpaceCell_0002B8DF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Quest Property SE_ZW08 Auto Const mandatory
Scene Property PSE_ZW0801_HailingScene Auto Const mandatory
ReferenceAlias Property Alias_LegendaryShip Auto Const mandatory
ReferenceAlias Property Alias_GuardShip01 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip02 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip03 Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_MapMarkerNameSwap Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_MapMarker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_MapMarkerNameSwap.ForceRefTo(Alias_MapMarker.GetRef())
EndFunction

Function Fragment_Stage_0050_Item_00()
  PSE_ZW0801_HailingScene.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_LegendaryShip.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
  Alias_GuardShip01.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
  Alias_GuardShip02.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
  Alias_GuardShip03.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
EndFunction
