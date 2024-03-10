ScriptName LC107QuestScript Extends Quest
{ Quest script for LC107, The Legacy. }

;-- Structs -----------------------------------------
Struct AmbientExplosionDatum
  Int ExplosionSizeMin
  { Min index into HullBreachExplosions. }
  Int ExplosionSizeMax
  { Max index into HullBreachExplosions. }
  Float ExplosionDelayMin
  { Min delay between explosions. }
  Float ExplosionDelayMax
  { Max delay between explosions. }
EndStruct


;-- Variables ---------------------------------------
Int CONST_AILevelMod_Hard = 2 Const
Int CONST_AmbientExplosionOffsetMaxX = 8 Const
Int CONST_AmbientExplosionOffsetMaxY = 16 Const
Int CONST_AmbientExplosionOffsetMaxZ = 8 Const
Int CONST_AmbientExplosionOffsetMinX = 0 Const
Int CONST_AmbientExplosionOffsetMinY = 8 Const
Int CONST_AmbientExplosionOffsetMinZ = 2 Const
Int CONST_AmbientExplosionTimerID = 2 Const
Int CONST_BreachSequenceExplosionTimerID = 1 Const
Float CONST_BreachSequenceRumbleDelayMax = 2.0 Const
Float CONST_BreachSequenceRumbleDelayMin = 1.0 Const
Float CONST_BreachSequenceRumblePowerMax = 1.0 Const
Float CONST_BreachSequenceRumblePowerMin = 0.5 Const
Float CONST_BreachSequenceRumbleTimeMax = 1.5 Const
Float CONST_BreachSequenceRumbleTimeMin = 0.75 Const
Float CONST_CredTankDrainPercentMax = 0.939999998 Const
Int CONST_CredTankInitFailsafe = 90 Const
Int CONST_CredTankOperationFailsafe = 90 Const
Float CONST_DataCorePopupDelay = 2.0 Const
Int CONST_EvacuationSceneRepeatDelay = 90 Const
Int CONST_LegacyEscapeCompleteStage = 1000 Const
Int CONST_LegacyShipAccessibleStage = 20 Const
Int CONST_LegacyShipArrivalStage = 100 Const
Int CONST_LegacyShipDiscoveryDistance = 1500 Const
Int CONST_LegacyShipDiscoveryStage = 170 Const
Int CONST_LegacyShipDockedStage = 190 Const
Int CONST_LegacyShipMapMarkerRevealStage = 172 Const
Int CONST_LegacyShipMidwayDistance = 3250 Const
Int CONST_LegacyShipMidwayStage = 150 Const
Int CONST_OpenVaultEntranceDoorStage = 240 Const
Int CONST_VaultDataCoreInsertedStage = 343 Const
Int CONST_VaultDataCoreReadyForRemovalStage = 373 Const
Int CONST_VaultDataCoreRemovedStage = 374 Const
Int CONST_VaultDataTransferCompleteStage = 360 Const
Int CONST_VaultDownloadControlActivatedStage = 345 Const
Int CONST_VaultPowerReroutedStage = 333 Const
Int CONST_VaultPowerSwitch01ReroutedStage = 331 Const
Int CONST_VaultPowerSwitch02ReroutedStage = 332 Const
Int CONST_VaultTransferModule01InsertedStage = 340 Const
Int CONST_VaultTransferModule01RemovedStage = 370 Const
Int CONST_VaultTransferModule02InsertedStage = 341 Const
Int CONST_VaultTransferModule02RemovedStage = 371 Const
Int CONST_VaultTransferModulesInsertedStage = 342 Const
inputenablelayer LC107EnableLayer
Int ambientExplosionLevel
Bool breachSequenceExplosionsActive
Float credTankDrainPercent
ObjectReference crimsonFleetAliasContainerRef
Bool debugBlockAmbientExplosions
Float evacuationSceneLastPlayedTime
Bool initializedPackins
ObjectReference vaultControlsDataCoreSlotRef
ObjectReference vaultControlsDownloadControlRef
ObjectReference vaultControlsStatusIndicatorRef
ObjectReference vaultControlsTransferModuleSlot01Ref
ObjectReference vaultControlsTransferModuleSlot02Ref
lc107credtanksystemrefscript vaultCredTankManagerRef
ObjectReference vaultEntranceControlRef
genericswitchscript vaultPowerSwitch01LightRef
ObjectReference vaultPowerSwitch01Ref
genericswitchscript vaultPowerSwitch02LightRef
ObjectReference vaultPowerSwitch02Ref
Bool waitingForCredTanksDrain
Bool waitingForCredTanksShutdown
Bool waitingForPlayerToSit
Bool waitingForVaultInstantBreaches

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AmbientExplosionDataGuard
Guard TransferModuleSlot01ActivationGuard
Guard TransferModuleSlot02ActivationGuard

