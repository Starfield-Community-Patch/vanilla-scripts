ScriptName MQ207CQuestScript Extends Quest conditional
{ Quest script for MQ207C, Entangled. }

;-- Variables ---------------------------------------
Int CONST_ActivatePrimaryCalibrationStage = 770 Const
Int CONST_AllEndingsCommonStage = 900 Const
Int CONST_AllInterlocksShutDown_I_Stage = 712 Const
Int CONST_DamageToFreeArtifact = 99 Const
Int CONST_DisengagePowerInterlocksObjective = 700 Const
Int CONST_EmergencyShutdownTriggeredStage_I = 721 Const
Int CONST_EmergencyShutdownTriggeredStage_II = 722 Const
Int CONST_EnteredResearchLabStage = 700 Const
Float CONST_FrequencyMultiplier = 0.25 Const
Int CONST_Frequency_FrequencyOutputInitial_I = 34 Const
Int CONST_Frequency_FrequencyOutputInitial_II = 34 Const
Int CONST_Frequency_FrequencyOutputTarget_I = 40 Const
Int CONST_Frequency_FrequencyOutputTarget_II = 24 Const
Int CONST_GiveTheArtifactStage_III = 790 Const
Int CONST_HalfInterlocksShutDownCount = 4 Const
Int CONST_HalfInterlocksShutDown_I_Stage = 711 Const
Int CONST_LockLevel_RequiresKey = 255 Const
Int CONST_MQ207CArtifactID = 12 Const
Int CONST_MaxInterlocksToDegauss = 4 Const
Int CONST_MinInterlocksToDegauss = 2 Const
Int CONST_MusicOverrideUpdateTimerDelay = 3 Const
Int CONST_MusicOverrideUpdateTimerID = 1 Const
Int CONST_PlayerSitInBedFurnitureStage_III = 933 Const
Int CONST_QuickstartLevel = 24 Const
Int CONST_ReachedSecurityOfficeStage = 450 Const
Int CONST_ShutDownTheProbeObjective = 710 Const
Int CONST_SpeakToMariaStage = 500 Const
Int CONST_StorageCorridorShiftBackStageToSet = 155 Const
Int CONST_StorageRoomGaveFoodStage = 27 Const
Int CONST_TakeTheArtifactStage_I = 721 Const
Int CONST_TakeTheArtifactStage_II = 722 Const
Int CONST_TookTheArtifactStage_I = 731 Const
Int CONST_TookTheArtifactStage_II = 732 Const
Int CONST_WaitForTheExperimentStage_III = 780 Const
inputenablelayer MQ207CInputEnableLayer
ObjectReference NishinaExt_ExteriorDoor_I_Ref
ObjectReference NishinaExt_IntercomRef
genericswitchscript PrimaryCalibration_I
genericswitchscript PrimaryCalibration_II
ObjectReference artifactActivator_I
ObjectReference artifactActivator_II
genericswitchscript emergencyShutdown_I
genericswitchscript emergencyShutdown_II
Float frequencyIntake_I
Float frequencyIntake_II
Int frequencyOutput_I
Int frequencyOutput_II
Bool hasCompletedOnQuestInit
Bool hasCompletedStartupStage
Bool hasStartedStorageCorridorReturnShift
Bool initializedResearchLabEvent
ObjectReference labControlTerminal_I
ObjectReference labControlTerminal_II
Bool musicOverrideActive
Actor player
genericswitchscript[] powerInterlocksRemaining_I
genericswitchscript[] powerInterlocksRemaining_II
genericswitchscript[] powerInterlocksToDegauss_I
genericswitchscript[] powerInterlocksToDegauss_II
genericswitchscript[] powerInterlocks_I
genericswitchscript[] powerInterlocks_II
mq207cshiftingquestscript selfAsShiftingQuest
Int totalInterlocks

;-- Properties --------------------------------------
Group QuestProperties
  String[] Property AttackAnimEventNames Auto Const mandatory
  { Array of animation events that indicate the player is attacking. In the Storage Corridor event, register for these events and shift in response. }
  Perk[] Property QuickstartPerks Auto Const mandatory
  { Array of perks to give the player for quickstarts, to satisfy dialogue condition checks. }
EndGroup

