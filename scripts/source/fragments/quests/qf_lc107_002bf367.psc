ScriptName Fragments:Quests:QF_LC107_002BF367 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF_Main Auto Const mandatory
Quest Property CF07 Auto Const mandatory
ObjectReference Property LC107_EscapeStateNonvault_DisableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateNonvault_EnableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateVault_DisableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateVault_EnableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateEnableSpecialMarkerRef Auto Const mandatory
ObjectReference Property LC107_EntranceMarkerRef Auto Const mandatory
ObjectReference Property LC107_VaultEntranceMarkerRef Auto Const mandatory
ObjectReference Property LC107_EngineeringMarkerRef Auto Const mandatory
ObjectReference Property LC107_VaultFloorMarkerRef Auto Const mandatory
ObjectReference Property LC107_ControlRoomMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeEngineMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeEngineeringMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeVaultEntranceMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_DockingPortDoor Auto Const mandatory
ReferenceAlias Property Alias_CaptainTransferModule Auto Const mandatory
ReferenceAlias Property Alias_JasperKryxTransferModule Auto Const mandatory
ReferenceAlias Property Alias_DataCoreEmpty Auto Const mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const mandatory
ReferenceAlias Property Alias_LegacyShip Auto Const mandatory
ReferenceAlias Property Alias_UnknownShipMapMarker Auto Const mandatory
ReferenceAlias Property Alias_LegacyShipMapMarker Auto Const mandatory
ReferenceAlias Property Alias_VaultEntranceDoor Auto Const mandatory
ReferenceAlias Property Alias_VaultControlEntryDoor Auto Const mandatory
ReferenceAlias Property Alias_VaultControlsDataCoreSlot Auto Const mandatory
ReferenceAlias Property Alias_JasperKryxSlateFinal Auto Const mandatory
ReferenceAlias Property Alias_ErebosShip Auto Const mandatory
ReferenceAlias Property Alias_LC107HullBreachInitialTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_LC107HullBreachInitialTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_LC107_DestructionAudioSwitchMarker Auto Const mandatory
RefCollectionAlias Property HullBreachTriggers Auto Const
RefCollectionAlias Property Alias_EntryEnemies Auto Const mandatory
RefCollectionAlias Property Alias_EscapeEnemies Auto Const mandatory
RefCollectionAlias Property Alias_EscapeDoors Auto Const mandatory
RefCollectionAlias Property Alias_EscapeTriggers Auto Const mandatory
RefCollectionAlias Property Alias_QuickstartDoors Auto Const mandatory
RefCollectionAlias Property Alias_ReactorsMain Auto Const mandatory
RefCollectionAlias Property Alias_ReactorsAux Auto Const mandatory
RefCollectionAlias Property Alias_NavmeshGenOnlyRefs Auto Const mandatory
RefCollectionAlias Property Alias_NavmeshGenInitialRefs Auto Const mandatory
Scene Property CF07_zzLegacy000_Companion_Storm_Approach Auto Const mandatory
Scene Property CF07_zzLegacy001_Companion_Storm_During Auto Const mandatory
Scene Property CF07_zzLegacy002_Companion_Storm_ShipSighted Auto Const mandatory
Scene Property CF07_zLegacy000_Callout_InitialLockdown Auto Const mandatory
Scene Property CF07_zLegacy004_Callout_CurrencyTransfer Auto Const mandatory
Scene Property CF07_zLegacy005_Callout_CurrencyTransferComplete Auto Const mandatory
Scene Property CF07_zLegacy006_Callout_HullBreach Auto Const mandatory
Scene Property CF07_zLegacy008_Callout_SecurityAlarm Auto Const mandatory
Scene Property CF07_zzLegacy003_Companion_Ship_Robots Auto Const mandatory
Scene Property CF07_zzLegacy004_Companion_Ship_CrewQuarters Auto Const mandatory
Scene Property CF07_zzLegacy006_Companion_Ship_CredTank Auto Const mandatory
Scene Property CF07_zzLegacy007_Companion_Ship_CredTankBay Auto Const mandatory
Scene Property CF07_zzLegacy008_Companion_Ship_KryxRemains Auto Const mandatory
Scene Property CF07_zLegacy007_Evacuate_HullBreach Auto Const mandatory
Key Property LC107_EngineeringSafeKey Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
wwiseevent Property WwiseEvent_QST_CF07_BlackScreen Auto Const mandatory
ReferenceAlias Property Alias_LegacyShipNameOverride Auto Const mandatory
ActorValue Property Invulnerable Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ObjectReference Property LC107_EscapeStateVault_Lighting_EnableMarkerRef Auto Const mandatory
VisualEffect Property FX_ShipExplosionHuge02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0012_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0013_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0200_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0202_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0245_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0250_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0290_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0300_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0301_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0310_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0373_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0501_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0511_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0550_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0650_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0900_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(9)
  CF07.SetStage(220)
  CF07.SetStage(230)
  Self.SetStage(20)
  Self.SetStage(190)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  playerRef.MoveTo(LC107_EntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(9)
  CF07.SetStage(220)
  CF07.SetStage(230)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  playerRef.MoveTo(LC107_VaultEntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(9)
  CF07.SetStage(220)
  CF07.SetStage(230)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(240)
  Self.SetStage(250)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.MoveTo(LC107_EngineeringMarkerRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Self.SetStage(9)
  CF07.SetStage(220)
  CF07.SetStage(230)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(220)
  Self.SetStage(240)
  Self.SetStage(250)
  Self.SetStage(270)
  Self.SetStage(290)
  Self.SetStage(300)
  Self.SetStage(310)
  Alias_QuickstartDoors.SetOpen(True)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.MoveTo(LC107_VaultFloorMarkerRef, 0.0, 0.0, 0.0, True, False)
  kmyQuest.WaitForCredTankInitialization()
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Self.SetStage(9)
  CF07.SetStage(220)
  CF07.SetStage(230)
  CF07.SetStage(270)
  CF07.SetStage(275)
  CF07.SetStage(276)
  CF07.SetStage(280)
  CF07.SetStage(290)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(240)
  Alias_QuickstartDoors.SetOpen(True)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False)
  playerRef.MoveTo(LC107_ControlRoomMarkerRef, 0.0, 0.0, 0.0, True, False)
  kmyQuest.WaitForCredTankInitialization()
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(9)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(240)
  Alias_QuickstartDoors.SetOpen(True)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False)
  Alias_EntryEnemies.DisableAll(False)
  playerRef.MoveTo(LC107_ControlRoomMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(510)
  Self.SetStage(515)
  Self.SetStage(521)
  CF07.SetStage(400)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(9)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(240)
  Alias_QuickstartDoors.SetOpen(True)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False)
  Alias_EntryEnemies.DisableAll(False)
  playerRef.MoveTo(LC107_EscapeEngineMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(510)
  Self.SetStage(515)
  Self.SetStage(521)
  CF07.SetStage(400)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(9)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(240)
  Self.SetStage(600)
  Alias_QuickstartDoors.SetOpen(True)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False)
  Alias_EntryEnemies.DisableAll(False)
  playerRef.MoveTo(LC107_EscapeEngineeringMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(510)
  Self.SetStage(515)
  Self.SetStage(521)
  CF07.SetStage(400)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(9)
  Self.SetStage(20)
  Self.SetStage(190)
  Self.SetStage(200)
  Self.SetStage(240)
  Self.SetStage(650)
  Alias_QuickstartDoors.SetOpen(True)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False)
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False)
  Alias_EntryEnemies.DisableAll(False)
  playerRef.MoveTo(LC107_EscapeVaultEntranceMarkerRef, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(510)
  Self.SetStage(515)
  Self.SetStage(521)
  CF07.SetStage(400)
EndFunction

Function Fragment_Stage_0009_Item_00()
  CF_Main.SetStage(1)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.SetReactorState(Alias_ReactorsMain, kmyQuest.CONST_ReactorState_Inactive)
  kmyQuest.SetReactorState(Alias_ReactorsAux, kmyQuest.CONST_ReactorState_Active)
  Alias_NavmeshGenOnlyRefs.DisableAll(False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.ResetStandardCredTanks()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Game.GetPlayer().AddItem(LC107_EngineeringSafeKey as Form, 1, False)
EndFunction

Function Fragment_Stage_0018_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Self.SetStage(9)
  CF07.SetStage(210)
  Self.SetStage(20)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  kmyQuest.DEBUG_GoToSpaceAndWait(False)
EndFunction

Function Fragment_Stage_0019_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Self.SetStage(9)
  CF07.SetStage(210)
  Self.SetStage(20)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False)
  kmyQuest.DEBUG_GoToSpaceAndWait(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  spaceshipreference legacyRef = Alias_LegacyShip.GetShipRef()
  spaceshipreference erebosRef = Alias_ErebosShip.GetShipRef()
  legacyRef.Enable(False)
  erebosRef.Enable(False)
  erebosRef.InstantDock(legacyRef as ObjectReference)
  Alias_UnknownShipMapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  If !Self.GetStageDone(190)
    CF07_zzLegacy000_Companion_Storm_Approach.Start()
  EndIf
EndFunction

Function Fragment_Stage_0101_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.UpdateArrivalProcess()
EndFunction

Function Fragment_Stage_0150_Item_00()
  If !Self.GetStageDone(190)
    CF07_zzLegacy001_Companion_Storm_During.Start()
  EndIf
EndFunction

Function Fragment_Stage_0151_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.UpdateArrivalProcess()
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetStage(172)
  If !Self.GetStageDone(190)
    CF07_zzLegacy002_Companion_Storm_ShipSighted.Start()
  EndIf
EndFunction

Function Fragment_Stage_0171_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
EndFunction

Function Fragment_Stage_0172_Item_00()
  Alias_LegacyShipNameOverride.Clear()
  Alias_UnknownShipMapMarker.TryToDisable()
  Alias_LegacyShipMapMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetStage(100)
  Self.SetStage(150)
  Self.SetStage(170)
  Self.SetStage(172)
EndFunction

Function Fragment_Stage_0201_Item_00()
  CF07_zLegacy000_Callout_InitialLockdown.Start()
EndFunction

Function Fragment_Stage_0204_Item_00()
  CF07_zzLegacy004_Companion_Ship_CrewQuarters.Start()
EndFunction

Function Fragment_Stage_0220_Item_00()
  CF07.SetStage(240)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Alias_VaultEntranceDoor.GetRef().SetOpen(True)
  CF07.SetStage(255)
EndFunction

Function Fragment_Stage_0260_Item_00()
  CF07.SetStage(260)
  CF07_zzLegacy006_Companion_Ship_CredTank.Start()
EndFunction

Function Fragment_Stage_0265_Item_00()
  CF07.SetStage(265)
EndFunction

Function Fragment_Stage_0270_Item_00()
  CF07.SetStage(266)
EndFunction

Function Fragment_Stage_0280_Item_00()
  CF07_zLegacy008_Callout_SecurityAlarm.Start()
EndFunction

Function Fragment_Stage_0302_Item_00()
  CF07_zzLegacy007_Companion_Ship_CredTankBay.Start()
EndFunction

Function Fragment_Stage_0320_Item_00()
  CF07_zzLegacy008_Companion_Ship_KryxRemains.Start()
  CF07.SetStage(270)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.UnblockVaultPowerSwitches()
EndFunction

Function Fragment_Stage_0331_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  If Self.GetStageDone(331) && Self.GetStageDone(332)
    Self.SetStage(333)
  Else
    kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_HalfPower)
  EndIf
EndFunction

Function Fragment_Stage_0332_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  If Self.GetStageDone(331) && Self.GetStageDone(332)
    Self.SetStage(333)
  Else
    kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_HalfPower)
  EndIf