;-- Properties --------------------------------------
Group QuestData
  lc107questscript:ambientexplosiondatum[] Property AmbientExplosionData Auto mandatory
  { Array of ambient explosion data to use during the escape sequence. }
  sq_parentscript:actorvaluedatum[] Property ErebosActorValuesToDamage Auto Const mandatory
  { Array of actor values to damage on the Erebos. }
  Explosion[] Property HullBreachExplosions Auto Const mandatory
  { Explosions to use during the escape sequence. }
  spaceshipbase Property DEBUG_PlayerShip Auto Const mandatory
  { For quickstarts, the ship to place the player in. }
EndGroup

Group AutofillProperties
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  LocationAlias Property LC107LegacyShipLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property LegacyShip Auto Const mandatory
  ReferenceAlias Property ErebosShip Auto Const mandatory
  RefCollectionAlias Property SpaceCellShips Auto Const mandatory
  ReferenceAlias Property Companion Auto Const mandatory
  ReferenceAlias Property CrimsonFleetAliasContainer Auto Const mandatory
  ReferenceAlias Property CaptainTransferModule Auto Const mandatory
  ReferenceAlias Property JasperKryxTransferModule Auto Const mandatory
  ReferenceAlias Property DataCoreEmpty Auto Const mandatory
  ReferenceAlias Property DataCoreFull Auto Const mandatory
  ReferenceAlias Property VaultEntranceControl Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch01 Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch02 Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch01Light Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch02Light Auto Const mandatory
  ReferenceAlias Property VaultControlsStatusIndicator Auto Const mandatory
  ReferenceAlias Property VaultControlsTransferModuleSlot01 Auto Const mandatory
  ReferenceAlias Property VaultControlsTransferModuleSlot02 Auto Const mandatory
  ReferenceAlias Property VaultControlsDataCoreSlot Auto Const mandatory
  ReferenceAlias Property VaultControlsDownloadControl Auto Const mandatory
  ReferenceAlias Property VaultCredTankManager Auto Const mandatory
  RefCollectionAlias Property StandardCredTanks Auto Const mandatory
  RefCollectionAlias Property HullBreachesAll Auto Const mandatory
  RefCollectionAlias Property HullBreachesInstantBreak Auto Const mandatory
  RefCollectionAlias Property HullBreachesInstantBreakVault Auto Const mandatory
  RefCollectionAlias Property HullBreachTriggers Auto Const mandatory
  RefCollectionAlias Property DestructibleTraps Auto Const mandatory
  Message Property LC107_GalbankControlConsoleNeedsPowerMessage Auto Const mandatory
  Message Property LC107_GalbankTransferModuleLockedMessage Auto Const mandatory
  Message Property LC107_GalbankTransferModuleNeededMessage Auto Const mandatory
  Message Property LC107_GalbankDataCorePortNeedsTransferModulesMessage Auto Const mandatory
  Message Property LC107_GalbankDownloadControlNeedsDataCoreMessage Auto Const mandatory
  Message Property LC107_DataCoreLockedMessage Auto Const mandatory
  GlobalVariable Property LC107CredTankShelvesCurrentGlobal Auto Const mandatory
  GlobalVariable Property LC107CredTankShelvesTotalGlobal Auto Const mandatory
  GlobalVariable Property LC107VaultInstantBreachesCurrentGlobal Auto Const mandatory
  Scene Property CF07_zLegacy001_Callout_NoTransferModule Auto Const mandatory
  Scene Property CF07_zLegacy003_Callout_ConsoleLowPower Auto Const mandatory
  Scene Property CF07_zLegacy007_Evacuate_HullBreach Auto Const mandatory
  ImageSpaceModifier Property HoldAtBlackImod Auto Const mandatory
  Key Property CF_GalbankTransferModule Auto Const mandatory
  Cell Property LC107Legacy01 Auto Const mandatory
  Keyword Property ENV_Loc_NotSealedEnvironment Auto Const mandatory
  Static Property XMarkerHeading Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property CF05_ComSpike_AV Auto Const mandatory
  ActorValue Property CF06_ConductionGrid_AV Auto Const mandatory
  Perk Property Skill_Piloting Auto Const mandatory
  Potion Property ShipRepairKit Auto Const mandatory
  FormList Property LC088_Space_QuickstartCrewList Auto Const mandatory
  ObjectReference Property scDebugStartOriginMarker Auto Const mandatory
  wwiseevent Property QST_CF07_Power_Half Auto Const mandatory
  wwiseevent Property QST_CF07_Power_Full Auto Const mandatory
  wwiseevent Property QST_CF07_ServerRoom_Activate Auto Const mandatory
  wwiseevent Property QST_CF07_ServerRoom_Deactivate Auto Const mandatory
  wwiseevent Property QST_CF07_Data_Transfer_LP_Start Auto Const mandatory
  wwiseevent Property QST_CF07_Data_Transfer_LP_Stop Auto Const mandatory
  wwiseevent Property WwiseEvent_QST_CF07_TakeModule Auto Const mandatory