Group AutofillProperties
  ReferenceAlias Property AnnouncementMarker Auto Const mandatory
  ReferenceAlias Property Alias_EthanHughes Auto Const mandatory
  ReferenceAlias Property Alias_MariaHughes Auto Const mandatory
  ReferenceAlias Property Alias_DirectorPatel Auto Const mandatory
  ReferenceAlias Property Alias_RafaelAguerro Auto Const mandatory
  ReferenceAlias Property NishinaExt_LandingPadWaitMarker Auto Const mandatory
  ReferenceAlias Property NishinaExt_ExteriorDoor_I Auto Const mandatory
  ReferenceAlias Property NishinaExt_Intercom Auto Const mandatory
  ReferenceAlias Property Nishina01_StorageCorridorFailsafeMarker_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave2Activator_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave3Activator_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave2Activator_II Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave3Activator_II Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomMusicTrigger_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomMusicTrigger_II Auto Const mandatory
  ReferenceAlias Property Nishina02_PowerInterlockChainHead_I Auto Const mandatory
  ReferenceAlias Property Nishina02_PowerInterlockChainHead_II Auto Const mandatory
  ReferenceAlias Property Nishina02_EmergencyShutdown_I Auto Const mandatory
  ReferenceAlias Property Nishina02_EmergencyShutdown_II Auto Const mandatory
  ReferenceAlias Property Nishina02_LabControlTerminal_I Auto Const mandatory
  ReferenceAlias Property Nishina02_LabControlTerminal_II Auto Const mandatory
  ReferenceAlias Property Nishina02_PrimaryCalibration_I Auto Const mandatory
  ReferenceAlias Property Nishina02_PrimaryCalibration_II Auto Const mandatory
  ReferenceAlias Property Nishina01_DrOfficeBedFurniture_III Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactActivator_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactActivator_II Auto Const mandatory
  ReferenceAlias Property MQ207B_Artifact02QuestObject Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeamLights_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeamLights_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_ArtifactBeckonSFX_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_ArtifactBeckonSFX_II Auto Const mandatory
  RefCollectionAlias Property Nishina01_GuidanceTriggers_II Auto Const mandatory
  RefCollectionAlias Property Nishina01_StorageCorridorCreatures_II Auto Const mandatory
  RefCollectionAlias Property Nishina01_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_Alarms_All_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_RobotsAndTurrets_All_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_RobotsToDisablePostquest_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_PowerInterlocks_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_PowerInterlocks_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeams_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeams_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeamHazards Auto Const mandatory
  RefCollectionAlias Property Nishina02_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_TerminalsAll Auto Const mandatory
  RefCollectionAlias Property Nishina02_SecurityCameras_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_SecurityCameras_II Auto Const mandatory
  GlobalVariable Property MQ207CTotalInterlockCountGlobal Auto Const mandatory
  GlobalVariable Property MQ207CCurrentInterlockCountGlobal Auto Const mandatory
  ActorValue Property MQ207C_PowerInterlockIDValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalUniverseValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalDegaussingCountValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalDegaussingActiveValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalCalibrationActiveValue Auto Const mandatory
  Message Property MQ207C_QuickstartLevelForceMessage Auto Const mandatory
  Message Property MQ207C_PowerInterlockNotRespondingMessage Auto Const mandatory
  Message Property MQ207C_EmergencyShutdownNotReadyMessage Auto Const mandatory
  Message Property MQ207C_EmergencyShutdownAlreadyUsedMessage Auto Const mandatory
  Message Property MQ207C_PrimaryCalibrationNotReadyMessage Auto Const mandatory
  Message Property MQ207C_PrimaryCalibrationAlreadyUsedMessage Auto Const mandatory
  Message Property MQ207C_PowerInterlock_Engage Auto Const mandatory
  Message Property MQ207C_PowerInterlock_Disengage Auto Const mandatory
  Message Property MQ207C_ShutdownWarningMessage Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_04_Unsolved_Unstable_FlickerFast_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_01_Solved_Off_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_03_Unsolved_Unstable_Flicker_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_01_Laser_Experiment_01_Machine_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_01_Laser_Experiment_02_Laser_Beam_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_01_Laser_Experiment_03_Impact_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_02_Laser_Experiment_01_Machine_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_02_Laser_Experiment_02_Laser_Beam_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_02_Laser_Experiment_03_Impact_MarkerRef Auto Const mandatory
  starborntemplequestscript Property StarbornTempleQuest Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  wwiseevent Property WwiseEvent_DRSRemoteUnlock Auto Const mandatory
  Static Property XMarkerHeading Auto Const mandatory
  FormList Property FilterList_InventoryCategoryAidFood Auto Const mandatory
  Faction Property MQ207CNishinaEscortFaction Auto Const mandatory
  Faction Property MQ207CNishinaIEnemyFaction Auto Const mandatory
  Faction Property MQ207CNishinaIFaction Auto Const mandatory
  ActorValue Property AmbushTriggered Auto Const mandatory
  ActorValue Property Experience Auto Const mandatory
  ActorValue Property MQ207C_Nishina01GuidanceTriggerValue Auto Const mandatory
  MusicType Property MUSGenesisCombat_MQ207C_Nishina Auto Const mandatory
  wwiseevent Property QST_MQ207C_Elevator_Activate_Fail_WEF Auto Const mandatory
  wwiseevent Property OBJ_Mq207C_Alarm_Science_Station_Lockdown_End_WEF Auto Const mandatory
EndGroup

Bool Property frequencyStable Auto conditional hidden
Bool Property allPowerInterlocksEngaged_I Auto conditional hidden
Bool Property allPowerInterlocksEngaged_II Auto conditional hidden
Bool Property degaussingStarted_I Auto conditional hidden
Bool Property degaussingStarted_II Auto conditional hidden
Bool Property allPowerInterlocksDegaussed_I Auto conditional hidden
Bool Property allPowerInterlocksDegaussed_II Auto conditional hidden
Bool Property frequencyCalibrationStarted_I Auto conditional hidden
Bool Property frequencyCalibrationStarted_II Auto conditional hidden
Bool Property PrimaryCalibrationEngaged_I Auto conditional hidden
Bool Property PrimaryCalibrationEngaged_II Auto conditional hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function
EndEvent

Event OnQuestInit()
  player = Game.GetPlayer()
  selfAsShiftingQuest = (Self as Quest) as mq207cshiftingquestscript
  NishinaExt_IntercomRef = NishinaExt_Intercom.GetRef()
  NishinaExt_ExteriorDoor_I_Ref = NishinaExt_ExteriorDoor_I.GetRef()
  Alias_EthanHughes.TryToReset()
  Alias_MariaHughes.TryToReset()
  Alias_DirectorPatel.TryToReset()
  Alias_RafaelAguerro.TryToReset()
  Nishina01_CreaturesAll_II.ResetAll()
  Nishina02_CreaturesAll_II.ResetAll()
  Nishina02_RobotsAndTurrets_All_I.ResetAll()
  Nishina02_SecurityCameras_I.ResetAll()
  Nishina02_SecurityCameras_II.ResetAll()
  artifactActivator_I = Nishina02_ArtifactActivator_I.GetRef()
  artifactActivator_I.BlockActivation(True, True)
  Self.RegisterForRemoteEvent(artifactActivator_I as ScriptObject, "OnActivate")
  artifactActivator_II = Nishina02_ArtifactActivator_II.GetRef()
  artifactActivator_II.BlockActivation(True, True)
  Self.RegisterForRemoteEvent(artifactActivator_II as ScriptObject, "OnActivate")
  Self.SetRefColCameraState(Nishina02_SecurityCameras_II, False, True)
  ObjectReference powerInterlockChainHead = Nishina02_PowerInterlockChainHead_I.GetRef()
  If powerInterlockChainHead.Is3DLoaded()
    Self.InitResearchLabEvent()
  Else
    Self.RegisterForRemoteEvent(powerInterlockChainHead as ScriptObject, "OnCellLoad")
  EndIf
  hasCompletedOnQuestInit = True
EndEvent

Function StartupStageDone()
  hasCompletedStartupStage = True
EndFunction

Function WaitForStartup()
  While !hasCompletedOnQuestInit || !hasCompletedStartupStage
    Utility.Wait(0.100000001)
  EndWhile
EndFunction

Function AddQuickstartPerks()
  Int I = 0
  While I < QuickstartPerks.Length
    player.AddPerk(QuickstartPerks[I], False)
    I += 1
  EndWhile
EndFunction

Function SetQuickstartLevel()
  Int currentLevel = Game.GetPlayerLevel()
  Float currentXP = Game.GetXPForLevel(currentLevel) as Float
  Float targetXP = Game.GetXPForLevel(CONST_QuickstartLevel) as Float
  player.SetValue(Experience, targetXP - currentXP)
  MQ207C_QuickstartLevelForceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function UnlockExteriorDoor()
  NishinaExt_IntercomRef.BlockActivation(True, True)
  WwiseEvent_DRSRemoteUnlock.Play(NishinaExt_ExteriorDoor_I_Ref, None, None)
  Self.RegisterForRemoteEvent(NishinaExt_ExteriorDoor_I_Ref as ScriptObject, "OnActivate")
  NishinaExt_ExteriorDoor_I_Ref.Unlock(False)
