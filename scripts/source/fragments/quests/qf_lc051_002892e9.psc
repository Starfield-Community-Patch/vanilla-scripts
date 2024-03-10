ScriptName Fragments:Quests:QF_LC051_002892E9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TestGuard Auto Const mandatory
ReferenceAlias Property Alias_GuardEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_RDGuards Auto Const mandatory
ReferenceAlias Property Alias_EmployeeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorRD Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorOffice Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorMarketing Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorExecutive Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerRD Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerOffice Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerMarketing Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerExecutive Auto Const mandatory
RefCollectionAlias Property Alias_Turrets Auto Const mandatory
RefCollectionAlias Property Alias_MarketingEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_MarketingEmployeesSafe Auto Const mandatory
Faction Property TestAustinFFactionInfinity Auto Const
Faction Property TestAustinFFactionInfinityPlayer Auto Const
RefCollectionAlias Property Alias_RDEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_RDEmployeesSafe Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerRD02 Auto Const mandatory
RefCollectionAlias Property Alias_OfficeEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_OfficeEmployeesSafe Auto Const mandatory
RefCollectionAlias Property Alias_ExecutiveEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_ExecutiveEmployeesSafe Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const
ReferenceAlias Property Alias_ElevFloorRoof Auto Const mandatory
Explosion Property GrenadeLauncherExplosion Auto Const
ReferenceAlias Property Alias_ExplosionXmarker Auto Const mandatory
ReferenceAlias Property Alias_NueroampSecuirtyDoor Auto Const mandatory
Faction Property LC051InfinityLTDPEnemyFaction Auto Const
ReferenceAlias Property Alias_DrexlerOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_DamagedPipe Auto Const mandatory
RefCollectionAlias Property Alias_DamagedPipes Auto Const mandatory
wwiseevent Property WwiseEvent_QST_RI07_Machine_Malfunction Auto Const
wwiseevent Property WwiseEvent_QST_RI07_Machine_Malfunction_Alarm Auto Const
wwiseevent Property WwiseEvent_QST_RI07_Security_Alarm_Play Auto Const
wwiseevent Property WwiseEvent_QST_RI07_Security_Alarm_Stop Auto Const
ReferenceAlias Property Alias_Harper Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_Angelo Auto Const mandatory
ReferenceAlias Property Alias_ExteriorElevator Auto Const mandatory
ReferenceAlias Property Alias_Lucas Auto Const mandatory
ReferenceAlias Property Alias_Faye Auto Const mandatory
ReferenceAlias Property Alias_PostQuestGuardDisableMarker Auto Const mandatory
ReferenceAlias Property Alias_GasEnableMarker Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const
ReferenceAlias Property Alias_GeneratorAlarmSoundMarker Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_RoofAccessDoor Auto Const mandatory
Cell Property LC051InfinityHQ Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  WwiseEvent_QST_RI07_Security_Alarm_Play.Play(Game.GetPlayer() as ObjectReference, None, None)
  Game.GetPlayer().AddToFaction(LC051InfinityLTDPEnemyFaction)
  Alias_GuardEnableMarker.getref().enable(False)
  Self.setstage(605)
  Alias_RDEmployeesSafe.EvaluateAll()
  Alias_OfficeEmployeesSafe.EvaluateAll()
  Alias_MarketingEmployeesSafe.EvaluateAll()
  Alias_ExecutiveEmployeesSafe.EvaluateAll()
  Int GuardCount = Alias_RDGuards.GetCount()
  Int currentGuardIndex = 0
  While currentGuardIndex < GuardCount
    Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1.0)
    currentGuardIndex += 1
  EndWhile
EndFunction

Function Fragment_Stage_0020_Item_00()
  WwiseEvent_QST_RI07_Machine_Malfunction.Play(Game.GetPlayer() as ObjectReference, None, None)
  WwiseEvent_QST_RI07_Machine_Malfunction_Alarm.Play(Game.GetPlayer() as ObjectReference, None, None)
  Alias_EmployeeEnableMarker.getref().disable(False)
  Alias_Harper.getref().disable(False)
  Alias_Stanley.getref().disable(False)
  Alias_Angelo.getref().disable(False)
  Alias_Lucas.getref().disable(False)
  Alias_Faye.getref().disable(False)
  Alias_GuardEnableMarker.getref().enable(False)
  Alias_GasEnableMarker.getref().enable(False)
  Int GuardCount = Alias_RDGuards.GetCount()
  Int currentGuardIndex = 0
  While currentGuardIndex < GuardCount
    Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1.0)
    currentGuardIndex += 1
  EndWhile
  Int TurretCount = Alias_Turrets.GetCount()
  Int currentTurretIndex = 0
  While currentTurretIndex < TurretCount
    (Alias_Turrets.GetAt(currentTurretIndex) as Actor).SetUnconscious(False)
    currentTurretIndex += 1
  EndWhile
  Alias_DrexlerOfficeDoor.getref().Unlock(False)
  Alias_DrexlerOfficeDoor.getref().SetOpen(True)
  Int PipeCount = Alias_DamagedPipes.GetCount()
  Int currentPipeIndex = 0
  While currentPipeIndex < PipeCount
    Alias_DamagedPipes.GetAt(currentPipeIndex).DamageObject(2000.0)
    currentPipeIndex += 1
  EndWhile
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_ExplosionXmarker.getref().PlaceatMe(GrenadeLauncherExplosion as Form, 1, False, False, True, None, None, True)
  Alias_NueroampSecuirtyDoor.getref().SetOpen(True)
  Actor Linkedguard = Alias_ExplosionXmarker.getref().GetLinkedRef(None) as Actor
  Linkedguard.kill(None)
  Alias_RDEmployeesSafe.EvaluateAll()
  Int GuardCount = Alias_RDGuards.GetCount()
  Int currentGuardIndex = 0
  While currentGuardIndex < GuardCount
    Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1.0)
    currentGuardIndex += 1
  EndWhile
  Alias_GeneratorAlarmSoundMarker.getref().enable(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorRD.getref() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0510_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorOffice.getref() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0520_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorMarketing.getref() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0530_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorExecutive.getref() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0540_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorRoof.getref() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  If !Self.GetStageDone(10)
    Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass)
    Alias_RDEmployeesTrespass.RemoveAll()
    Alias_RDEmployeesSafe.EvaluateAll()
  EndIf
