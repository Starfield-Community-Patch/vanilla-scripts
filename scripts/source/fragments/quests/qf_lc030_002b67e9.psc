ScriptName Fragments:Quests:QF_LC030_002B67E9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF03 Auto Const mandatory
Location Property LC030LockLocation Auto Const mandatory
ReferenceAlias Property Alias_DelgadosShip Auto Const mandatory
ReferenceAlias Property Alias_Delgado Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly01 Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly02 Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly01_Corpse Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly02_Corpse Auto Const mandatory
ReferenceAlias Property Alias_InteriorEnemiesEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger03 Auto Const mandatory
RefCollectionAlias Property Alias_TransferChamberOffscreenCombatEnemies Auto Const mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger03 Auto Const mandatory
RefCollectionAlias Property Alias_ShuttleBayEnemies_All Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger03 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayGryllobaQueen Auto Const mandatory
ObjectReference Property LC030_Postquest_ShuttleBaySwapEnableMarker Auto Const mandatory
ObjectReference Property LC030_Postquest_ShuttleBaySwapDisableMarker Auto Const mandatory
RefCollectionAlias Property Alias_TransferChamberSecurityDoors Auto Const mandatory
RefCollectionAlias Property Alias_DBlockSecurityDoors Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker01Ref Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker02Ref Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker03Ref Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker04Ref Auto Const mandatory
ReferenceAlias Property Alias_FissureSwitch_Section01 Auto Const mandatory
ReferenceAlias Property Alias_FissureSwitch_Section02 Auto Const mandatory
ReferenceAlias Property Alias_FissureSwitch_Section03 Auto Const mandatory
RefCollectionAlias Property Alias_FissureCellDoors_Section01 Auto Const mandatory
RefCollectionAlias Property Alias_FissureCellDoors_Section02 Auto Const mandatory
RefCollectionAlias Property Alias_FissureCellDoors_Section03 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayDoorManager Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayWardensDoor Auto Const mandatory
ReferenceAlias Property Alias_HomeShip Auto Const mandatory
ReferenceAlias Property Alias_KeyPlayerDockingPort Auto Const mandatory
Keyword Property SpaceshipStoredLink Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_1 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_2 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_3 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_4 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPowerOn_MachinesOn Auto Const mandatory
wwiseevent Property QST_CF03_Stage7_AmbushQueen Auto Const mandatory
wwiseevent Property QST_CF03_CellblockLiftLockdown_Switch_A Auto Const mandatory
wwiseevent Property QST_CF03_CellblockLiftLockdown_Switch_B Auto Const mandatory
wwiseevent Property QST_CF03_CellblockLiftLockdown_Switch_C Auto Const mandatory
ReferenceAlias Property Alias_WeatherManager Auto Const mandatory
ReferenceAlias Property Alias_FissureKryxCellDoor Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_MapMarkerHeadingClose Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0642_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0660_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_DelgadosShip.TryToEnable()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_MapMarker.GetRef().SetLinkedRef(Alias_MapMarkerHeadingClose.GetRef(), None, True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_InteriorEnemiesEnableMarker.TryToEnable()
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  Self.SetStage(20)
  Utility.Wait(1.0)
  (Alias_TransferChamberAmbushTrigger01.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  kmyQuest.StartTransferChamberMonitor()
EndFunction

Function Fragment_Stage_0211_Item_00()
  (Alias_TransferChamberAmbushTrigger02.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
EndFunction

Function Fragment_Stage_0212_Item_00()
  (Alias_TransferChamberAmbushTrigger03.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
EndFunction

Function Fragment_Stage_0220_Item_00()
  CF03.SetStage(70)
EndFunction

Function Fragment_Stage_0250_Item_00()
  CF03.SetStage(85)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  kmyQuest.UnblockCollapsingWallActivation()
EndFunction

Function Fragment_Stage_0269_Item_00()
  CF03.SetStage(105)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Utility.Wait(1.0)
  Alias_TransferChamberOffscreenCombatEnemies.EnableAll(False)
  Alias_TransferChamberOffscreenCombatEnemies.StartCombatAll(Alias_Delgado.GetActorRef() as ObjectReference)
EndFunction

Function Fragment_Stage_0279_Item_00()
  Alias_GenericAlly01.TryToDisable()
  Alias_GenericAlly02.TryToDisable()
  Alias_GenericAlly01_Corpse.TryToEnable()
  Alias_GenericAlly02_Corpse.TryToEnable()
  Actor[] offscreenCombatEnemies = Alias_TransferChamberOffscreenCombatEnemies.GetArray() as Actor[]
  Int I = 0
  While I < offscreenCombatEnemies.Length
    If !offscreenCombatEnemies[I].IsDead()
      offscreenCombatEnemies[I].Kill(None)
    EndIf
    I += 1
  EndWhile
  Actor delgadoRef = Alias_Delgado.GetActorRef()
  delgadoRef.StopCombat()
  delgadoRef.EvaluatePackage(False)
  delgadoRef.MoveToPackageLocation()
  delgadoRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Int I = 0
  While I < Alias_TransferChamberSecurityDoors.GetCount()
    ObjectReference current = Alias_TransferChamberSecurityDoors.GetAt(I)
    current.SetOpen(True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(0.100000001)
  Int I = 0
  While I < Alias_DBlockSecurityDoors.GetCount()
    ObjectReference current = Alias_DBlockSecurityDoors.GetAt(I)
    current.SetOpen(True)
    I += 1
  EndWhile
  CF03.SetStageNoWait(136)
  LC030_LightsEnableMarker01Ref.Enable(False)
  QST_CF03_FacilityPoweringUp_1.Play(LC030_LightsEnableMarker01Ref, None, None)
  Utility.Wait(1.5)
  LC030_LightsEnableMarker02Ref.Enable(False)
  QST_CF03_FacilityPoweringUp_2.Play(LC030_LightsEnableMarker02Ref, None, None)
  Utility.Wait(1.5)
  LC030_LightsEnableMarker03Ref.Enable(False)
  QST_CF03_FacilityPoweringUp_3.Play(LC030_LightsEnableMarker03Ref, None, None)
  Utility.Wait(1.5)
  LC030_LightsEnableMarker04Ref.Enable(False)
  QST_CF03_FacilityPoweringUp_4.Play(LC030_LightsEnableMarker04Ref, None, None)
  Utility.Wait(1.5)
  QST_CF03_FacilityPowerOn_MachinesOn.Play(LC030_LightsEnableMarker04Ref, None, None)
EndFunction

Function Fragment_Stage_0411_Item_00()
  (Alias_FissureSwitch_Section01.GetRef() as genericswitchscript).SetState("On")
EndFunction

Function Fragment_Stage_0412_Item_00()
  (Alias_FissureSwitch_Section02.GetRef() as genericswitchscript).SetState("On")
EndFunction

Function Fragment_Stage_0413_Item_00()
  (Alias_FissureSwitch_Section03.GetRef() as genericswitchscript).SetState("On")
EndFunction

Function Fragment_Stage_0421_Item_00()
  QST_CF03_CellblockLiftLockdown_Switch_B.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_FissureCellDoors_Section01.SetOpen(True)
EndFunction

Function Fragment_Stage_0422_Item_00()
  QST_CF03_CellblockLiftLockdown_Switch_C.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_FissureCellDoors_Section02.SetOpen(True)
EndFunction

Function Fragment_Stage_0423_Item_00()
  QST_CF03_CellblockLiftLockdown_Switch_A.Play(Alias_FissureKryxCellDoor.GetRef(), None, None)
  Alias_FissureCellDoors_Section03.SetOpen(True)
  CF03.SetStage(177)
EndFunction

Function Fragment_Stage_0520_Item_00()
  (Alias_BarracksAmbushTrigger01.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  (Alias_BarracksAmbushTrigger02.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  (Alias_BarracksAmbushTrigger03.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
EndFunction

Function Fragment_Stage_0630_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  Alias_ShuttleBayWardensDoor.GetRef().SetOpen(True)
EndFunction

Function Fragment_Stage_0631_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  Alias_DelgadosShip.TryToDisable()
  (Alias_ShuttleBayDoorManager.GetRef() as shuttlebaydoormanagerscript).OpenShuttleBayDoors()
EndFunction

Function Fragment_Stage_0640_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  (Alias_ShuttleBayAmbushTrigger01.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  kmyQuest.StartShuttleBayMonitor()
EndFunction

Function Fragment_Stage_0641_Item_00()
  (Alias_ShuttleBayAmbushTrigger02.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  Utility.Wait(3.0)
  QST_CF03_Stage7_AmbushQueen.Play(Alias_ShuttleBayGryllobaQueen.GetRef(), None, None)
  Utility.Wait(1.299999952)
  (Alias_ShuttleBayAmbushTrigger03.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  Self.SetStage(642)
EndFunction

Function Fragment_Stage_0650_Item_00()
  CF03.SetStage(270)
EndFunction

Function Fragment_Stage_0690_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  CF03.SetStage(315)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  lc030_questscript kmyQuest = __temp as lc030_questscript
  Self.SetStage(20)
  Self.SetStage(280)
  Self.SetStage(300)
  Self.SetStage(630)
  Self.SetStage(631)
  LC030_Postquest_ShuttleBaySwapEnableMarker.Enable(False)
  LC030_Postquest_ShuttleBaySwapDisableMarker.Disable(False)
  Alias_WeatherManager.TryToDisable()
  kmyQuest.SetIgnoreFriendlyHitsOnAllies(False)
  kmyQuest.Cleanup()
  Self.Stop()
EndFunction