EndFunction

Function BlockFollowersAtExteriorDoor()
  SQ_Followers.AllFollowersWait(NishinaExt_LandingPadWaitMarker.GetRef(), True, False)
EndFunction

Function RegisterForAttackEvents()
  Int I = 0
  While I < AttackAnimEventNames.Length
    Self.RegisterForAnimationEvent(player as ObjectReference, AttackAnimEventNames[I])
    I += 1
  EndWhile
  I = 0
  While I < Nishina01_StorageCorridorCreatures_II.GetCount()
    Self.RegisterForHitEvent(Nishina01_StorageCorridorCreatures_II.GetAt(I) as ScriptObject, player as ScriptObject, None, None, -1, -1, -1, -1, True)
    I += 1
  EndWhile
EndFunction

Function UnregisterForAttackEvents()
  Int I = 0
  While I < AttackAnimEventNames.Length
    Self.UnregisterForAnimationEvent(player as ObjectReference, AttackAnimEventNames[I])
    I += 1
  EndWhile
  I = 0
  While I < Nishina01_StorageCorridorCreatures_II.GetCount()
    Self.UnregisterForHitEvent(Nishina01_StorageCorridorCreatures_II.GetAt(I) as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    I += 1
  EndWhile
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String eventName)
  If AttackAnimEventNames.find(eventName, 0) >= 0
    Self.SetStage(CONST_StorageCorridorShiftBackStageToSet)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.SetStage(CONST_StorageCorridorShiftBackStageToSet)
EndEvent

Function UpdateGuidanceTriggerAV()
  If Self.GetStageDone(CONST_ReachedSecurityOfficeStage) && !Self.GetStageDone(CONST_SpeakToMariaStage)
    ObjectReference[] guidanceTriggerRefs = Nishina01_GuidanceTriggers_II.GetArray()
    Int I = 0
    While I < guidanceTriggerRefs.Length
      If guidanceTriggerRefs[I].IsInTrigger(player as ObjectReference)
        player.SetValue(MQ207C_Nishina01GuidanceTriggerValue, 1.0)
        Return 
      EndIf
      I += 1
    EndWhile
    player.SetValue(MQ207C_Nishina01GuidanceTriggerValue, 0.0)
  EndIf
EndFunction

Function DisableControls(Bool shouldDisableCamSwitch)
  If MQ207CInputEnableLayer == None
    MQ207CInputEnableLayer = inputenablelayer.Create()
  EndIf
  MQ207CInputEnableLayer.DisablePlayerControls(True, True, shouldDisableCamSwitch, False, False, True, True, False, True, True, False)
EndFunction

Function EnableControls()
  If MQ207CInputEnableLayer != None
    MQ207CInputEnableLayer.Reset()
    MQ207CInputEnableLayer.Delete()
    MQ207CInputEnableLayer = None
  EndIf
EndFunction

Event ObjectReference.OnCellLoad(ObjectReference akSource)
  If !initializedResearchLabEvent
    Self.InitResearchLabEvent()
  EndIf
  If Self.GetStageDone(CONST_EnteredResearchLabStage) && Self.GetStage() < CONST_TookTheArtifactStage_I
    Self.StartMusicOverride()
  EndIf
EndEvent

Function InitResearchLabEvent()
  If !initializedResearchLabEvent
    initializedResearchLabEvent = True
    genericswitchscript powerInterlockChainHead_I = Nishina02_PowerInterlockChainHead_I.GetRef() as genericswitchscript
    powerInterlocks_I = powerInterlockChainHead_I.GetLinkedRefChain(None, 100) as genericswitchscript[]
    powerInterlocks_I.insert(powerInterlockChainHead_I, 0)
    powerInterlocksRemaining_I = Self.CopySwitchArray(powerInterlocks_I)
    Nishina02_PowerInterlocks_I.AddArray(powerInterlocks_I as ObjectReference[])
    genericswitchscript powerInterlockChainHead_II = Nishina02_PowerInterlockChainHead_II.GetRef() as genericswitchscript
    powerInterlocks_II = powerInterlockChainHead_II.GetLinkedRefChain(None, 100) as genericswitchscript[]
    powerInterlocks_II.insert(powerInterlockChainHead_II, 0)
    powerInterlocksRemaining_II = Self.CopySwitchArray(powerInterlocks_II)
    Nishina02_PowerInterlocks_II.AddArray(powerInterlocks_II as ObjectReference[])
    If powerInterlocks_I.Length != powerInterlocks_II.Length
      
    EndIf
    totalInterlocks = powerInterlocks_I.Length
    MQ207CTotalInterlockCountGlobal.SetValue(totalInterlocks as Float)
    Self.UpdateCurrentInstanceGlobal(MQ207CTotalInterlockCountGlobal)
    Int I = 0
    While I < powerInterlocks_I.Length
      Self.RegisterForRemoteEvent(powerInterlocks_I[I] as ScriptObject, "OnActivate")
      powerInterlocks_I[I].SetColor("Green")
      powerInterlocks_I[I].SetValue(MQ207C_PowerInterlockIDValue, (I + 1) as Float)
      I += 1
    EndWhile
    I = 0
    While I < powerInterlocks_II.Length
      Self.RegisterForRemoteEvent(powerInterlocks_II[I] as ScriptObject, "OnActivate")
      powerInterlocks_II[I].SetColor("Green")
      powerInterlocks_II[I].SetValue(MQ207C_PowerInterlockIDValue, (I + 1) as Float)
      I += 1
    EndWhile
    allPowerInterlocksEngaged_I = True
    allPowerInterlocksEngaged_II = True
    Self.Private_EngaussPowerInterlocks(1)
    Self.Private_EngaussPowerInterlocks(2)
    frequencyOutput_I = CONST_Frequency_FrequencyOutputInitial_I
    frequencyOutput_II = CONST_Frequency_FrequencyOutputInitial_II
    Self.Private_UpdateFrequencyIntakes()
    labControlTerminal_I = Nishina02_LabControlTerminal_I.GetRef()
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalUniverseValue, 1.0)
    labControlTerminal_II = Nishina02_LabControlTerminal_II.GetRef()
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalUniverseValue, 2.0)
    Self.Private_UpdateTerminalData(1)
    Self.Private_UpdateTerminalData(2)
    emergencyShutdown_I = Nishina02_EmergencyShutdown_I.GetRef() as genericswitchscript
    emergencyShutdown_I.BlockActivation(True, False)
    Self.RegisterForRemoteEvent(emergencyShutdown_I as ScriptObject, "OnActivate")
    emergencyShutdown_II = Nishina02_EmergencyShutdown_II.GetRef() as genericswitchscript
    emergencyShutdown_II.BlockActivation(True, False)
    Self.RegisterForRemoteEvent(emergencyShutdown_II as ScriptObject, "OnActivate")
    PrimaryCalibration_I = Nishina02_PrimaryCalibration_I.GetRef() as genericswitchscript
    Self.RegisterForRemoteEvent(PrimaryCalibration_I as ScriptObject, "OnActivate")
    PrimaryCalibration_II = Nishina02_PrimaryCalibration_II.GetRef() as genericswitchscript
    Self.RegisterForRemoteEvent(PrimaryCalibration_II as ScriptObject, "OnActivate")
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "OnFlicker")
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "OnFlickerFast")
  EndIf
