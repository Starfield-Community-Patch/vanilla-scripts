ScriptName Fragments:Quests:QF_SE_KT05_000179C2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Scene Property HailTemplate_100a_KT05_HailStart Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(0.0)
EndFunction

Function Fragment_Stage_0002_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(1.0)
EndFunction

Function Fragment_Stage_0003_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(2.0)
EndFunction

Function Fragment_Stage_0004_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(3.0)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0)
  HailTemplate_100a_KT05_HailStart.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.Stop()
EndFunction
