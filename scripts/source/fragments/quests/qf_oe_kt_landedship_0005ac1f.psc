ScriptName Fragments:Quests:QF_OE_KT_LandedShip_0005AC1F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
Scene Property OE_KT_LandedShip_SceneFlavor Auto Const mandatory
ReferenceAlias Property Alias_ShipLandingMarker Auto Const mandatory
ReferenceAlias Property Alias_ShipCockpit Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Container Auto Const mandatory
ReferenceAlias Property Alias_Container01 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_PilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_Container.RefillAlias()
  Alias_Container01.RefillAlias()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()
  mySeat.BlockActivation(True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_NPC_Group00.EvaluateAll()
EndFunction

Function Fragment_Stage_0025_Item_00()
  OE_KT_LandedShip_SceneFlavor.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()
  mySeat.BlockActivation(False, False)
  Alias_ShipA_PilotSeat.Clear()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ShipCockpit.Clear()
  Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group00.SetValue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_ShipA.RefillDependentAliases()
  Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
EndFunction