EndGroup

Int Property CONST_ReactorState_Active = 0 Auto Const hidden
Int Property CONST_ReactorState_Inactive = 1 Auto Const hidden
Int Property CONST_ReactorState_Destroyed = 2 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_Reset = 0 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_HalfPower = 1 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_Powered = 2 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert = 3 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_DownloadFinished = 4 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval = 5 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_Shutdown = 6 Auto Const hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnQuestInit()
  spaceshipreference erebosShipRef = ErebosShip.GetShipRef()
  Self.RegisterForRemoteEvent(erebosShipRef as ScriptObject, "OnShipDock")
  SpaceCellShips.AddRef(LegacyShip.GetRef())
  SpaceCellShips.AddRef(ErebosShip.GetRef())
  vaultCredTankManagerRef = VaultCredTankManager.GetRef() as lc107credtanksystemrefscript
  vaultEntranceControlRef = VaultEntranceControl.GetRef()
  vaultPowerSwitch01Ref = VaultPowerSwitch01.GetRef()
  vaultPowerSwitch02Ref = VaultPowerSwitch02.GetRef()
  vaultPowerSwitch01LightRef = VaultPowerSwitch01Light.GetRef() as genericswitchscript
  vaultPowerSwitch02LightRef = VaultPowerSwitch02Light.GetRef() as genericswitchscript
  vaultControlsTransferModuleSlot01Ref = VaultControlsTransferModuleSlot01.GetRef()
  vaultControlsTransferModuleSlot02Ref = VaultControlsTransferModuleSlot02.GetRef()
  vaultControlsDataCoreSlotRef = VaultControlsDataCoreSlot.GetRef()
  vaultControlsDownloadControlRef = VaultControlsDownloadControl.GetRef()
  vaultControlsStatusIndicatorRef = VaultControlsStatusIndicator.GetRef()
  crimsonFleetAliasContainerRef = CrimsonFleetAliasContainer.GetRef()
  vaultEntranceControlRef.BlockActivation(True, False)
  vaultPowerSwitch01Ref.BlockActivation(True, True)
  vaultPowerSwitch02Ref.BlockActivation(True, True)
  vaultControlsTransferModuleSlot01Ref.BlockActivation(True, False)
  vaultControlsTransferModuleSlot02Ref.BlockActivation(True, False)
  vaultControlsDataCoreSlotRef.BlockActivation(True, False)
  vaultControlsDownloadControlRef.BlockActivation(True, False)
  Self.RegisterForRemoteEvent(PlayerShip.GetShipRef() as ScriptObject, "OnShipDock")
  Self.RegisterForRemoteEvent(LegacyShip.GetShipRef() as ScriptObject, "OnCellLoad")
  Self.RegisterForRemoteEvent(vaultEntranceControlRef as ScriptObject, "OnCellLoad")
  Self.RegisterForRemoteEvent(vaultEntranceControlRef as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(vaultPowerSwitch01Ref as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(vaultPowerSwitch02Ref as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(vaultControlsTransferModuleSlot01Ref as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(vaultControlsTransferModuleSlot02Ref as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(vaultControlsDataCoreSlotRef as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(vaultControlsDownloadControlRef as ScriptObject, "OnActivate")
EndEvent

Function DEBUG_GoToSpaceAndWait(Bool shouldAddCF07Modules)
  inputenablelayer myEnableLayer = inputenablelayer.Create()
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  Actor playerRef = Game.GetPlayer()
  playerRef.AddPerk(Skill_Piloting, False)
  playerRef.AddPerk(Skill_Piloting, False)
  playerRef.AddPerk(Skill_Piloting, False)
  playerRef.AddPerk(Skill_Piloting, False)
  spaceshipreference playerShipRef = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShip as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True)
  SQ_PlayerShip.ResetPlayerShip(playerShipRef)
  SQ_PlayerShip.ResetHomeShip(playerShipRef)
  playerShipRef.AddItem(ShipRepairKit as Form, 20, False)
  playerRef.MoveTo(playerShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
  SQ_PlayerShip.HandleShipTakeOff(True, False)
  PlayerShipPilotSeat.GetRef().Activate(playerRef as ObjectReference, False)
  myEnableLayer.Delete()
  waitingForPlayerToSit = True
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit")
  While waitingForPlayerToSit
    Utility.Wait(0.5)
  EndWhile
  If shouldAddCF07Modules
    Self.DEBUG_ChangeCF07ModuleData(True, True)
  EndIf
  SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, playerShipRef)
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False
EndEvent

Function DEBUG_ChangeCF07ModuleData(Bool shouldHaveComspike, Bool shouldHaveCondictionGrid)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  If shouldHaveComspike
    playerShipRef.SetValue(CF05_ComSpike_AV, 1.0)
  Else
    playerShipRef.SetValue(CF05_ComSpike_AV, 0.0)
  EndIf
  If shouldHaveCondictionGrid
    playerShipRef.SetValue(CF06_ConductionGrid_AV, 1.0)
  Else
    playerShipRef.SetValue(CF06_ConductionGrid_AV, 0.0)
  EndIf
EndFunction

Event ObjectReference.OnCellLoad(ObjectReference akSource)
  If (akSource == LegacyShip.GetShipRef() as ObjectReference) && Self.GetStageDone(CONST_LegacyShipAccessibleStage) && !Self.GetStageDone(CONST_LegacyShipDockedStage)
    Self.UpdateArrivalProcess()
  ElseIf akSource == vaultEntranceControlRef && !initializedPackins
    Self.CallFunctionNoWait("CredTanksInit", None)
    Self.CallFunctionNoWait("HullBreachesInit", None)
  EndIf
EndEvent

Function UpdateArrivalProcess()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  spaceshipreference legacyShipRef = LegacyShip.GetShipRef()
  Bool hasConductionGrid = playerShipRef.GetValue(CF06_ConductionGrid_AV) > 0.0
  Float distanceFromLegacy = playerShipRef.GetDistance(legacyShipRef as ObjectReference)
  If hasConductionGrid && Companion.GetRef() != None
    If !Self.GetStageDone(CONST_LegacyShipArrivalStage)
      Self.SetStage(CONST_LegacyShipArrivalStage)
    ElseIf !Self.GetStageDone(CONST_LegacyShipMidwayStage)
      If distanceFromLegacy > CONST_LegacyShipMidwayDistance as Float
        Self.RegisterForDistanceLessThanEvent(playerShipRef as ScriptObject, legacyShipRef as ScriptObject, CONST_LegacyShipMidwayDistance as Float, 0)
      Else
        Self.SetStage(CONST_LegacyShipMidwayStage)
      EndIf
    ElseIf !Self.GetStageDone(CONST_LegacyShipDiscoveryStage)
      If distanceFromLegacy > CONST_LegacyShipDiscoveryDistance as Float
        Self.RegisterForDistanceLessThanEvent(playerShipRef as ScriptObject, legacyShipRef as ScriptObject, CONST_LegacyShipDiscoveryDistance as Float, 0)
      Else
        Self.SetStage(CONST_LegacyShipDiscoveryStage)
      EndIf
    EndIf
  ElseIf distanceFromLegacy > CONST_LegacyShipDiscoveryDistance as Float
    Self.RegisterForDistanceLessThanEvent(playerShipRef as ScriptObject, legacyShipRef as ScriptObject, CONST_LegacyShipDiscoveryDistance as Float, 0)
  Else
    Self.SetStage(CONST_LegacyShipMapMarkerRevealStage)
  EndIf
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.UpdateArrivalProcess()
EndEvent

Event SpaceshipReference.OnShipDock(spaceshipreference akSource, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If akSource == PlayerShip.GetShipRef() && akParent == LegacyShip.GetShipRef()
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipDock")
    Self.SetStage(190)
  ElseIf akSource == ErebosShip.GetShipRef() && akParent == LegacyShip.GetShipRef()
    SQ_Parent.SetupDamagedShip(ErebosShip.GetShipRef(), False, True, False, False, True, True, ErebosActorValuesToDamage)
  EndIf
EndEvent

Function SetVaultControlsPowerStatus(Int status)
  If status == CONST_VaultControlsPowerStatus_HalfPower
    QST_CF07_Power_Half.Play(vaultControlsDataCoreSlotRef, None, None)
  ElseIf status == CONST_VaultControlsPowerStatus_Powered
    QST_CF07_Power_Full.Play(vaultControlsDataCoreSlotRef, None, None)
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage01_Start")
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Start")
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Start")
    Utility.Wait(0.100000001)
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Loop")
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Loop")
    vaultControlsTransferModuleSlot01Ref.PlayAnimation("TurnOnFull")
    vaultControlsTransferModuleSlot02Ref.PlayAnimation("TurnOnFull")
  ElseIf status == CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Start")
    Utility.Wait(0.100000001)
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Loop")
  ElseIf status == CONST_VaultControlsPowerStatus_DownloadFinished
    vaultControlsDownloadControlRef.PlayAnimation("Play02")
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Stop")
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Loop")
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Loop")
  ElseIf status == CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Loop")
  ElseIf status == CONST_VaultControlsPowerStatus_Shutdown
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage01_Stop")
    vaultPowerSwitch01LightRef.SetState("Off")
    vaultPowerSwitch02LightRef.SetState("Off")
  EndIf
EndFunction

Function UnblockVaultPowerSwitches()
  vaultPowerSwitch01Ref.BlockActivation(False, False)
  vaultPowerSwitch02Ref.BlockActivation(False, False)
EndFunction

Function ProcessOnActivate(ObjectReference akSource, ObjectReference akActionRef)
  If akSource == vaultEntranceControlRef
    If !Self.GetStageDone(CONST_OpenVaultEntranceDoorStage)
      If Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) == 0
        LC107_GalbankTransferModuleNeededMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        CF07_zLegacy001_Callout_NoTransferModule.Start()
      Else
        vaultEntranceControlRef.BlockActivation(True, True)
        vaultEntranceControlRef.PlayAnimationAndWait("Play01", "Done")
        Self.SetStageNoWait(CONST_OpenVaultEntranceDoorStage)
        vaultEntranceControlRef.PlayAnimation("Play02")
      EndIf
    EndIf
  ElseIf akSource == vaultPowerSwitch01Ref
    vaultPowerSwitch01Ref.BlockActivation(True, True)
    vaultPowerSwitch01LightRef.SetColor("White")
    Self.SetStage(CONST_VaultPowerSwitch01ReroutedStage)
  ElseIf akSource == vaultPowerSwitch02Ref
    vaultPowerSwitch02Ref.BlockActivation(True, True)
    vaultPowerSwitch02LightRef.SetColor("White")
    Self.SetStage(CONST_VaultPowerSwitch02ReroutedStage)
  ElseIf akSource == vaultControlsTransferModuleSlot01Ref
    Guard TransferModuleSlot01ActivationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If !Self.GetStageDone(CONST_VaultPowerReroutedStage)
        LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        CF07_zLegacy003_Callout_ConsoleLowPower.Start()
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule01InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) == 0
        LC107_GalbankTransferModuleNeededMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule01InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) > 0
        Game.GetPlayer().RemoveItem(CF_GalbankTransferModule as Form, 1, False, crimsonFleetAliasContainerRef)
        Self.GoToState("Waiting")
        vaultControlsTransferModuleSlot01Ref.PlayAnimationAndWait("Play01", "Done")
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Start")
        Self.SetStage(CONST_VaultTransferModule01InsertedStage)
      ElseIf !Self.GetStageDone(CONST_VaultDataTransferCompleteStage)
        LC107_GalbankTransferModuleLockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule01RemovedStage)
        vaultControlsTransferModuleSlot01Ref.BlockActivation(True, True)
        Self.GoToState("Waiting")
        vaultControlsTransferModuleSlot01Ref.PlayAnimationAndWait("Play02", "Done")
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Stop")
        Game.GetPlayer().AddItem(CaptainTransferModule.GetRef() as Form, 1, False)
        Self.SetStage(CONST_VaultTransferModule01RemovedStage)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  ElseIf akSource == vaultControlsTransferModuleSlot02Ref
    Guard TransferModuleSlot02ActivationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If !Self.GetStageDone(CONST_VaultPowerReroutedStage)
        LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        CF07_zLegacy003_Callout_ConsoleLowPower.Start()
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule02InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) == 0
        LC107_GalbankTransferModuleNeededMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule02InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) > 0
        Game.GetPlayer().RemoveItem(CF_GalbankTransferModule as Form, 1, False, crimsonFleetAliasContainerRef)
        Self.GoToState("Waiting")
        vaultControlsTransferModuleSlot02Ref.PlayAnimationAndWait("Play01", "Done")
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Start")
        Self.SetStage(CONST_VaultTransferModule02InsertedStage)
      ElseIf !Self.GetStageDone(CONST_VaultDataTransferCompleteStage)
        LC107_GalbankTransferModuleLockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule02RemovedStage)
        vaultControlsTransferModuleSlot02Ref.BlockActivation(True, True)
        Self.GoToState("Waiting")
        vaultControlsTransferModuleSlot02Ref.PlayAnimationAndWait("Play02", "Done")
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Stop")
        Game.GetPlayer().AddItem(JasperKryxTransferModule.GetRef() as Form, 1, False)
        Self.SetStage(CONST_VaultTransferModule02RemovedStage)
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  ElseIf akSource == vaultControlsDataCoreSlotRef
    If !Self.GetStageDone(CONST_VaultPowerReroutedStage)
      LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      CF07_zLegacy003_Callout_ConsoleLowPower.Start()
    ElseIf !Self.GetStageDone(CONST_VaultTransferModulesInsertedStage)
      LC107_GalbankDataCorePortNeedsTransferModulesMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreInsertedStage)
      Game.GetPlayer().RemoveItem(DataCoreEmpty.GetRef() as Form, 1, False, None)
      vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play01", "Done")
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Start")
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Start")
      Utility.Wait(0.100000001)
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Loop")
      Self.SetStage(CONST_VaultDataCoreInsertedStage)
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreReadyForRemovalStage)
      LC107_DataCoreLockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.DisableFastTravelOnLegacy()
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreRemovedStage)
      vaultControlsDataCoreSlotRef.BlockActivation(True, True)
      WwiseEvent_QST_CF07_TakeModule.Play(vaultControlsDataCoreSlotRef, None, None)
      vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play02", "Done")
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Stop")
      Self.LockPlayerForEscape()
      Game.GetPlayer().AddItem(DataCoreFull.GetRef() as Form, 1, False)
      Self.SetStage(CONST_VaultDataCoreRemovedStage)
    EndIf
  ElseIf akSource == vaultControlsDownloadControlRef
    If !Self.GetStageDone(CONST_VaultPowerReroutedStage)
      LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      CF07_zLegacy003_Callout_ConsoleLowPower.Start()
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreInsertedStage)
      LC107_GalbankDownloadControlNeedsDataCoreMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf !Self.GetStageDone(CONST_VaultDownloadControlActivatedStage)
      vaultControlsDownloadControlRef.BlockActivation(True, True)
      vaultControlsDownloadControlRef.PlayAnimationAndWait("Play01", "Done")
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Stop")
      Utility.Wait(0.100000001)
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Start")
      Self.SetStage(CONST_VaultDownloadControlActivatedStage)
    EndIf
  EndIf
