ScriptName Fragments:Quests:QF_SE_Player_FAB14_0005B944 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
ReferenceAlias Property Alias_AC_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_CY_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_Neon_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_NA_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_DestinationShipTech Auto Const mandatory
GlobalVariable Property SE_FAB14_DestinationGlobal Auto Const mandatory
MiscObject Property SE_FAB14_StarParcelPackage Auto Const mandatory
ReferenceAlias Property Alias_StarParcelPackage Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference
  ActorValue avSystem = ShipSystemEngineHealth
  sTarg.EnablePartRepair(avSystem, False)
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0075_Item_00()
  Int nRand = Utility.RandomInt(1, 4)
  Self.SetStage(400 + nRand)
  SE_FAB14_DestinationGlobal.SetValue(nRand as Float)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  sescript kmyQuest = __temp as sescript
  Int nDest = SE_FAB14_DestinationGlobal.GetValue() as Int
  Self.SetObjectiveDisplayed(400 + nDest, True, False)
  Game.GetPlayer().AddAliasedItem(SE_FAB14_StarParcelPackage as Form, Alias_StarParcelPackage as Alias, 1, True)
  If Self.GetStageDone(420)
    Game.GetPlayer().AddItem(Credits as Form, 500, False)
  EndIf
EndFunction

Function Fragment_Stage_0401_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_AC_ShipTech.GetRef())
EndFunction

Function Fragment_Stage_0402_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_CY_ShipTech.GetRef())
EndFunction

Function Fragment_Stage_0403_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_Neon_ShipTech.GetRef())
EndFunction

Function Fragment_Stage_0404_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_NA_ShipTech.GetRef())
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().RemoveItem(SE_FAB14_StarParcelPackage as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !Self.GetStageDone(400)
    Self.Stop()
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_HailingShip.GetShipRef().DisableWithGravJump()
  Self.Stop()
EndFunction
