ScriptName Fragments:Quests:QF__0200F041 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(0)
  ObjectReference landingMarkerB = Alias_Marker_ShipLandingB.GetRef()
  ObjectReference landingMarkerC = Alias_Marker_ShipLandingC.GetRef()
  If landingMarkerB == None
    Self.setstage(310)
  ElseIf Utility.RandomInt(1, 3) == 1
    kmyQuest.LandShip(1)
  EndIf
  If landingMarkerC == None
    Self.setstage(410)
  ElseIf Utility.RandomInt(1, 3) == 1
    kmyQuest.LandShip(2)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(1)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.setstage(500)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LandShip(2)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.setstage(500)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.setstage(500)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LaunchShip(0, None, False)
  kmyQuest.LaunchShip(1, None, False)
  kmyQuest.LaunchShip(2, None, False)
EndFunction