EndFunction

Function CredTanksInit()
  Float startTime = Utility.GetCurrentRealTime()
  Self.StartCredTankOperation()
  vaultCredTankManagerRef.PerformInitialRegistration(None)
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Initialize)
  Self.WaitForCredTankOperation()
  initializedPackins = True
EndFunction

Function CredTanksBoot()
  Float startTime = Utility.GetCurrentRealTime()
  Self.StartCredTankOperation()
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Boot)
  Self.WaitForCredTankOperation()
EndFunction

Function CredTanksDrain()
  Float startTime = Utility.GetCurrentRealTime()
  Self.StartCredTankOperation()
  Var[] akArgs = new Var[1]
  akArgs[0] = startTime as Var
  Self.CallFunctionNoWait("CredTanksDrain02", akArgs)
EndFunction

Function CredTanksDrain02(Float startTime)
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Drain)
  Self.WaitForCredTankOperation()
  waitingForCredTanksDrain = False
EndFunction

Function CredTanksShutdown()
  waitingForCredTanksShutdown = True
  Float startTime = Utility.GetCurrentRealTime()
  Self.StartCredTankOperation()
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Shutdown)
  Self.WaitForCredTankOperation()
  waitingForCredTanksShutdown = False
EndFunction

Function StartCredTankOperation()
  LC107CredTankShelvesCurrentGlobal.SetValue(0.0)