EndFunction

Function Fragment_Stage_0333_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_Powered)
  CF07.SetStage(300)
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.GetStageDone(340) && Self.GetStageDone(341)
    Self.SetStage(342)
  EndIf
EndFunction

Function Fragment_Stage_0341_Item_00()
  If Self.GetStageDone(340) && Self.GetStageDone(341)
    Self.SetStage(342)
  EndIf
EndFunction

Function Fragment_Stage_0342_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert)
EndFunction

Function Fragment_Stage_0343_Item_00()
  CF07.SetStage(360)
EndFunction

Function Fragment_Stage_0345_Item_00()
  Self.SetStage(350)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Self.SetStageNoWait(351)
  CF07_zLegacy004_Callout_CurrencyTransfer.Start()
  CF07.SetStage(370)
  kmyQuest.PerformCredTankDataTransfer()
  Self.SetStage(360)
EndFunction

Function Fragment_Stage_0351_Item_00()
  ObjectReference vaultControlEntryDoorRef = Alias_VaultControlEntryDoor.GetRef()
  vaultControlEntryDoorRef.SetOpen(False)
  vaultControlEntryDoorRef.Lock(True, False, True)
  vaultControlEntryDoorRef.SetLockLevel(253)
  LC107_EscapeStateNonvault_DisableMarkerRef.Disable(False)
  LC107_EscapeStateNonvault_EnableMarkerRef.Enable(False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.DisableFastTravelOnLegacy()
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_DownloadFinished)
  CF07_zLegacy005_Callout_CurrencyTransferComplete.Start()
  CF07.SetStage(380)
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(370) && Self.GetStageDone(371)
    Self.SetStage(372)
  EndIf