EndFunction

Function Fragment_Stage_0605_Item_00()
  Alias_RDEmployeesTrespass.AddRefCollection(Alias_RDEmployeesSafe)
  Alias_RDEmployeesSafe.RemoveAll()
  Alias_RDEmployeesTrespass.EvaluateAll()
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass)
  Alias_OfficeEmployeesTrespass.RemoveAll()
  Alias_OfficeEmployeesSafe.EvaluateAll()
EndFunction

Function Fragment_Stage_0620_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorMarketing.getref() as loadelevatorfloorscript
  floorScript.SetAccessible(True)
  Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass)
  Alias_MarketingEmployeesTrespass.RemoveAll()
  Alias_MarketingEmployeesSafe.EvaluateAll()
EndFunction

Function Fragment_Stage_0630_Item_00()
  Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass)
  Alias_ExecutiveEmployeesTrespass.RemoveAll()
  Alias_ExecutiveEmployeesSafe.EvaluateAll()
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass)
  Alias_RDEmployeesTrespass.RemoveAll()
  Alias_RDEmployeesSafe.EvaluateAll()
  Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass)
  Alias_OfficeEmployeesTrespass.RemoveAll()
  Alias_OfficeEmployeesSafe.EvaluateAll()
  Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass)
  Alias_MarketingEmployeesTrespass.RemoveAll()
  Alias_MarketingEmployeesSafe.EvaluateAll()
  Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass)
  Alias_ExecutiveEmployeesTrespass.RemoveAll()
  Alias_ExecutiveEmployeesSafe.EvaluateAll()
EndFunction

Function Fragment_Stage_0710_Item_00()
  Alias_RDEmployeesTrespass.AddRefCollection(Alias_RDEmployeesSafe)
  Alias_RDEmployeesSafe.RemoveAll()
  Alias_RDEmployeesTrespass.EvaluateAll()
  Alias_OfficeEmployeesTrespass.AddRefCollection(Alias_OfficeEmployeesSafe)
  Alias_OfficeEmployeesSafe.RemoveAll()
  Alias_OfficeEmployeesTrespass.EvaluateAll()
  Alias_MarketingEmployeesTrespass.AddRefCollection(Alias_MarketingEmployeesSafe)
  Alias_MarketingEmployeesSafe.RemoveAll()
  Alias_MarketingEmployeesTrespass.EvaluateAll()
  Alias_ExecutiveEmployeesTrespass.AddRefCollection(Alias_ExecutiveEmployeesSafe)
  Alias_ExecutiveEmployeesSafe.RemoveAll()
  Alias_ExecutiveEmployeesTrespass.EvaluateAll()
EndFunction

Function Fragment_Stage_1000_Item_00()
  RI_Support.setstage(6020)
  loadelevatorfloorscript RDFloorScript = Alias_ElevFloorRD.getref() as loadelevatorfloorscript
  RDFloorScript.SetAccessible(True)
  loadelevatorfloorscript GenOFficeFloorScript = Alias_ElevFloorOffice.getref() as loadelevatorfloorscript
  GenOFficeFloorScript.SetAccessible(True)
  loadelevatorfloorscript MarketingFloorScript = Alias_ElevFloorMarketing.getref() as loadelevatorfloorscript
  MarketingFloorScript.SetAccessible(True)
  loadelevatorfloorscript ExecutiveFloorScript = Alias_ElevFloorExecutive.getref() as loadelevatorfloorscript
  ExecutiveFloorScript.SetAccessible(True)
  loadelevatorfloorscript RoofFloorScript = Alias_ElevFloorRoof.getref() as loadelevatorfloorscript
  RoofFloorScript.SetAccessible(True)
  Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass)
  Alias_RDEmployeesTrespass.RemoveAll()
  Alias_RDEmployeesSafe.EvaluateAll()
  Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass)
  Alias_OfficeEmployeesTrespass.RemoveAll()
  Alias_OfficeEmployeesSafe.EvaluateAll()
  Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass)
  Alias_MarketingEmployeesTrespass.RemoveAll()
  Alias_MarketingEmployeesSafe.EvaluateAll()
  Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass)
  Alias_ExecutiveEmployeesTrespass.RemoveAll()
  Alias_ExecutiveEmployeesSafe.EvaluateAll()
  Alias_Lucas.getref().disable(False)
  Alias_Faye.getref().disable(False)
  Alias_GasEnableMarker.getref().disable(False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_EmployeeEnableMarker.getref().disable(False)
  Alias_PostQuestGuardDisableMarker.getref().disable(False)
  Alias_GuardEnableMarker.getref().disable(False)
  Alias_Harper.getref().disable(False)
  Alias_Stanley.getref().disable(False)
  Alias_Angelo.getref().disable(False)
  Alias_Lucas.getref().disable(False)
  Alias_Faye.getref().disable(False)
  (Alias_ExteriorElevator.getref() as loadelevatormanagerscript).SetElevatorOperational(False)
  LC051InfinityHQ.EnableFastTravel(True)
EndFunction
