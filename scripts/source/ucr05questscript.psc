ScriptName UCR05QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct TargetDatum
  ActorBase Target
  { Lvl used to spawn an appropriate NPC }
  Int TargetIndex = -1
  { Index used to manage any custom dialogue or behaviors in the quest }
EndStruct


;-- Variables ---------------------------------------
Int iSpawnIndex

;-- Properties --------------------------------------
ucr05questscript:targetdatum[] Property PossibleTargets Auto Const mandatory
{ Array of targets for the quest }
ReferenceAlias Property ChosenTarget Auto Const mandatory
{ Alias that holds the chosen target and any specific behaviors }
ReferenceAlias Property Bodyguard Auto Const mandatory
{ Alias for the player's bodyguard }
Int Property TargetIndex = -1 Auto conditional
{ Property used to keep track of any custom dialogue/behaviors for this NPC }
RefCollectionAlias Property PossibleSpawnPoints Auto Const mandatory
{ Collection of possible spawn points for our target }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int iRand = Utility.RandomInt(0, PossibleTargets.Length - 1)
  If iRand < 0 || iRand >= PossibleTargets.Length
    iRand = 0
  EndIf
  iSpawnIndex = iRand
  Self.SpawnTarget(iRand, False, False)
EndEvent

Function SpawnTarget(Int iTargetIndex, Bool bSpawnAtPlayer, Bool bAttemptRespawn)
  If iTargetIndex < 0 || iTargetIndex >= PossibleTargets.Length
    
  Else
    If bAttemptRespawn
      iTargetIndex = iSpawnIndex
    EndIf
    ucr05questscript:targetdatum currDatum = PossibleTargets[iTargetIndex]
    ActorBase TargetType = currDatum.Target
    Int iRand = Utility.RandomInt(0, PossibleSpawnPoints.GetCount() - 1)
    ObjectReference SpawnRef = PossibleSpawnPoints.GetAt(iRand)
    ObjectReference TargetRef = SpawnRef.PlaceAtMe(TargetType as Form, 1, False, True, True, None, ChosenTarget as Alias, True)
    TargetRef.MoveToNearestNavmeshLocation()
    TargetRef.Enable(False)
    (TargetRef as Actor).EvaluatePackage(False)
    Actor BodyACT = Bodyguard.GetActorRef()
    BodyACT.MoveTo(TargetRef, 0.0, 0.0, 0.0, True, False)
    BodyACT.MoveToNearestNavmeshLocation()
    BodyACT.Enable(False)
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