EndFunction

Function WaitForCredTankOperation()
  Int current = LC107CredTankShelvesCurrentGlobal.GetValueInt()
  Int total = LC107CredTankShelvesTotalGlobal.GetValueInt()
  Int failsafe = 0
  While current < total && failsafe < CONST_CredTankOperationFailsafe
    Utility.Wait(0.25)
    failsafe += 1
    current = LC107CredTankShelvesCurrentGlobal.GetValueInt()
  EndWhile
  If failsafe == CONST_CredTankOperationFailsafe
    
  EndIf
EndFunction

Function WaitForCredTankInitialization()
  Int failsafe = 0
  While !initializedPackins && failsafe < CONST_CredTankInitFailsafe
    Utility.Wait(0.5)
    failsafe += 1
  EndWhile
  If failsafe == CONST_CredTankInitFailsafe
    initializedPackins = True
  EndIf
EndFunction

Function DEBUG_ForceDataTransfer()
  vaultControlsDataCoreSlotRef.BlockActivation(True, True)
  vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play01", "Done")
  vaultControlsDataCoreSlotRef.PlayAnimation("Stage04_Stop")
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", 0.0)
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 10.0)
  Self.PerformCredTankDataTransfer()
EndFunction

Function PerformCredTankDataTransfer()
  QST_CF07_ServerRoom_Activate.Play(vaultControlsDataCoreSlotRef, None, None)
  Self.CredTanksBoot()
  Utility.Wait(3.0)
  waitingForCredTanksDrain = True
  Self.CredTanksDrain()
  QST_CF07_ServerRoom_Deactivate.Play(vaultControlsDataCoreSlotRef, None, None)
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 0.100000001)
  Float current = LC107CredTankShelvesCurrentGlobal.GetValueInt() as Float
  Float total = LC107CredTankShelvesTotalGlobal.GetValueInt() as Float
  Float currentPercent = current / total
  QST_CF07_Data_Transfer_LP_Start.Play(vaultControlsDataCoreSlotRef, None, None)
  While waitingForCredTanksDrain && currentPercent < CONST_CredTankDrainPercentMax
    vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", currentPercent)
    Utility.Wait(0.200000003)
    current = LC107CredTankShelvesCurrentGlobal.GetValueInt() as Float
    currentPercent = current / total
  EndWhile
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", CONST_CredTankDrainPercentMax)
  QST_CF07_Data_Transfer_LP_Stop.Play(vaultControlsDataCoreSlotRef, None, None)
  Utility.Wait(2.0)
