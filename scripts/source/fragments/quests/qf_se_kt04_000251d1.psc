ScriptName Fragments:Quests:QF_SE_KT04_000251D1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_KT04_HailStart Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
GlobalVariable Property BE_KT04_Variant01 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant02 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant03 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant04 Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_CrewWoundedMarkers Auto Const mandatory
Furniture Property NPCWoundedLean Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Quest Property BE_KT04 Auto Const mandatory

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

Function Fragment_Stage_0005_Item_01()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(1)
EndFunction

Function Fragment_Stage_0005_Item_02()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0005_Item_03()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(3)
EndFunction

Function Fragment_Stage_0005_Item_04()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(4)
EndFunction

Function Fragment_Stage_0005_Item_05()
  Self.SetStage(6)
EndFunction

Function Fragment_Stage_0006_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(4.0)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetObjectiveFailed(10, True)
  BE_KT04.SetObjectiveFailed(10, True)
  Alias_MapMarker.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference[] FurnitureRef = Alias_CrewSpawnMarkers.GetArray()
  Int I = 0
  While I < FurnitureRef.Length
    Alias_CrewWoundedMarkers.AddRef(FurnitureRef[I].PlaceAtMe(NPCWoundedLean as Form, 1, False, False, True, None, None, True))
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_MapMarker.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0)
  HailTemplate_100a_KT04_HailStart.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True)
  Self.Stop()
EndFunction