EndFunction

Function ProcessResearchLabActivation(genericswitchscript akSource, ObjectReference akActivator)
  If akSource == emergencyShutdown_I
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_I)
      MQ207C_EmergencyShutdownAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf powerInterlocksRemaining_I.Length > 0
      MQ207C_EmergencyShutdownNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf MQ207C_ShutdownWarningMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
      emergencyShutdown_I.PlayAnimation("Play01")
      Self.ShutdownExperiment(False)
      Self.SetStage(CONST_EmergencyShutdownTriggeredStage_I)
    EndIf
  ElseIf akSource == emergencyShutdown_II
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_II)
      MQ207C_EmergencyShutdownAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf powerInterlocksRemaining_II.Length > 0
      MQ207C_EmergencyShutdownNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf MQ207C_ShutdownWarningMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
      emergencyShutdown_II.PlayAnimation("Play01")
      Self.ShutdownExperiment(False)
      Self.SetStage(CONST_EmergencyShutdownTriggeredStage_II)
    EndIf
  ElseIf akSource == PrimaryCalibration_I
    If PrimaryCalibrationEngaged_I
      MQ207C_PrimaryCalibrationAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf !frequencyStable
      MQ207C_PrimaryCalibrationNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      PrimaryCalibration_I.SetColor("White")
      PrimaryCalibration_I.SetState("On")
      PrimaryCalibrationEngaged_I = True
      If PrimaryCalibrationEngaged_I && PrimaryCalibrationEngaged_II
        Self.DisableControls(False)
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running")
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running")
        QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
        QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait(False)
        QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
        QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait(False)
        Self.SetStage(CONST_WaitForTheExperimentStage_III)
      EndIf
    EndIf
  ElseIf akSource == PrimaryCalibration_II
    If PrimaryCalibrationEngaged_II
      MQ207C_PrimaryCalibrationAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf !frequencyStable
      MQ207C_PrimaryCalibrationNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      PrimaryCalibrationEngaged_II = True
      PrimaryCalibration_II.SetColor("White")
      PrimaryCalibration_II.SetState("On")
      If PrimaryCalibrationEngaged_I && PrimaryCalibrationEngaged_II
        Self.DisableControls(False)
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running")
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running")
        QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
        QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait(False)
        QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
        QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait(False)
        Self.SetStage(CONST_WaitForTheExperimentStage_III)
      EndIf
    EndIf
  ElseIf powerInterlocks_I.find(akSource, 0) >= 0
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_I)
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf frequencyStable
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      Int remainingIndex = powerInterlocksRemaining_I.find(akSource, 0)
      If remainingIndex >= 0
        akSource.SetColor("Red")
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Engage)
        powerInterlocksRemaining_I.remove(remainingIndex, 1)
        Nishina02_PowerInterlocks_I.RemoveRef(akSource as ObjectReference)
        Self.Private_TryToDegaussPowerInterlock(akSource)
        Self.Private_UpdateInterlockAndShutdownObjectives(1)
        If powerInterlocksRemaining_I.Length == CONST_HalfInterlocksShutDownCount
          Self.SetStage(CONST_HalfInterlocksShutDown_I_Stage)
        ElseIf powerInterlocksRemaining_I.Length == 0
          Self.SetStage(CONST_AllInterlocksShutDown_I_Stage)
        EndIf
      Else
        akSource.SetColor("Green")
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Disengage)
        powerInterlocksRemaining_I.add(akSource, 1)
        Nishina02_PowerInterlocks_I.AddRef(akSource as ObjectReference)
        Self.Private_UpdateInterlockAndShutdownObjectives(1)
      EndIf
      Self.Private_UpdatePowerInterlocksState(1)
    EndIf
  ElseIf powerInterlocks_II.find(akSource, 0) >= 0
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_II)
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf frequencyStable
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      Int remainingindex = powerInterlocksRemaining_II.find(akSource, 0)
      If remainingindex >= 0
        akSource.SetColor("Red")
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Engage)
        powerInterlocksRemaining_II.remove(remainingindex, 1)
        Nishina02_PowerInterlocks_II.RemoveRef(akSource as ObjectReference)
        Self.Private_TryToDegaussPowerInterlock(akSource)
        Self.Private_UpdateInterlockAndShutdownObjectives(2)
      Else
        akSource.SetColor("Green")
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Disengage)
        powerInterlocksRemaining_II.add(akSource, 1)
        Nishina02_PowerInterlocks_II.AddRef(akSource as ObjectReference)
        Self.Private_UpdateInterlockAndShutdownObjectives(2)
      EndIf
      Self.Private_UpdatePowerInterlocksState(2)
    EndIf
  EndIf
EndFunction

Function Private_UpdateLabResearchLabStateOnShift(Int universeID)
  If Self.GetStageDone(CONST_EnteredResearchLabStage)
    Self.Private_UpdateInterlockAndShutdownObjectives(universeID)
    Self.Private_UpdateTerminalData(universeID)
  EndIf
EndFunction