EndFunction

Function Fragment_Stage_0371_Item_00()
  If Self.GetStageDone(370) && Self.GetStageDone(371)
    Self.SetStage(372)
  EndIf
EndFunction

Function Fragment_Stage_0372_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval)
  kmyQuest.PopupDataCore()
  Self.SetStage(373)
EndFunction

Function Fragment_Stage_0374_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.LockPlayerForEscape()
  CF07_zLegacy006_Callout_HullBreach.Start()
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.PlayBreachSequenceStartVFX()
  Self.SetStage(501)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.CallFunctionNoWait("CredTanksShutdown", None)
  kmyQuest.CallFunctionNoWait("BreakVaultInstantBreaches", None)
  LC107_EscapeStateVault_DisableMarkerRef.Disable(False)
  LC107_EscapeStateVault_EnableMarkerRef.Enable(False)
  LC107_EscapeStateVault_Lighting_EnableMarkerRef.Enable(False)
  Alias_NavmeshGenInitialRefs.DisableAll(False)
  HullBreachTriggers.EnableAll(False)
  kmyQuest.WaitForBreachesAndCredTanks()
  Alias_LC107_DestructionAudioSwitchMarker.TryToEnable()
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_Shutdown)
  Self.SetStage(511)
  Self.SetStageNoWait(515)
