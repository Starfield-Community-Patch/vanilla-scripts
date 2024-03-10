ScriptName UC07QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct BatteryRecipeComponent
  MiscObject ComponentObject
  Int AmountRequired
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
uc07questscript:batteryrecipecomponent[] Property RecipePieces Auto Const mandatory
{ The various pieces required for the battery and how many we need }
ReferenceAlias Property EclipticSceneTarget Auto Const mandatory
{ Alias to fill if we find a living member of Ecliptic }
RefCollectionAlias Property BatteryContainers Auto Const mandatory
{ Collection containing the list of battery component containers }
RefCollectionAlias Property QuestBatteryMaterials Auto Const mandatory
{ Holding collection for the quest battery materials }
ObjectReference Property UC07_BatteryComponentsSpawn Auto Const mandatory
{ Spawn point for the battery components }
Keyword Property UC07_BatteryComponent Auto Const mandatory
{ Keyword used to designate the a component is one of our quest objects }
Int Property BatteryComponentsDistributedStage = 105 Auto Const
{ Stage to set once all the battery components have been distributed }

;-- Functions ---------------------------------------

Bool Function CheckForLivingSceneTarget(RefCollectionAlias akTargetColl)
  Int I = 0
  Int iCount = akTargetColl.GetCount()
  Bool bFoundNPC = False
  While I < iCount && !bFoundNPC
    Actor currRef = akTargetColl.GetAt(I) as Actor
    If !currRef.IsDead()
      bFoundNPC = True
      EclipticSceneTarget.ForceRefTo(currRef as ObjectReference)
    EndIf
    I += 1
  EndWhile
  Return bFoundNPC
EndFunction

Function DistributeBatteryComponents()
  Int I = 0
  Int iLength = RecipePieces.Length
  While I < iLength
    uc07questscript:batteryrecipecomponent myDatum = RecipePieces[I]
    Int iAmountRequired = myDatum.AmountRequired
    MiscObject currObj = myDatum.ComponentObject
    ObjectReference ObjREF = UC07_BatteryComponentsSpawn.PlaceAtMe(currObj as Form, 1, False, False, True, None, None, True)
    QuestBatteryMaterials.AddRef(ObjREF)
    If iAmountRequired > 1
      Int j = 0
      While j < iAmountRequired
        Self.FindBatteryContainer(ObjREF)
        j += 1
      EndWhile
    ElseIf iAmountRequired == 1
      Self.FindBatteryContainer(ObjREF)
    EndIf
    I += 1
  EndWhile
  Self.SetStage(BatteryComponentsDistributedStage)
EndFunction

Function FindBatteryContainer(ObjectReference akTargetObject)
  Int iCount = BatteryContainers.GetCount()
  Int iIndexMax = iCount - 1
  If iIndexMax < 0
    iIndexMax = 0
  EndIf
  Int iRand = Utility.RandomInt(0, iIndexMax)
  ObjectReference currContainer = BatteryContainers.GetAt(iRand)
  currContainer.AddItem(akTargetObject as Form, 1, False)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