Function Private_UpdateInterlockAndShutdownObjectives(Int universeID)
  If Self.IsObjectiveDisplayed(CONST_DisengagePowerInterlocksObjective) || Self.IsObjectiveDisplayed(CONST_ShutDownTheProbeObjective)
    Int currentInterlockCount = 0
    genericswitchscript currentEmergencyShutdownSwitch = None
    If universeID == 1
      currentInterlockCount = totalInterlocks - powerInterlocksRemaining_I.Length
      currentEmergencyShutdownSwitch = emergencyShutdown_I
    Else
      currentInterlockCount = totalInterlocks - powerInterlocksRemaining_II.Length
      currentEmergencyShutdownSwitch = emergencyShutdown_II
    EndIf
    MQ207CCurrentInterlockCountGlobal.SetValue(currentInterlockCount as Float)
    Self.UpdateCurrentInstanceGlobal(MQ207CCurrentInterlockCountGlobal)
    If universeID == 1 && powerInterlocksRemaining_I.Length == 0 || universeID == 2 && powerInterlocksRemaining_II.Length == 0
      Self.SetObjectiveCompleted(CONST_DisengagePowerInterlocksObjective, True)
      Self.SetObjectiveDisplayed(CONST_ShutDownTheProbeObjective, True, False)
      currentEmergencyShutdownSwitch.SetState("PulseFast")
    Else
      Self.SetObjectiveCompleted(CONST_DisengagePowerInterlocksObjective, False)
      Self.SetObjectiveDisplayed(CONST_DisengagePowerInterlocksObjective, True, True)
      Self.SetObjectiveDisplayed(CONST_ShutDownTheProbeObjective, False, False)
      currentEmergencyShutdownSwitch.SetState("Off")
    EndIf
  EndIf
EndFunction

Function Private_UpdateTerminalData(Int universeID)
  genericswitchscript[] currentInterlocksToDegauss = None
  ObjectReference terminalToUpdate = None
  If universeID == 1
    terminalToUpdate = labControlTerminal_I
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingCountValue, powerInterlocksToDegauss_I.Length as Float)
    currentInterlocksToDegauss = powerInterlocksToDegauss_I
    terminalToUpdate.AddTextReplacementValue("OutputFrequency", frequencyOutput_I as Float)
    terminalToUpdate.AddTextReplacementValue("IntakeFrequency", frequencyIntake_I)
  Else
    terminalToUpdate = labControlTerminal_II
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingCountValue, powerInterlocksToDegauss_II.Length as Float)
    currentInterlocksToDegauss = powerInterlocksToDegauss_II
    terminalToUpdate.AddTextReplacementValue("OutputFrequency", frequencyOutput_II as Float)
    terminalToUpdate.AddTextReplacementValue("IntakeFrequency", frequencyIntake_II)
  EndIf
  If currentInterlocksToDegauss.Length > 3
    terminalToUpdate.AddTextReplacementValue("Degauss4", currentInterlocksToDegauss[3].GetValue(MQ207C_PowerInterlockIDValue))
  Else
    terminalToUpdate.AddTextReplacementValue("Degauss4", 0.0)
  EndIf
  If currentInterlocksToDegauss.Length > 2
    terminalToUpdate.AddTextReplacementValue("Degauss3", currentInterlocksToDegauss[2].GetValue(MQ207C_PowerInterlockIDValue))
  Else
    terminalToUpdate.AddTextReplacementValue("Degauss3", 0.0)
  EndIf
  If currentInterlocksToDegauss.Length > 1
    terminalToUpdate.AddTextReplacementValue("Degauss2", currentInterlocksToDegauss[1].GetValue(MQ207C_PowerInterlockIDValue))
  Else
    terminalToUpdate.AddTextReplacementValue("Degauss2", 0.0)
  EndIf
  If currentInterlocksToDegauss.Length > 0
    terminalToUpdate.AddTextReplacementValue("Degauss1", currentInterlocksToDegauss[0].GetValue(MQ207C_PowerInterlockIDValue))
  Else
    terminalToUpdate.AddTextReplacementValue("Degauss1", 0.0)
  EndIf
EndFunction

Function UpdateAllPowerInterlocks(String newColor, String newState)
  Int I = 0
  While I < powerInterlocks_I.Length
    powerInterlocks_I[I].SetColor(newColor)
    powerInterlocks_I[I].SetColor(newState)
    I += 1
  EndWhile
  I = 0
  While I < powerInterlocks_II.Length
    powerInterlocks_II[I].SetColor(newColor)
    powerInterlocks_II[I].SetColor(newState)
    I += 1
  EndWhile
EndFunction

Function UpdateAllExperimentBeams(RefCollectionAlias beamCollection, String newState)
  defaultmultistateactivator[] beamCollectionRefs = beamCollection.GetArray() as defaultmultistateactivator[]
  Int I = 0
  While I < beamCollectionRefs.Length
    beamCollectionRefs[I].SetAnimationState(newState, False)
    I += 1
  EndWhile
EndFunction

Function UpdateAllExperimentLights(RefCollectionAlias lightCollection, String newState)
  ObjectReference[] lightCollectionRefs = lightCollection.GetArray()
  Int I = 0
  While I < lightCollectionRefs.Length
    If newState == "Off"
      lightCollectionRefs[I].DisableNoWait(False)
    Else
      lightCollectionRefs[I].EnableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ShutdownExperiment(Bool shouldDisableArtifact)
  If shouldDisableArtifact
    artifactActivator_I.DisableNoWait(False)
    artifactActivator_II.DisableNoWait(False)
  EndIf
  Self.UpdateAllPowerInterlocks("", "Off")
  emergencyShutdown_I.SetState("Off")
  emergencyShutdown_II.SetState("Off")
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Off")
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Off")
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_I, "Off")
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_II, "Off")
  Nishina02_ExperimentBeamHazards.DisableAll(False)
  QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef.EnableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_01_Solved_Off_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Universe_01_Laser_Experiment_01_Machine_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef.EnableNoWait(False)
  QST_MQ207C_Universe_01_Laser_Experiment_02_Laser_Beam_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Universe_01_Laser_Experiment_03_Impact_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Universe_02_Laser_Experiment_01_Machine_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Universe_02_Laser_Experiment_02_Laser_Beam_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Universe_02_Laser_Experiment_03_Impact_MarkerRef.DisableNoWait(False)
EndFunction

Function Private_EngaussPowerInterlocks(Int universe)
  If universe == 1
    powerInterlocksToDegauss_I = commonarrayfunctions.SortRefsByValue(Self.SelectRandomSwitch(powerInterlocks_I, Utility.RandomInt(CONST_MinInterlocksToDegauss, CONST_MaxInterlocksToDegauss)) as ObjectReference[], MQ207C_PowerInterlockIDValue) as genericswitchscript[]
  Else
    powerInterlocksToDegauss_II = commonarrayfunctions.SortRefsByValue(Self.SelectRandomSwitch(powerInterlocks_II, Utility.RandomInt(CONST_MinInterlocksToDegauss, CONST_MaxInterlocksToDegauss)) as ObjectReference[], MQ207C_PowerInterlockIDValue) as genericswitchscript[]
  EndIf