EndFunction

Function Fragment_Stage_0515_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  If Self.GetStageDone(3) || Self.GetStageDone(4)
    Alias_EntryEnemies.DisableAll(False)
  EndIf
  ObjectReference vaultControlEntryDoorRef = Alias_VaultControlEntryDoor.GetRef()
  vaultControlEntryDoorRef.Unlock(False)
  vaultControlEntryDoorRef.SetOpen(True)
  Alias_EscapeTriggers.EnableAll(False)
  Alias_EscapeEnemies.EnableAll(False)
  Alias_EscapeDoors.SetOpen(True)
  LC107_EscapeStateNonvault_DisableMarkerRef.Disable(False)
  LC107_EscapeStateNonvault_EnableMarkerRef.Enable(False)
  kmyQuest.SetReactorState(Alias_ReactorsMain, kmyQuest.CONST_ReactorState_Inactive)
  kmyQuest.SetReactorState(Alias_ReactorsAux, kmyQuest.CONST_ReactorState_Inactive)
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_Reset)
  kmyQuest.SetNotSealedEnvironment()
  kmyQuest.BreakOtherInstantBreaches()
  kmyQuest.DamageDestructibleTraps()
EndFunction

Function Fragment_Stage_0520_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.PlayBreachSequenceEndVFX()
  kmyQuest.UnlockPlayerMovement()
  Self.SetStage(521)
EndFunction

Function Fragment_Stage_0521_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.StartAmbientExplosions(0)
  Utility.Wait(2.0)
  (Alias_LC107HullBreachInitialTrigger02.GetRef() as lc107hullbreachtriggerscript).TriggerBreaches()
  Utility.Wait(2.0)
  (Alias_LC107HullBreachInitialTrigger01.GetRef() as lc107hullbreachtriggerscript).TriggerBreaches()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.StartAmbientExplosions(1)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  kmyQuest.StartAmbientExplosions(2)
EndFunction

Function Fragment_Stage_0770_Item_00()
  LC107_EscapeStateEnableSpecialMarkerRef.EnableNoWait(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  spaceshipreference erebosShip = Alias_ErebosShip.GetShipRef()
  erebosShip.SetValue(DockingPermission, 4.0)
  erebosShip.SetEssential(False)
  erebosShip.InstantUndock()
  erebosShip.Kill(None)
  spaceshipreference legacyRef = Alias_LegacyShip.GetShipRef()
  legacyRef.SetValue(Invulnerable, 0.0)
  legacyRef.SetValue(DockingPermission, 4.0)
  legacyRef.SetEssential(False)
  FX_ShipExplosionHuge02.Play(legacyRef as ObjectReference, -1.0, None)
  Utility.Wait(10.0)
  legacyRef.Kill(None)
  Alias_UnknownShipMapMarker.TryToDisable()
  Alias_LegacyShipMapMarker.TryToDisable()
  kmyQuest.UnlockFastTravel()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  lc107questscript kmyQuest = __temp as lc107questscript
  Self.SetStage(1000)
  Alias_ErebosShip.TryToDisable()
  Alias_LegacyShip.TryToDisable()
  kmyQuest.Cleanup()
  Self.Stop()
EndFunction
