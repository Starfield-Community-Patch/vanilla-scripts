ScriptName UCR04QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Aliases
  RefCollectionAlias Property Enemies Auto Const mandatory
  { Ref collection for the enemies we'll have in this quest }
  RefCollectionAlias Property UnsampledEnemies Auto Const mandatory
  { Ref collection that contains only enemies that haven't yet had their samples removed }
  RefCollectionAlias Property SpawnMarkers Auto Const mandatory
  { Ref collection holding the spawn markers for the aliens }
  RefCollectionAlias Property CreatureSamples Auto Const mandatory
  { Holding collection for the creature sample items }
  RefCollectionAlias Property ActiveCreatureSamples Auto Const mandatory
  { Collection used for the creature sample items that are now available for collection }
  ReferenceAlias Property PatrolingEnemy Auto Const mandatory
  { Alias to get one of the critters patroling }
  ReferenceAlias Property Player Auto Const mandatory
  { Player quest alias }
  ReferenceAlias Property LegendaryAlias Auto Const mandatory
  { Alias we shove a critter into if we want to make it Legendary }
  ReferenceAlias Property PatrolStartMarker Auto Const mandatory
  { Alias for a patrol path marker }
  RefCollectionAlias Property PatrolingEnemies Auto Const mandatory
  { Ref collection to get the NPCs into a patrolling group }
EndGroup

Group Globals
  GlobalVariable Property UCR04_MinSamplesRequired Auto Const mandatory
  { Minimum samples required on this quest }
  GlobalVariable Property UCR04_MaxSamplesRequired Auto Const mandatory
  { Max number of samples required on this quest }
  GlobalVariable Property UCR04_SamplesTotalRequired Auto Const mandatory
  { Ultimate number of samples the player needs to collect }
  GlobalVariable Property UCR04_SamplesHarvested Auto Const mandatory
  { Tracking global for how many samples the player has collected }
  GlobalVariable Property UCR04_RequireOutOfCombatHarvesting Auto Const mandatory
  { Global used to toggle whether or not the player needs to be in combat to harvest from the critters. Set to ONE by default. }
  GlobalVariable Property UCR04_LegendaryCritterChance Auto Const mandatory
  { Percent change 0-100 that this quest will spawn a legendary critter }
  GlobalVariable Property UCR04_MaxPatrollingEnemies Auto Const mandatory
  { Max number of NPCs we want patrolling together }
  GlobalVariable Property UCR04_MinPatrollingEnemies Auto Const mandatory
  { Min number of NPCs we want patrolling together }
  GlobalVariable Property UCR04_TotalPatrollingEnemies Auto Const mandatory
  { Final count of how many NPCs we want patrolling together }
EndGroup

Group ObjectiveIndicesAndStages
  Int Property SampleCollectObj = 100 Auto Const
  { Objective index telling the player to collect samples }
  Int Property NonLethalObj = 111 Auto Const
  { Objective index telling the player they can do it non-lethaly }
EndGroup

Group Misc
  LocationRefType Property REScenePatrolStartLocRef Auto Const mandatory
  { Loc ref used to designate a marker starting a patrol path }
  Keyword Property UCR04SpecimenTarget Auto Const mandatory
  { Keyword used to find proper specimen targets }
  MiscObject Property UCR04_SpecimenSample Auto Const mandatory
  { The samples the player is hunting }
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to throw when the player tries to harvest material from their target while it's in combat }
  Perk Property UCR04_Critters_ReduceIncomingDamage_c75 Auto Const mandatory
  { Damage reduction perk to make these critters a little tougher }
  ActorValue Property Confidence Auto Const mandatory
  { Confidence actor value }
  Int Property MinConfidenceValue = 3 Auto Const
  { Baseline confidence value we want to give these creatures }
  ucparentfactionquestscript Property DialogueUCFactionAlwaysOn Auto Const mandatory
  { Parent quest for all things UC. Used to manage the custom events for the sample harvesting }
EndGroup


;-- Functions ---------------------------------------

Function PrepQuest()
  Int iSampleAmount = Utility.RandomInt(UCR04_MinSamplesRequired.GetValueInt(), UCR04_MaxSamplesRequired.GetValueInt())
  If iSampleAmount < 1
    iSampleAmount = 1
  ElseIf iSampleAmount > Enemies.GetCount()
    iSampleAmount = Enemies.GetCount()
  EndIf
  UCR04_SamplesHarvested.SetValue(0.0)
  Self.SpawnEnemies(iSampleAmount)
  UCR04_SamplesTotalRequired.SetValue(iSampleAmount as Float)
  (Player as ucr04_playeraliasscript).ReadyPlayerAliasScript(UCR04_SamplesTotalRequired.GetValueInt())
  Self.UpdateCurrentInstanceGlobal(UCR04_SamplesHarvested)
  Self.UpdateCurrentInstanceGlobal(UCR04_SamplesTotalRequired)
  Self.RegisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_UCR04SampleCollected")
  Self.SetObjectiveDisplayed(NonLethalObj, True, False)
  Self.SetObjectiveDisplayedAtTop(SampleCollectObj)
EndFunction

Function SpawnEnemies(Int iNumofSamples)
  Int I = 0
  Int iCount = Enemies.GetCount()
  Int iRand = Utility.RandomInt(0, 2)
  Int iFinalCount = iCount - iRand
  iCount = iFinalCount
  If iCount < iNumofSamples
    iCount = iNumofSamples
  EndIf
  Int iLegendChange = Utility.RandomInt(0, 100)
  If iLegendChange <= UCR04_LegendaryCritterChance.GetValueInt()
    I += 1
    Self.PrepEnemy(LegendaryAlias.GetActorRef())
  EndIf
  UCR04_TotalPatrollingEnemies.SetValue(0.0)
  Int iPatrollerCount = Utility.RandomInt(UCR04_MinPatrollingEnemies.GetValueInt(), UCR04_MaxPatrollingEnemies.GetValueInt())
  UCR04_TotalPatrollingEnemies.SetValue(iPatrollerCount as Float)
  Actor currEnemy = None
  While I < iCount
    currEnemy = Enemies.GetAt(I) as Actor
    Self.PrepEnemy(currEnemy)
    I += 1
  EndWhile
EndFunction

Function PrepEnemy(Actor akEnemyToPrep)
  ObjectReference currSpawn = None
  ObjectReference currSample = None
  Int iSpawnIndex = Utility.RandomInt(0, SpawnMarkers.GetCount() - 1)
  currSpawn = SpawnMarkers.GetAt(iSpawnIndex)
  akEnemyToPrep.MoveTo(currSpawn, 0.0, 0.0, 0.0, True, False)
  If PatrolStartMarker.GetRef() != None && PatrolingEnemies.GetCount() < UCR04_TotalPatrollingEnemies.GetValueInt()
    PatrolingEnemies.AddRef(akEnemyToPrep as ObjectReference)
  EndIf
  currSample = CreatureSamples.GetAt(0)
  ActiveCreatureSamples.AddRef(currSample)
  akEnemyToPrep.AddItem(currSample as Form, 1, False)
  CreatureSamples.RemoveRef(currSample)
  UnsampledEnemies.AddRef(akEnemyToPrep as ObjectReference)
  akEnemyToPrep.AddPerk(UCR04_Critters_ReduceIncomingDamage_c75, False)
  If akEnemyToPrep.GetValue(Confidence) < MinConfidenceValue as Float
    akEnemyToPrep.SetValue(Confidence, MinConfidenceValue as Float)
  EndIf
  akEnemyToPrep.Enable(False)
  currSample.Enable(False)
  akEnemyToPrep.EvaluatePackage(False)
EndFunction

Event UCParentFactionQuestScript.UCR04SampleCollected(ucparentfactionquestscript akSender, Var[] akArgs)
  Actor akTargetCreature = akArgs[0] as Actor
  If akTargetCreature.HasKeyword(UCR04SpecimenTarget)
    If !akTargetCreature.IsInCombat() || UCR04_RequireOutOfCombatHarvesting.GetValueInt() <= 0
      UnsampledEnemies.RemoveRef(akTargetCreature as ObjectReference)
      Int SpecimenCount = akTargetCreature.GetItemCount(UCR04_SpecimenSample as Form)
      akTargetCreature.RemoveItem(UCR04_SpecimenSample as Form, SpecimenCount, False, None)
      Actor PlayACT = Game.GetPlayer()
      Int I = 0
      Int iCount = SpecimenCount
      While I < iCount
        PlayACT.AddAliasedItem(UCR04_SpecimenSample as Form, ActiveCreatureSamples as Alias, 1, True)
        I += 1
      EndWhile
    Else
      NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndEvent

Event OnQuestShutdown()
  Self.UnregisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_UCR04SampleCollected")
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