EndFunction

Function PopupDataCore()
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 0.100000001)
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", 1.0)
  Utility.Wait(CONST_DataCorePopupDelay)
EndFunction

Function PlayBreachSequenceStartVFX()
  Game.SetInChargen(True, True, False)
EndFunction

Function PlayBreachSequenceEndVFX()
  Game.SetInChargen(False, False, False)
  breachSequenceExplosionsActive = False
EndFunction

Function SetNotSealedEnvironment()
  LC107LegacyShipLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment)
EndFunction

Function WaitForBreachesAndCredTanks()
  While waitingForCredTanksShutdown
    Utility.Wait(0.25)
  EndWhile
  While waitingForVaultInstantBreaches
    Utility.Wait(0.25)
  EndWhile
EndFunction

Function HullBreachesInit()
  lc107hullbreachscript[] hullBreaches = HullBreachesAll.GetArray() as lc107hullbreachscript[]
  Int I = 0
  While I < hullBreaches.Length
    If hullBreaches[I] != None
      hullBreaches[I].InitHullBreach()
    EndIf
    I += 1
  EndWhile
EndFunction

Function BreakVaultInstantBreaches()
  waitingForVaultInstantBreaches = True
  lc107hullbreachscript[] hullBreachesVault = HullBreachesInstantBreakVault.GetArray() as lc107hullbreachscript[]
  Int totalInstantBreaches = hullBreachesVault.Length
  Var[] akArgs = new Var[1]
  akArgs[0] = True as Var
  Int I = 0
  While I < totalInstantBreaches
    lc107hullbreachscript currentBreach = hullBreachesVault[I]
    If currentBreach != None
      currentBreach.CallFunctionNoWait("TriggerBreach", akArgs)
    EndIf
    I += 1
  EndWhile
  Int currentInstantBreaches = LC107VaultInstantBreachesCurrentGlobal.GetValueInt()
  While currentInstantBreaches < totalInstantBreaches
    Utility.Wait(0.25)
    currentInstantBreaches = LC107VaultInstantBreachesCurrentGlobal.GetValueInt()
  EndWhile
  waitingForVaultInstantBreaches = False