EndFunction

Function TryToStartDegaussing(Int universe)
  If universe == 1 && allPowerInterlocksEngaged_I
    degaussingStarted_I = True
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 1.0)
  ElseIf universe == 2 && allPowerInterlocksEngaged_II
    degaussingStarted_II = True
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 1.0)
  EndIf
EndFunction

Function Private_TryToDegaussPowerInterlock(genericswitchscript powerInterlock)
  Int index1 = powerInterlocksToDegauss_I.find(powerInterlock, 0)
  If index1 >= 0 && degaussingStarted_I
    powerInterlocksToDegauss_I.remove(index1, 1)
    Self.Private_UpdateTerminalData(1)
  Else
    Int index2 = powerInterlocksToDegauss_II.find(powerInterlock, 0)
    If index2 >= 0 && degaussingStarted_II
      powerInterlocksToDegauss_II.remove(index2, 1)
      Self.Private_UpdateTerminalData(2)
    EndIf
  EndIf
EndFunction

Function Private_UpdatePowerInterlocksState(Int universe)
  If universe == 1
    allPowerInterlocksEngaged_I = powerInterlocksRemaining_I.Length == powerInterlocks_I.Length
    allPowerInterlocksDegaussed_I = powerInterlocksToDegauss_I.Length == 0
    If frequencyCalibrationStarted_I
      Self.Private_FailFrequencyCalibration(1)
    EndIf
  Else
    allPowerInterlocksEngaged_II = powerInterlocksRemaining_II.Length == powerInterlocks_II.Length
    allPowerInterlocksDegaussed_II = powerInterlocksToDegauss_II.Length == 0
    If frequencyCalibrationStarted_II
      Self.Private_FailFrequencyCalibration(2)
    EndIf
  EndIf
EndFunction

Function TryToStartFrequencyCalibration(Int universe)
  If universe == 1
    If allPowerInterlocksEngaged_I && allPowerInterlocksDegaussed_I
      frequencyCalibrationStarted_I = True
      labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0)
    Else
      Self.Private_FailFrequencyCalibration(1)
    EndIf
  ElseIf allPowerInterlocksEngaged_II && allPowerInterlocksDegaussed_II
    frequencyCalibrationStarted_II = True
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0)
  Else
    Self.Private_FailFrequencyCalibration(2)
  EndIf
EndFunction

Function SetFrequencyOutput(Int universe, Int output)
  If universe == 1
    frequencyOutput_I = output
  Else
    frequencyOutput_II = output
  EndIf
  Self.Private_UpdateFrequencyIntakes()
  Self.Private_UpdateTerminalData(universe)
EndFunction

Function Private_UpdateFrequencyIntakes()
  frequencyIntake_I = frequencyOutput_I as Float - (frequencyOutput_II as Float * CONST_FrequencyMultiplier)
  frequencyIntake_II = frequencyOutput_II as Float + (frequencyOutput_I as Float * CONST_FrequencyMultiplier)
  If frequencyOutput_I == CONST_Frequency_FrequencyOutputTarget_I && frequencyOutput_II == CONST_Frequency_FrequencyOutputTarget_II
    frequencyStable = True
    Self.UpdateAllPowerInterlocks("White", "")
    PrimaryCalibration_I.SetState("Pulse")
    PrimaryCalibration_II.SetState("Pulse")
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
    QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False)
    QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False)
    QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False)
    QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False)
    Self.SetStage(CONST_ActivatePrimaryCalibrationStage)
  Else
    frequencyStable = False
  EndIf
EndFunction

Function Private_FailFrequencyCalibration(Int universe)
  If universe == 1
    degaussingStarted_I = False
    frequencyCalibrationStarted_I = False
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 0.0)
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 0.0)
    Self.Private_EngaussPowerInterlocks(1)
    Self.Private_UpdateTerminalData(1)
  ElseIf universe == 2
    degaussingStarted_II = False
    frequencyCalibrationStarted_II = False
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 0.0)
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 0.0)
    Self.Private_EngaussPowerInterlocks(2)
    Self.Private_UpdateTerminalData(2)
  EndIf
EndFunction

Function PlaySpecialEndingShifting()
  Utility.Wait(2.0)
  selfAsShiftingQuest.Shift(None, False, False, -1, None)
  Utility.Wait(1.0)
  selfAsShiftingQuest.Shift(None, False, False, -1, None)
  Utility.Wait(0.5)
  selfAsShiftingQuest.Shift(None, False, False, -1, None)
  Utility.Wait(0.300000012)
  selfAsShiftingQuest.Shift(None, False, False, -1, None)
  Utility.Wait(0.100000001)
  selfAsShiftingQuest.Shift(None, False, False, -1, None)
  Utility.Wait(0.100000001)
  selfAsShiftingQuest.Shift(None, False, False, -1, None)
  If !player.IsDead()
    Self.SetStage(CONST_GiveTheArtifactStage_III)
  EndIf
EndFunction

Function UnblockArtifactActivator_I()
  Nishina02_ArtifactBeckonSFX_I.EnableAll(False)
  artifactActivator_I.BlockActivation(False, False)
EndFunction

Function UnblockArtifactActivator_II()
  Nishina02_ArtifactBeckonSFX_II.EnableAll(False)
  artifactActivator_II.BlockActivation(False, False)
EndFunction

Function ProcessArtifactActivatorActivation(ObjectReference akSource, ObjectReference akActivator)
  If akSource == artifactActivator_I && Self.GetStageDone(CONST_TakeTheArtifactStage_I)
    Nishina02_ArtifactBeckonSFX_I.DisableAll(False)
    Self.SetStage(CONST_TookTheArtifactStage_I)
    Self.GiveArtifact()
  ElseIf akSource == artifactActivator_II && Self.GetStageDone(CONST_TakeTheArtifactStage_II)
    Nishina02_ArtifactBeckonSFX_II.DisableAll(False)
    Self.SetStage(CONST_TookTheArtifactStage_II)
    Self.GiveArtifact()
  EndIf
EndFunction

Function GiveArtifact()
  artifactActivator_I.DisableNoWait(False)
  artifactActivator_II.DisableNoWait(False)
  ObjectReference artifactRef = StarbornTempleQuest.PlaceArtifact(CONST_MQ207CArtifactID, AnnouncementMarker.GetRef())
  MQ207B_Artifact02QuestObject.ForceRefTo(artifactRef)
  player.AddItem(artifactRef as Form, 1, False)
  StarbornTempleQuest.SetPlayerAcquiredArtifact(CONST_MQ207CArtifactID)
EndFunction

