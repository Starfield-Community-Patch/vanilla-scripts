ScriptName Fragments:Quests:QF_LC044_0022F264 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property RI04GuardEnableMarker Auto Const
Faction Property LC044RyujinGuardCrimeFaction Auto Const
Cell Property LC044RyujinIndustriesHQ Auto Const
ObjectReference Property RI04SettlementNPCEnableMarker Auto Const
ReferenceAlias Property Alias_ElevFloor03 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor04 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor05 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor06 Auto Const mandatory
Faction Property LC044RyujinGuardEnemeyFaction Auto Const
RefCollectionAlias Property Alias_AllGuardsTrespass Auto Const mandatory
RefCollectionAlias Property Alias_AllGuardsSafe Auto Const mandatory
Float Property Speed Auto Const
ObjectReference Property CraneRotationHelper Auto Const
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_Camden Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_DoorFloor02 Auto Const mandatory
ObjectReference Property OfficeConstructionEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Nina Auto Const mandatory
ReferenceAlias Property Alias_NinaRyujinMarker Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor01 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor02 Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter04Enable Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter06Enable Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter07Enable Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter04 Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter06 Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter07 Auto Const mandatory
ObjectReference Property RI04LightEnableMarker Auto Const
Quest Property LC044Jail Auto Const
ReferenceAlias Property Alias_LightsEnableMarkerFloor03 Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor04 Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor05 Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor06 Auto Const mandatory
RefCollectionAlias Property Alias_VentDoors Auto Const mandatory
ReferenceAlias Property Alias_HoldingCellDoor Auto Const mandatory
ReferenceAlias Property Alias_CamdenOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_ElevatorManager Auto Const mandatory
Message Property LC044LoadElevatorFloorNames_PostQuest Auto Const mandatory
GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor03Construction Auto Const mandatory
ReferenceAlias Property Alias_InfinityConstructionEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_InfinityOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const mandatory
ReferenceAlias Property Alias_RobotBoss Auto Const mandatory
wwiseevent Property QST_RI04_CraneMove Auto Const
ReferenceAlias Property Alias_CraneSound Auto Const mandatory
ReferenceAlias Property Alias_LobbyGuardEnableMarker Auto Const mandatory
GlobalVariable Property CrowdDisableRyujin Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter05Enable Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  LC044Jail.Start()
  CrowdDisableRyujin.SetValue(1.0)
  RI04SettlementNPCEnableMarker.Disable(False)
  Alias_ExecutiveGenericNPCs.GetRef().Disable(False)
  Alias_Masako.GetRef().Disable(False)
  Alias_Ularu.GetRef().Disable(False)
  Alias_Imogene.GetRef().Disable(False)
  Alias_Camden.GetRef().Disable(False)
  Alias_Yuko.GetRef().Disable(False)
  Alias_LobbyGuardEnableMarker.GetRef().Disable(False)
  Alias_FC_Neon_CT_CityLife_Encounter04Enable.GetRef().Disable(False)
  Alias_FC_Neon_CT_CityLife_Encounter05Enable.GetRef().Disable(False)
  Alias_FC_Neon_CT_CityLife_Encounter06Enable.GetRef().Disable(False)
  Alias_FC_Neon_CT_CityLife_Encounter07Enable.GetRef().Disable(False)
  Utility.Wait(5.0)
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetElevatorOperational(False)
  Alias_DoorFloor02.GetRef().Lock(False, True, True)
  Alias_VentDoors.BlockActivation(False, False)
  Alias_HoldingCellDoor.GetRef().BlockActivation(False, False)
  (RI_Support as ri_radiantsupportquestscript).UnlockVentDoors()
  Alias_CamdenOfficeDoor.GetRef().Lock(True, False, True)
  Alias_CamdenOfficeDoor.GetRef().SetLockLevel(25)
  Alias_MasakoOfficeDoor.GetRef().Lock(True, False, True)
  Alias_MasakoOfficeDoor.GetRef().SetLockLevel(100)
  Alias_LobbyGuardEnableMarker.GetRef().Enable(False)
  RI04GuardEnableMarker.Enable(False)
  Alias_AllGuardsTrespass.AddRefCollection(Alias_AllGuardsSafe)
  Alias_AllGuardsSafe.RemoveAll()
  Alias_AllGuardsTrespass.EvaluateAll()
  (Alias_RobotBoss.GetRef() as robotpodscript).WakeRobotFromPod()
EndFunction

