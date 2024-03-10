ScriptName Fragments:Quests:QF_SE_AF04_00220B47 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
Scene Property SE_AF04_001_HailingScene Auto Const
Scene Property SE_AF04_004_SuccessScene Auto Const
Scene Property SE_AF04_005_HailerDifuseScene Auto Const
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_Beacon Auto Const mandatory
GlobalVariable Property PSE_AF04_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  SE_AF04_001_HailingScene.start()
EndFunction

Function Fragment_Stage_0060_Item_00()
  PSE_AF04_RunOnce.SetValue(1.0)
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_HailingShip.GetShipRef().kill(None)
  Alias_Beacon.getref().disable(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  SE_AF04_005_HailerDifuseScene.start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(10, True)
  SE_AF04_004_SuccessScene.start()
EndFunction