Function SetRefColSecurityDoorStateNoWait(RefCollectionAlias securityDoorRefCol, Bool shouldSeal, Bool shouldOpenDoor)
  Var[] akArgs = new Var[3]
  akArgs[0] = securityDoorRefCol as Var
  akArgs[1] = shouldSeal as Var
  akArgs[2] = shouldOpenDoor as Var
  Self.CallFunctionNoWait("SetRefColSecurityDoorState", akArgs)
EndFunction

Function SetRefColSecurityDoorState(RefCollectionAlias securityDoorRefCol, Bool shouldSeal, Bool shouldOpenDoor)
  ObjectReference[] doors = securityDoorRefCol.GetArray()
  Int I = 0
  While I < doors.Length
    If shouldSeal
      Self.SealSecurityDoor(doors[I])
    Else
      Self.UnsealSecurityDoor(doors[I], shouldOpenDoor)
    EndIf
    I += 1
  EndWhile
EndFunction

Function SealSecurityDoorNoWait(ObjectReference securityDoor)
  Var[] akArgs = new Var[1]
  akArgs[0] = securityDoor as Var
  Self.CallFunctionNoWait("SealSecurityDoor", akArgs)
EndFunction

Function SealSecurityDoor(ObjectReference securityDoor)
  If securityDoor != None
    Int openState = securityDoor.GetOpenState()
    While openState == 2 || openState == 4
      Utility.Wait(0.100000001)
      openState = securityDoor.GetOpenState()
    EndWhile
    securityDoor.SetOpen(False)
    If securityDoor.GetLockLevel() > 0
      securityDoor.Lock(True, False, True)
    EndIf
  EndIf
EndFunction

Function UnsealSecurityDoorNoWait(ObjectReference securityDoor, Bool shouldOpenDoor)
  Var[] akArgs = new Var[2]
  akArgs[0] = securityDoor as Var
  akArgs[1] = shouldOpenDoor as Var
  Self.CallFunctionNoWait("UnsealSecurityDoor", akArgs)
EndFunction

Function UnsealSecurityDoor(ObjectReference securityDoor, Bool shouldOpenDoor)
  If securityDoor != None
    Int openState = securityDoor.GetOpenState()
    While openState == 2 || openState == 4
      Utility.Wait(0.100000001)
      openState = securityDoor.GetOpenState()
    EndWhile
    If securityDoor.Is3DLoaded()
      WwiseEvent_DRSRemoteUnlock.Play(securityDoor, None, None)
    EndIf
    securityDoor.Unlock(False)
    If shouldOpenDoor
      securityDoor.SetOpen(True)
    EndIf
  EndIf
EndFunction

Function AllowSecurityDoorUnlock(ObjectReference securityDoor, Bool shouldAllow)
  If shouldAllow
    securityDoor.SetFactionOwner(MQ207CNishinaEscortFaction, False)
  Else
    securityDoor.SetFactionOwner(None, False)
  EndIf
EndFunction

Function PlayLockdownEndedSFXNoWait()
  Self.CallFunctionNoWait("PlayLockdownEndedSFX", None)
EndFunction

Function PlayLockdownEndedSFX()
  Utility.Wait(0.100000001)
  OBJ_Mq207C_Alarm_Science_Station_Lockdown_End_WEF.Play(player as ObjectReference, None, None)
EndFunction

Function SetRefColCameraState(RefCollectionAlias cameraCol, Bool shouldBeEssentialAndIFH, Bool shouldBeDead)
  Actor[] cameras = cameraCol.GetArray() as Actor[]
  Int I = 0
  While I < cameras.Length
    If cameras[I] != None
      If shouldBeDead
        cameras[I].Kill(None)
      ElseIf shouldBeEssentialAndIFH
        cameras[I].IgnoreFriendlyHits(True)
        cameras[I].SetEssential(True)
        cameras[I].RemoveFromFaction(MQ207CNishinaIEnemyFaction)
        cameras[I].AddToFaction(MQ207CNishinaIFaction)
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function StartMusicOverride()
  Self.StartTimer(0.0, CONST_MusicOverrideUpdateTimerID)
EndFunction

Function StopMusicOverride()
  Self.CancelTimer(CONST_MusicOverrideUpdateTimerID)
  MUSGenesisCombat_MQ207C_Nishina.Remove()
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_MusicOverrideUpdateTimerID
    If Self.GetStage() < CONST_AllEndingsCommonStage
      Bool isInArtifactRoom = Nishina02_ArtifactRoomMusicTrigger_I.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference) || Nishina02_ArtifactRoomMusicTrigger_II.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference)
      If isInArtifactRoom && !musicOverrideActive
        musicOverrideActive = True
        MUSGenesisCombat_MQ207C_Nishina.Add()
      ElseIf !isInArtifactRoom && musicOverrideActive
        musicOverrideActive = False
        MUSGenesisCombat_MQ207C_Nishina.Remove()
      EndIf
      If Nishina02_ArtifactRoomMusicTrigger_I.GetRef().Is3DLoaded()
        Self.StartTimer(CONST_MusicOverrideUpdateTimerDelay as Float, CONST_MusicOverrideUpdateTimerID)
      EndIf
    Else
      MUSGenesisCombat_MQ207C_Nishina.Remove()
    EndIf
  EndIf
EndEvent

Function TriggerResearchLabAmbushWave(Int universeID, Int waveID)
  If universeID == 1
    If waveID == 2
      (Nishina02_ArtifactRoomWave2Activator_I.GetRef() as dnlocalalarmscript).TriggerAlarm()
    ElseIf waveID == 3
      (Nishina02_ArtifactRoomWave3Activator_I.GetRef() as dnlocalalarmscript).TriggerAlarm()
    EndIf
  ElseIf universeID == 2
    If waveID == 2
      Nishina02_ArtifactRoomWave2Activator_II.GetRef().SetValue(AmbushTriggered, 1.0)
    ElseIf waveID == 3
      Nishina02_ArtifactRoomWave3Activator_II.GetRef().SetValue(AmbushTriggered, 1.0)
    EndIf
  EndIf
EndFunction