Function Fragment_Stage_0011_Item_00()
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetElevatorOperational(False)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Alias_AllGuardsTrespass.EvaluateAll()
  LC044Jail.SetStage(27)
  Alias_AllGuardsSafe.AddRefCollection(Alias_AllGuardsTrespass)
  Alias_AllGuardsTrespass.RemoveAll()
  Alias_AllGuardsSafe.EvaluateAll()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_AllGuardsTrespass.EvaluateAll()
  Alias_AllGuardsSafe.AddRefCollection(Alias_AllGuardsTrespass)
  Alias_AllGuardsTrespass.RemoveAll()
  Alias_AllGuardsSafe.EvaluateAll()
EndFunction

Function Fragment_Stage_0017_Item_00()
  Alias_AllGuardsTrespass.AddRefCollection(Alias_AllGuardsSafe)
  Alias_AllGuardsSafe.RemoveAll()
  Alias_AllGuardsTrespass.EvaluateAll()
  Game.GetPlayer().AddToFaction(LC044RyujinGuardEnemeyFaction)
EndFunction

Function Fragment_Stage_0020_Item_00()
  LC044Jail.Stop()
  CrowdDisableRyujin.SetValue(0.0)
  RI04GuardEnableMarker.Disable(False)
  RI04SettlementNPCEnableMarker.Enable(False)
  Alias_ExecutiveGenericNPCs.GetRef().Enable(False)
  Alias_Masako.GetRef().Enable(False)
  Alias_Ularu.GetRef().Enable(False)
  Alias_Imogene.GetRef().Enable(False)
  Alias_Camden.GetRef().Enable(False)
  Alias_Yuko.GetRef().Enable(False)
  Alias_RobotBoss.Clear()
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetElevatorOperational(True)
  If !FC_Neon_CT_CityLife_Encounter04.GetStageDone(100)
    Alias_FC_Neon_CT_CityLife_Encounter04Enable.GetRef().Enable(False)
  EndIf
  If !FC_Neon_CT_CityLife_Encounter05.GetStageDone(100)
    Alias_FC_Neon_CT_CityLife_Encounter05Enable.GetRef().Enable(False)
  EndIf
  If !FC_Neon_CT_CityLife_Encounter06.GetStageDone(100)
    Alias_FC_Neon_CT_CityLife_Encounter06Enable.GetRef().Enable(False)
  EndIf
  If !FC_Neon_CT_CityLife_Encounter07.GetStageDone(100)
    Alias_FC_Neon_CT_CityLife_Encounter07Enable.GetRef().Enable(False)
  EndIf
  Alias_VentDoors.BlockActivation(True, True)
  Alias_HoldingCellDoor.GetRef().BlockActivation(True, True)
  (RI_Support as ri_radiantsupportquestscript).LockVentDoors()
  Alias_CamdenOfficeDoor.GetRef().Lock(False, False, True)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  Alias_LightsEnableMarkerFloor03.GetRef().Disable(False)
  Alias_LightsEnableMarkerFloor03Construction.GetRef().Enable(False)
  Alias_LightsEnableMarkerFloor04.GetRef().Disable(False)
  Alias_LightsEnableMarkerFloor05.GetRef().Disable(False)
  Alias_LightsEnableMarkerFloor06.GetRef().Disable(False)
  (Alias_RobotBoss.GetRef() as robotpodscript).SendRobotToPod()
  If Alias_RobotBoss.getactorref().IsDead()
    Alias_RobotBoss.getactorref().Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor03.GetRef() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_DoorFloor02.GetRef().Lock(False, True, True)
EndFunction

Function Fragment_Stage_0400_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor04.GetRef() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0500_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor05.GetRef() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor06.GetRef() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0750_Item_00()
  CraneRotationHelper.PlayAnimation("Play01")
  QST_RI04_CraneMove.Play(Alias_CraneSound.GetRef(), None, None)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Alias_LightsEnableMarkerFloor03.GetRef().Enable(False)
  Alias_LightsEnableMarkerFloor03Construction.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0810_Item_00()
  Alias_LightsEnableMarkerFloor04.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0820_Item_00()
  Alias_LightsEnableMarkerFloor05.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0830_Item_00()
  Alias_LightsEnableMarkerFloor06.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetStage(100)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(350)
  Self.SetStage(400)
  Self.SetStage(500)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_InfinityOfficeEnableMarker.GetRef().Enable(False)
  Alias_InfinityConstructionEnableMarker.GetRef().Disable(False)
  Alias_Nina.GetRef().MoveTo(Alias_NinaRyujinMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetFloorNames(LC044LoadElevatorFloorNames_PostQuest)
  Self.Stop()
EndFunction
