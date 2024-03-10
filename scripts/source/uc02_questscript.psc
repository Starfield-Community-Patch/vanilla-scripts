ScriptName UC02_QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct BuildingPowerDatum
  RefCollectionAlias PowerBoxCollection
  { Ref collection that contains all the powerboxes for this building }
  ReferenceAlias PrimaryBoxAlias
  { Alias for the first box we want to direct the player towards }
  ReferenceAlias SecondaryBoxAlias
  { Alias for the second box we want to direct the player towards }
  ReferenceAlias TertiaryBoxAlias
  { Alias for the third box we want to direct the player towards }
  ReferenceAlias ObjAlias
  { Alias used to manage the objective }
  Int ArrayIndex
  { An index used to look up the which array of power boxes to loop through }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ObjIndicesAndStages
  Int Property ActivatePowerBoxesStage = 601 Auto Const
  { Stage set to direct the player to activate the power boxes }
  Int Property PowerBoxActivatedObj = 601 Auto Const
  { Objective index for the player to start activating powerboxes }
  Int Property RestoreLivestockScannerObj = 602 Auto Const
  { Objective index for "Restore the tracker" objective }
  Int Property FirstLureActivatedStage = 630 Auto Const
  { Stage set when the first lure is activated }
  Int Property AllPoweredUpObj = 650 Auto Const
  { Objective index to set once all the boxes are turned on }
  Int Property TerrormorphDeadStage = 700 Auto Const
  { Stage set if the Terrormorph bites it }
EndGroup

Group Objects
  GlobalVariable Property UC02_PowerBoxesActivated Auto Const mandatory
  { Global variable used to track how many power boxes the player has activated }
  GlobalVariable Property UC02_PowerBoxesTotal Auto Const mandatory
  { Global variable used to track the total number of power boxes }
  uc02_questscript:buildingpowerdatum[] Property BuildingPowerData Auto mandatory
  { Array of building power data }
  wwiseevent Property PrimeSoundEvent Auto Const mandatory
  { Sound to play when the pumps are primed }
EndGroup

Group Aliases
  RefCollectionAlias Property PowerBoxes Auto Const mandatory
  { General holding collection for powerboxes }
  ReferenceAlias Property Terrormorph Auto Const mandatory
  { Ref alias for the Terrormorph }
  RefCollectionAlias[] Property PowerBoxCollections Auto Const mandatory
  { Array of all the Powerbox collections for all the buildings }
  ReferenceAlias[] Property Building02Boxes Auto mandatory
  { Array of all the aliases for building 01 }
  ReferenceAlias[] Property Building03Boxes Auto mandatory
  { Array of all the aliases for building 02 }
  ReferenceAlias[] Property Building04Boxes Auto mandatory
  { Array of all the aliases for building 03 }
  RefCollectionAlias Property FuelTanks Auto Const mandatory
  { Ref collection for all the fuel tanks in the area }
  ReferenceAlias Property PrimeSoundSource Auto Const mandatory
  { Ref alias for the first prime sound source }
  RefCollectionAlias Property SecurityBldgDoors Auto Const mandatory
  { Collection for all the doors in the security room }
EndGroup

Group Misc
  Float Property MinPrimePumpDelay = 0.200000003 Auto Const
  { Minimum amount of time to wait between prime pump sounds }
  Float Property MaxPrimePumpDelay = 0.600000024 Auto Const
  { Max amount of time to wait between prime pump sounds }
EndGroup


;-- Functions ---------------------------------------

Function SetUpPowerboxObjective()
  Int I = 0
  Int iLength = PowerBoxCollections.Length
  Int iCompletedBuildings = 0
  While I < iLength
    RefCollectionAlias currColl = PowerBoxCollections[I]
    Int currCount = currColl.GetCount()
    If currCount == 0
      iCompletedBuildings += 1
    EndIf
    I += 1
  EndWhile
  If iCompletedBuildings as Float >= UC02_PowerBoxesTotal.GetValue()
    Self.SetStage(AllPoweredUpObj)
  Else
    UC02_PowerBoxesActivated.SetValue(iCompletedBuildings as Float)
    Int j = 0
    Int jLength = BuildingPowerData.Length
    While j < jLength
      uc02_questscript:buildingpowerdatum currDatum = BuildingPowerData[j]
      RefCollectionAlias currcoll = currDatum.PowerBoxCollection
      ObjectReference TargetObj = None
      ObjectReference FirstBox = currDatum.PrimaryBoxAlias.GetRef()
      ObjectReference SecondBox = currDatum.SecondaryBoxAlias.GetRef()
      ObjectReference ThirdBox = currDatum.TertiaryBoxAlias.GetRef()
      If currcoll.Find(FirstBox) >= 0
        TargetObj = FirstBox
      ElseIf currcoll.Find(SecondBox) >= 0
        currDatum.PrimaryBoxAlias.Clear()
        TargetObj = SecondBox
      ElseIf currcoll.Find(ThirdBox) >= 0
        currDatum.PrimaryBoxAlias.Clear()
        currDatum.SecondaryBoxAlias.Clear()
        TargetObj = ThirdBox
      Else
        currDatum.PrimaryBoxAlias.Clear()
        currDatum.SecondaryBoxAlias.Clear()
        currDatum.TertiaryBoxAlias.Clear()
      EndIf
      currDatum.ObjAlias.ForceRefTo(TargetObj)
      j += 1
    EndWhile
  EndIf