Function CleanupNishina01Creatures()
  Actor[] creatures = Nishina01_CreaturesAll_II.GetArray() as Actor[]
  Int I = 0
  While I < creatures.Length
    If creatures[I] != None && !creatures[I].IsDead()
      creatures[I].DisableNoWait(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetNishina02TerminalsLockedNoWait()
  Self.CallFunctionNoWait("SetNishina02TerminalsLocked", None)
EndFunction

Function SetNishina02TerminalsLocked()
  ObjectReference[] terminals = Nishina02_TerminalsAll.GetArray()
  Int I = 0
  While I < terminals.Length
    terminals[I].Lock(True, False, True)
    terminals[I].SetLockLevel(CONST_LockLevel_RequiresKey)
    I += 1
  EndWhile
EndFunction

Function SilenceNishina02AlarmsNoWait()
  Self.CallFunctionNoWait("SilenceNishina02Alarms", None)
EndFunction

Function SilenceNishina02Alarms()
  dnlocalalarmscript[] alarms = Nishina02_Alarms_All_I.GetArray() as dnlocalalarmscript[]
  Int I = 0
  While I < alarms.Length
    If alarms[I] != None
      alarms[I].StopAlarmSFX()
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetNishina02RobotsAndTurretsUnconsciousNoWait()
  Self.CallFunctionNoWait("SetNishina02RobotsAndTurretsUnconscious", None)
EndFunction

Function SetNishina02RobotsAndTurretsUnconscious()
  Actor[] robotsAndTurrets = Nishina02_RobotsAndTurrets_All_I.GetArray() as Actor[]
  Int I = 0
  While I < robotsAndTurrets.Length
    If robotsAndTurrets[I] != None && !robotsAndTurrets[I].IsDead()
      robotsAndTurrets[I].SetUnconscious(True)
    EndIf
    I += 1
  EndWhile
EndFunction

Function CleanupNishina02RobotsAndTurretsNoWait()
  Self.CallFunctionNoWait("CleanupNishina02RobotsAndTurrets", None)
EndFunction

Function CleanupNishina02RobotsAndTurrets()
  Actor[] robotsAndTurrets = Nishina02_RobotsAndTurrets_All_I.GetArray() as Actor[]
  Int I = 0
  While I < robotsAndTurrets.Length
    Actor current = robotsAndTurrets[I]
    If current != None && !current.IsDead()
      If Nishina02_RobotsToDisablePostquest_I.Find(current as ObjectReference) >= 0
        current.DisableNoWait(False)
      Else
        current.SetUnconscious(True)
        current.MoveToMyEditorLocation()
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Function ResetArtifactPositions()
  If artifactActivator_I != None && artifactActivator_II != None && !Self.GetStageDone(CONST_TookTheArtifactStage_I) && !Self.GetStageDone(CONST_TookTheArtifactStage_II) && !Self.GetStageDone(CONST_GiveTheArtifactStage_III)
    artifactActivator_I.MoveToMyEditorLocation()
    artifactActivator_II.MoveToMyEditorLocation()
  EndIf
EndFunction

Function ClearVariables()
  NishinaExt_IntercomRef = None
  NishinaExt_ExteriorDoor_I_Ref = None
  artifactActivator_I = None
  artifactActivator_II = None
  powerInterlocks_I = None
  powerInterlocksRemaining_I = None
  powerInterlocksToDegauss_I = None
  powerInterlocks_II = None
  powerInterlocksRemaining_II = None
  powerInterlocksToDegauss_II = None
  emergencyShutdown_I = None
  emergencyShutdown_II = None
  PrimaryCalibration_I = None
  PrimaryCalibration_II = None
  labControlTerminal_I = None
  labControlTerminal_II = None
  selfAsShiftingQuest.ClearVariables()
EndFunction

genericswitchscript[] Function CopySwitchArray(genericswitchscript[] input)
  genericswitchscript[] output = new genericswitchscript[input.Length]
  Int I = 0
  While I < input.Length
    output[I] = input[I]
    I += 1
  EndWhile
  Return output
EndFunction

genericswitchscript[] Function CopyAndRandomizeSwitchArray(genericswitchscript[] input)
  genericswitchscript[] output = Self.CopySwitchArray(input)
  Float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0.0, 1.0)
  Int I = output.Length - 1
  While I >= 0
    Int currentRandomIndex = (random[I] * I as Float) as Int
    genericswitchscript temp = output[I]
    output[I] = output[currentRandomIndex]
    output[currentRandomIndex] = temp
    I -= 1
  EndWhile
  Return output
EndFunction

genericswitchscript[] Function SelectRandomSwitch(genericswitchscript[] input, Int numToSelect)
  genericswitchscript[] randomizedInput = Self.CopyAndRandomizeSwitchArray(input)
  genericswitchscript[] output = new genericswitchscript[numToSelect]
  Int I = 0
  While I < numToSelect
    output[I] = randomizedInput[I]
    I += 1
  EndWhile
  Return output
EndFunction

Function DebugOpenDoors()
  Self.SetStage(30)
  Self.SetStage(40)
  Self.SetStage(580)
EndFunction

Function DEBUG_ForceFrequencyCalibration()
  frequencyCalibrationStarted_I = True
  labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0)
  frequencyCalibrationStarted_II = True
  labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0)
EndFunction

Function DEBUG_UpdateAllExperimentBeams(String newState)
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, newState)
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, newState)
EndFunction

Function DEBUG_UpdateAllExperimentLights(String newState)
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_I, newState)
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_II, newState)
EndFunction

Function DEBUG_Shutdown01()
  emergencyShutdown_I.PlayAnimation("Play01")
  Self.ShutdownExperiment(False)
  Self.SetStage(CONST_EmergencyShutdownTriggeredStage_I)
EndFunction

Function DEBUG_Shutdown02()
  emergencyShutdown_II.PlayAnimation("Play01")
  Self.ShutdownExperiment(False)
  Self.SetStage(CONST_EmergencyShutdownTriggeredStage_II)
EndFunction

Function DEBUG_Stabilize()
  frequencyStable = True
  Self.UpdateAllPowerInterlocks("White", "")
  PrimaryCalibration_I.SetState("Pulse")
  PrimaryCalibration_II.SetState("Pulse")
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized")
  QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False)
  Self.SetStage(CONST_ActivatePrimaryCalibrationStage)
EndFunction

Function DEBUG_Running()
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running")
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running")
  QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False)
  QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait(False)
  Self.SetStage(CONST_WaitForTheExperimentStage_III)
EndFunction

;-- State -------------------------------------------
State ProcessingEvent

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForEvent

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GoToState("ProcessingEvent")
    If akSource == NishinaExt_ExteriorDoor_I_Ref
      Self.BlockFollowersAtExteriorDoor()
    ElseIf akSource == artifactActivator_I || akSource == artifactActivator_II
      Self.ProcessArtifactActivatorActivation(akSource, akActivator)
    Else
      Self.ProcessResearchLabActivation(akSource as genericswitchscript, akActivator)
    EndIf
    Self.GoToState("WaitingForEvent")
  EndEvent
EndState