EndFunction

Function BreakOtherInstantBreaches()
  Int I = 0
  lc107hullbreachscript[] hullBreachesOther = HullBreachesInstantBreak.GetArray() as lc107hullbreachscript[]
  Var[] akArgs = new Var[1]
  akArgs[0] = False as Var
  While I < hullBreachesOther.Length
    lc107hullbreachscript currentBreach = hullBreachesOther[I]
    If currentBreach != None
      currentBreach.CallFunctionNoWait("TriggerBreach", akArgs)
    EndIf
    I += 1
  EndWhile
EndFunction

Function DamageDestructibleTraps()
  Utility.Wait(15.0)
  ObjectReference[] destructibleTrapRefs = DestructibleTraps.GetArray()
  Int I = 0
  While I < destructibleTrapRefs.Length
    ObjectReference currentTrap = destructibleTrapRefs[I]
    currentTrap.DamageObject(currentTrap.GetValue(Health) - 3.0)
    I += 1
  EndWhile
EndFunction

Function StartBreachSequenceExplosions()
  breachSequenceExplosionsActive = True
  Self.StartTimer(0.0, CONST_BreachSequenceExplosionTimerID)
EndFunction

Function StartAmbientExplosions(Int newAmbientExplosionLevel)
  Guard AmbientExplosionDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ambientExplosionLevel = newAmbientExplosionLevel
    Self.StartTimer(0.0, CONST_AmbientExplosionTimerID)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StartAmbientExplosionTimer()
  Guard AmbientExplosionDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.StartTimer(Utility.RandomFloat(AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMin, AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMax), CONST_AmbientExplosionTimerID)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_BreachSequenceExplosionTimerID
    Self.CancelTimer(CONST_BreachSequenceExplosionTimerID)
    Float rumbleTime = Utility.RandomFloat(CONST_BreachSequenceRumbleTimeMin, CONST_BreachSequenceRumbleTimeMax)
    Game.GetPlayer().RampRumble(Utility.RandomFloat(CONST_BreachSequenceRumblePowerMin, CONST_BreachSequenceRumblePowerMax), rumbleTime, 1600.0)
    Utility.Wait(rumbleTime)
    If breachSequenceExplosionsActive
      Self.StartTimer(Utility.RandomFloat(CONST_BreachSequenceRumbleDelayMin, CONST_BreachSequenceRumbleDelayMax), CONST_BreachSequenceExplosionTimerID)
    EndIf
  ElseIf timerID == CONST_AmbientExplosionTimerID && !debugBlockAmbientExplosions
    Guard AmbientExplosionDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
      If Game.GetPlayer().GetParentCell() == LC107Legacy01
        Self.TriggerExplosion(AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMin, AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMax, None)
        Float currentTime = Utility.GetCurrentRealTime()
        If evacuationSceneLastPlayedTime == 0.0 || currentTime < evacuationSceneLastPlayedTime
          evacuationSceneLastPlayedTime = currentTime
        ElseIf currentTime > (evacuationSceneLastPlayedTime + CONST_EvacuationSceneRepeatDelay as Float)
          evacuationSceneLastPlayedTime = currentTime
          CF07_zLegacy007_Evacuate_HullBreach.Start()
        EndIf
      EndIf
      If !Self.GetStageDone(CONST_LegacyEscapeCompleteStage)
        Self.StartAmbientExplosionTimer()
      EndIf
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  EndIf
EndEvent