EndFunction

Function UpdateBuildingPowerObjTarget(ObjectReference akSetBox, RefCollectionAlias akSourceCollection)
  Int I = 0
  Int iLength = PowerBoxCollections.Length
  Bool bFoundBox = False
  uc02_questscript:buildingpowerdatum TargetDatum = None
  Int iArrayIndex = 0
  ReferenceAlias TargetObjAlias = None
  Int iIndex = BuildingPowerData.findstruct("PowerBoxCollection", akSourceCollection, 0)
  TargetDatum = BuildingPowerData[iIndex]
  iArrayIndex = TargetDatum.ArrayIndex
  If TargetDatum.ArrayIndex == 2
    TargetObjAlias = Self.UpdatePowerboxObjective(akSetBox, Building02Boxes)
  ElseIf TargetDatum.ArrayIndex == 3
    TargetObjAlias = Self.UpdatePowerboxObjective(akSetBox, Building03Boxes)
  ElseIf TargetDatum.ArrayIndex == 4
    TargetObjAlias = Self.UpdatePowerboxObjective(akSetBox, Building04Boxes)
  EndIf
  If TargetObjAlias != None
    If TargetObjAlias.GetRef() != TargetDatum.ObjAlias.GetRef()
      TargetDatum.ObjAlias.ForceRefTo(TargetObjAlias.GetRef())
    EndIf
  Else
    TargetDatum.ObjAlias.Clear()
  EndIf
EndFunction

ReferenceAlias Function UpdatePowerboxObjective(ObjectReference akTriggeringBox, ReferenceAlias[] akTargetArray)
  Int I = 0
  Int iLength = akTargetArray.Length
  Bool bFoundTarget = False
  ReferenceAlias ObjAlias = None
  While I < iLength && !bFoundTarget
    ReferenceAlias currAlias = akTargetArray[I]
    If currAlias.GetRef() == akTriggeringBox
      bFoundTarget = True
      currAlias.Clear()
    EndIf
    I += 1
  EndWhile
  Int j = 0
  Bool bFoundAlias = False
  While j < iLength
    ReferenceAlias curralias = akTargetArray[j]
    If curralias.GetRef() != None
      bFoundTarget = True
      ObjAlias = curralias
    EndIf
    j += 1
  EndWhile
  Return ObjAlias
EndFunction

Function UpdatePowerBoxCount(ObjectReference akTargetPowerBox, RefCollectionAlias akSourceColl)
  Int iIndex = PowerBoxes.Find(akTargetPowerBox)
  PowerBoxes.RemoveRef(akTargetPowerBox)
  If iIndex >= 0
    Self.UpdateBuildingPowerObjTarget(akTargetPowerBox, akSourceColl)
  EndIf
  If akSourceColl.GetCount() <= 0 && Self.GetStageDone(ActivatePowerBoxesStage)
    If Self.ModObjectiveGlobal(1.0, UC02_PowerBoxesActivated, PowerBoxActivatedObj, UC02_PowerBoxesTotal.GetValue(), True, True, True, False)
      Self.SetStage(AllPoweredUpObj)
    EndIf
  EndIf
EndFunction

Function TriggerPumpPrimeAudio(Float afInitialWait)
  If afInitialWait > 0.0
    Utility.Wait(afInitialWait)
  EndIf
  PrimeSoundEvent.Play(PrimeSoundSource.GetRef(), None, None)
  Utility.Wait(Utility.RandomFloat(MinPrimePumpDelay, MaxPrimePumpDelay))
  Int I = 0
  Int iCount = 1
  While I < iCount
    ObjectReference currTank = FuelTanks.GetAt(I)
    If !currTank.IsDisabled()
      Utility.Wait(Utility.RandomFloat(MinPrimePumpDelay, MaxPrimePumpDelay))
      PrimeSoundEvent.Play(currTank, None, None)
    EndIf
    I += 1
  EndWhile
EndFunction

Function ToggleRestoreTrackerObj(Bool bEnable)
  If !Self.GetStageDone(TerrormorphDeadStage)
    If bEnable
      If !Self.IsObjectiveDisplayed(RestoreLivestockScannerObj)
        Self.SetObjectiveDisplayed(RestoreLivestockScannerObj, True, False)
      EndIf
    ElseIf Self.IsObjectiveDisplayed(RestoreLivestockScannerObj)
      Self.SetObjectiveDisplayed(RestoreLivestockScannerObj, False, False)
    EndIf
  EndIf
EndFunction

Function SealSecurityBldgDoors(Bool bClose)
  Int I = 0
  Int iCount = SecurityBldgDoors.GetCount()
  While I < iCount
    ObjectReference currRef = SecurityBldgDoors.GetAt(I)
    If bClose
      currRef.SetOpen(False)
      currRef.SetLockLevel(254)
      currRef.Lock(True, False, True)
    Else
      currRef.SetLockLevel(0)
      currRef.Unlock(False)
      currRef.SetOpen(True)
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
