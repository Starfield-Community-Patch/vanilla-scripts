ScriptName rq_scancreaturesscript Extends RQScript

;-- Structs -----------------------------------------
Struct herdSize
  Keyword herdSizeKeyword
  Int extraSpawnCount
  Float rewardMult
EndStruct


;-- Variables ---------------------------------------
ActorBase ScanTargetBase
Int iDebugNextTarget

;-- Properties --------------------------------------
Group Scan_Properties
  Int Property ObjectiveToDisplayForScanning = 100 Auto Const
  { Objective for scanning }
  Int Property StageToSetIfScannedDead = 150 Auto Const
  { Stage to set when scanning a target that is dead) }
  Int Property SpawnStage = 200 Auto Const
  { Spawn some targets at this stage to ensure some exist (the stage when player is given the objective) }
  Int Property StageToSetOnCompletelyScanned = 300 Auto Const
  { Stage to set when scanning target base object's GetPercentageKnown() >= 1 }
  GlobalVariable Property PercentageScannedTextDisplay Auto Const mandatory
  { Quest instance global to use to display percentage in quest objective }
  GlobalVariable Property CreditsRewardRadiantQuestLarge Auto Const mandatory
  { base value for quest reward }
  GlobalVariable Property RQ_ScanQuestReward Auto Const mandatory
  { actual value for quest reward - modified by herd size (solitary creatures are much harder to find) }
  ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
  { The center marker of the area to spawn predators and prey }
  RefCollectionAlias Property ScanTargets Auto Const mandatory
  { Ref Collection that will hold targets; currently spawned }
  ReferenceAlias Property SpawnAt Auto Const mandatory
  { Where to spawn Targets at }
  Int Property SpawnAmountMinBase = 1 Auto Const
  Int Property SpawnAmountMaxBase = 3 Auto Const
  rq_scancreaturesscript:herdsize[] Property HerdSizeSpawnCount Auto Const
  { array matching herd size keyword with extra spawn count }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  RQ_ScanQuestReward.SetValue(CreditsRewardRadiantQuestLarge.GetValueInt() as Float)
  If Self.InitializeScanTarget()
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerScannedObject")
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnKill")
  Else
    Self.Shutdown()
  EndIf
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == SpawnStage
    Self.SpawnTargetRefs()
  EndIf
EndEvent

Event Actor.OnPlayerScannedObject(Actor akSender, ObjectReference akScannedRef)
  Self.TryToUpdatePercentKnown(akScannedRef)
EndEvent

Event Actor.OnKill(Actor akSender, ObjectReference akVictim)
  Self.TryToUpdatePercentKnown(akVictim)
EndEvent

Function TryToUpdatePercentKnown(ObjectReference akTargetReference)
  Actor actorRef = akTargetReference as Actor
  If actorRef
    ActorBase scannedActorBase = actorRef.GetMatchingPlanetActorBase()
    If scannedActorBase == ScanTargetBase
      Self.UpdatePercentKnown(actorRef as ObjectReference, True)
    EndIf
  EndIf
EndFunction

Bool Function InitializeScanTarget()
  Bool initialized = False
  ObjectReference spawnAtRef = SpawnAt.GetReference()
  ActorBase[] allowedBases = spawnAtRef.GetBiomeActors(0.5)
  If allowedBases.Length == 0
    
  Else
    Int iRandom = Utility.RandomInt(0, allowedBases.Length - 1)
    ScanTargetBase = allowedBases[iRandom]
    ObjectReference spawnedRef = spawnAtRef.PlaceAtMe(ScanTargetBase as Form, 1, False, False, True, None, ScanTargets as Alias, True)
    Float percentageKnown = spawnedRef.GetPercentageKnown()
    Self.UpdatePercentKnown(spawnedRef, False)
    initialized = True
  EndIf
  Return initialized
EndFunction

Function UpdatePercentKnown(ObjectReference scannedRef, Bool removeRefFromTargetsCollection)
  Float percentageKnown = scannedRef.GetPercentageKnown()
  Int precentAsInt = (percentageKnown * 100.0) as Int
  PercentageScannedTextDisplay.SetValue(precentAsInt as Float)
  Self.UpdateCurrentInstanceGlobal(PercentageScannedTextDisplay)
  Actor scannedActorRef = scannedRef as Actor
  If scannedActorRef as Bool && scannedActorRef.IsDead()
    Self.SetStage(StageToSetIfScannedDead)
  EndIf
  If percentageKnown >= 1.0
    Self.SetStage(StageToSetOnCompletelyScanned)
  EndIf
  If removeRefFromTargetsCollection
    ScanTargets.RemoveRef(scannedRef)
  EndIf
EndFunction

Function SpawnTargetRefs()
  ObjectReference spawnAtRef = SpawnAt.GetReference()
  ObjectReference spawnedRef = ScanTargets.GetAt(0)
  Int minSpawnCount = SpawnAmountMinBase
  Int maxSpawnCount = SpawnAmountMaxBase
  Int h = 0
  Bool foundHerd = False
  While h < HerdSizeSpawnCount.Length && foundHerd == False
    rq_scancreaturesscript:herdsize theHerdSize = HerdSizeSpawnCount[h]
    foundHerd = spawnedRef.HasKeyword(theHerdSize.herdSizeKeyword)
    If foundHerd
      minSpawnCount += theHerdSize.extraSpawnCount
      maxSpawnCount += theHerdSize.extraSpawnCount
      RQ_ScanQuestReward.SetValueInt(Math.Floor(CreditsRewardRadiantQuestLarge.GetValue() * theHerdSize.rewardMult))
    EndIf
    h += 1
  EndWhile
  Int amountToSpawn = Utility.RandomInt(minSpawnCount, maxSpawnCount)
  If amountToSpawn > 0
    ObjectReference[] spawnedRefs = new ObjectReference[0]
    Int I = 0
    While I < amountToSpawn
      spawnedRefs.add(spawnAtRef.PlaceAtMe(ScanTargetBase as Form, 1, False, False, True, None, None, True), 1)
      I += 1
    EndWhile
    ScanTargets.AddArray(spawnedRefs)
  EndIf
EndFunction

Function DebugMoveToNextTarget()
  Game.GetPlayer().MoveTo(ScanTargets.GetAt(iDebugNextTarget), 0.0, 0.0, 0.0, True, False)
  iDebugNextTarget += 1 % ScanTargets.GetCount()
EndFunction