Function TriggerExplosion(Int ExplosionSizeMin, Int ExplosionSizeMax, ObjectReference explosionSource)
  Bool isSpawnedExplosionSource = False
  If explosionSource == None
    isSpawnedExplosionSource = True
    Float[] offsets = new Float[3]
    offsets[0] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinX as Float, CONST_AmbientExplosionOffsetMaxX as Float)
    offsets[1] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinY as Float, CONST_AmbientExplosionOffsetMaxY as Float)
    offsets[2] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinZ as Float, CONST_AmbientExplosionOffsetMaxZ as Float)
    If Utility.RandomInt(0, 1) == 0
      offsets[0] = offsets[0] * -1.0
    EndIf
    explosionSource = Game.GetPlayer().PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, offsets, None, True)
  EndIf
  Explosion explosionToSpawn = None
  If ExplosionSizeMin == ExplosionSizeMax
    explosionToSpawn = HullBreachExplosions[ExplosionSizeMin]
  Else
    explosionToSpawn = HullBreachExplosions[Utility.RandomInt(ExplosionSizeMin, ExplosionSizeMax)]
  EndIf
  ObjectReference spawnedExplosion = explosionSource.PlaceAtMe(explosionToSpawn as Form, 1, False, False, True, None, None, True)
  If isSpawnedExplosionSource
    explosionSource.Delete()
  EndIf
EndFunction

Function DEBUG_BlockAmbientExplosions()
  debugBlockAmbientExplosions = True
EndFunction

Function DEBUG_SetAmbientExplosionValues(Int sizeMin, Int sizeMax, Int delayMin, Int delayMax)
  AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMin = sizeMin
  AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMax = sizeMax
  AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMin = delayMin as Float
  AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMax = delayMax as Float
EndFunction

Function ResetStandardCredTanks()
  cfcredtankscript[] standardTanks = StandardCredTanks.GetArray() as cfcredtankscript[]
  Int I = 0
  While I < standardTanks.Length
    standardTanks[I].ResetCredTank()
    I += 1
  EndWhile
EndFunction

Function SetReactorState(RefCollectionAlias reactorCol, Int newState)
  reactorfloormida01script[] reactors = reactorCol.GetArray() as reactorfloormida01script[]
  Int I = 0
  While I < reactors.Length
    reactors[I].SetReactorState(newState, False)
    I += 1
  EndWhile
EndFunction

Function DisableFastTravelOnLegacy()
  If LC107EnableLayer == None
    LC107EnableLayer = inputenablelayer.Create()
  EndIf
  LC107EnableLayer.EnableFastTravel(False)
EndFunction

Function LockPlayerForEscape()
  Self.DisableFastTravelOnLegacy()
  LC107EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  Game.SetInChargen(True, True, False)
EndFunction

Function UnlockPlayerMovement()
  LC107EnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  Game.SetInChargen(False, False, False)
EndFunction

Function UnlockFastTravel()
  If LC107EnableLayer != None
    LC107EnableLayer.EnableFastTravel(True)
    LC107EnableLayer.Delete()
  EndIf
EndFunction

Function Cleanup()
  vaultEntranceControlRef = None
  vaultPowerSwitch01Ref = None
  vaultPowerSwitch02Ref = None
  vaultPowerSwitch01LightRef = None
  vaultPowerSwitch02LightRef = None
  vaultControlsTransferModuleSlot01Ref = None
  vaultControlsTransferModuleSlot02Ref = None
  vaultControlsDataCoreSlotRef = None
  vaultControlsDownloadControlRef = None
  vaultControlsStatusIndicatorRef = None
  crimsonFleetAliasContainerRef = None
  vaultCredTankManagerRef = None
EndFunction

;-- State -------------------------------------------
State ProcessingActivation
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
    Self.GoToState("ProcessingActivation")
    Self.ProcessOnActivate(akSource, akActionRef)
    Self.GoToState("Waiting")
  EndEvent
EndState
