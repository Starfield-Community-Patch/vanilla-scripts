ScriptName Fragments:Quests:QF_SE_ZW15_0005EAEF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
Scene Property PSE_ZW0801_HailingScene Auto Const mandatory
ReferenceAlias Property Alias_TheBrute Auto Const mandatory
Faction Property PPlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_GuardShip01 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip02 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip03 Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
Quest Property SE_ZW15_SpaceCell Auto Const mandatory
GlobalVariable Property SE_ZW15_DoneOnceGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(15)
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_ZW15_SpaceCell.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  PSE_ZW0801_HailingScene.Start()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(10, True)
  SE_ZW15_DoneOnceGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_1001_Item_00()
  Alias_TheBrute.GetShipRef().DamageValue(SpaceshipEngineHealth, 100000.0)
  Alias_GuardShip01.GetShipRef().kill(None)
  Alias_GuardShip02.GetShipRef().kill(None)
  Alias_GuardShip03.GetShipRef().kill(None)
  Alias_playerShip.GetShipRef().InstantDock(Alias_TheBrute.GetShipRef() as ObjectReference)
EndFunction

Function Fragment_Stage_1002_Item_00()
  Alias_TheBrute.GetShipRef().DamageValue(SpaceshipEngineHealth, 100000.0)
  Alias_GuardShip01.GetShipRef().kill(None)
  Alias_GuardShip02.GetShipRef().kill(None)
  Alias_GuardShip03.GetShipRef().kill(None)
EndFunction
