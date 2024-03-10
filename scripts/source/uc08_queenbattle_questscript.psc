ScriptName UC08_QueenBattle_QuestScript Extends Quest

;-- Variables ---------------------------------------
Int iBroadcastSceneDelayTimerID = 3 Const
Int iQueenLockFailsafeCount = 0
Int iQueenLockTimerID = 2 Const
Int iSignalIntroTimerID = 1 Const

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property UC08_AB_SwitchCount Auto Const mandatory
  { Used to track the number of switches thrown }
  GlobalVariable Property UC08_AB_AnomalyLocked Auto Const mandatory
  { Global used to lock the queen place for a little bit after each radar blast }
  GlobalVariable Property UC08_AB_AnomalyTargetsThrallsThreshold Auto Const mandatory
  { Global var tracking how many Thralls can still be around before the Queen can come
    after the player again }
  GlobalVariable Property UC08_AB_AnomalyLockCount Auto Const mandatory
  { Global var tracking how many times we check for thralls before allow the Queen to go back to killing the player }
  GlobalVariable Property UC08_AB_BroadcastDamageMultipler Auto Const mandatory
  { Global used to decide what health percentage should be removed from the anomaly per hit from the broadcast towers }
EndGroup

Group Scenes
  Scene Property UC08_QueenBattle_PercivalHad_FirstSwitch Auto Const mandatory
  { Scene to play when the 1st switch is thrown }
  Scene Property UC08_QueenBattle_PercivalHad_SecondSwitch Auto Const mandatory
  { Scene to play when the 2nd switch is thrown }
  Scene Property UC08_QueenBattle_PercivalHad_ThirdSwitch Auto Const mandatory
  { Scene to play when the 3rd switch is thrown }
EndGroup

Group Spells
  Spell Property CCT_HitSpell_BigStagger Auto Const mandatory
  { Spell used to stagger all the critters in the area when a radar blast goes off }
  Spell Property UC08_CrTerrormorphMindControl_Permanent Auto Const mandatory
  { Spell used to denote which team this NPC is on. In this case, the Queen's }
  Spell Property UC08_CrTerrormorphMindControl_PlayerAlly Auto Const mandatory
  { Spell used to denote which team this NPC is on. In this case, the player's }
EndGroup

Group Aliases
  RefCollectionAlias Property AllHostileThralls Auto Const mandatory
  { Collection that contains all the enemy creatures involved in the fight }
  RefCollectionAlias Property ActiveHostiles Auto Const mandatory
  { Collection that contains only the active enemy critters }
  RefCollectionAlias Property AllAlliedThralls Auto Const mandatory
  { Collection that contains all the allied creatures involved in the fight }
  RefCollectionAlias Property ActiveAlliedThralls Auto Const mandatory
  { Collection that contains just the living creatures allied with the player }
  RefCollectionAlias Property TowerAmbushes Auto Const mandatory
  { Collection used to contain the hand-placed Terrormorph ambushes in this sequence }
  ReferenceAlias Property Queen Auto Const mandatory
  { Alias for the morph queen }
  ReferenceAlias Property Hadrian Auto Const mandatory
  { Ref alias for Hadrian }
  ReferenceAlias Property Kaiser Auto Const mandatory
  { Ref alias for Kaiser }
  ReferenceAlias Property ActiveSignalMarker Auto Const mandatory
  { Holding alias for the signal sound marker's that's currently active }
  ReferenceAlias[] Property SignalMarkers Auto Const mandatory
  { Array of ref aliases for each of the Queen's "signal" sounds }
  ReferenceAlias Property ActiveQueenCombatTarget Auto Const mandatory
  { Holding alias for the Queen's current combat target }
  RefCollectionAlias Property AcelesPlantThralls Auto Const mandatory
  { Ref collection for all the thralls back at the Aceles plant }
EndGroup

Group Factions
  Faction Property TerrormorphMindControlFaction Auto Const mandatory
  { Faction used to denote which thralls are enemies and which aren't }
  Faction Property PlayerAllyFaction Auto Const mandatory
  { Player ally faction. Applied to all allied NPCs as they spawn/swap states }
  Faction Property UC08_PlayerAlignedNPCAllyFaction Auto Const mandatory
  { Faction applied to enemy thralls to get them fighting the Queen }
  Faction Property UC08_TerrormorphAnomalyFriendFaction Auto Const mandatory
  { Faction removed from the player's ally critters to get them fighting the Queen }
EndGroup

Group Ints
  Int Property iSignalIntroTimerLength = 10 Auto Const
  { How long we should wait before triggering the Signal gameplay intro scene }
  Int Property iQueenLockTimerLength = 30 Auto Const
  { How long we should lock the Queen in place after a blast }
  Int Property iSignalIntroStage = 155 Auto Const
  { Stage to set to trigger the Signal Intro scene }
  Int Property iQueenDeadStage = 900 Auto Const
  { Stage to set to trigger the Signal Intro scene }
EndGroup

Group MiscObjs
  Bool Property bBroadcastSceneActive Auto
  { Set true if there's a  broadcast scene actively playing at the moment }
  Explosion Property UC08_BroadcastBlastImpact Auto Const mandatory
  { Explosion used to trigger the broadcast blast }
  wwiseevent Property QST_UC08_Creature_Battle_Reveal_WEF Auto Const mandatory
  { Sound played when allied creatures are revealed }
  ActorValue Property AmbushTriggered Auto Const mandatory
  { Actor value used to trigger the NPC's ambush state }
  ActorValue Property Health Auto Const mandatory
  { Health actor value }
EndGroup


;-- Functions ---------------------------------------

Function TriggerRadarBlast(ObjectReference akBlastSource, RefCollectionAlias akMorphSupportCollection, RefCollectionAlias akThrallSupportCollection)
  If !Self.GetStageDone(iQueenDeadStage)
    UC08_AB_SwitchCount.Mod(1.0)
    ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
    PlayREF.PlaceAtMe(UC08_BroadcastBlastImpact as Form, 1, False, False, True, None, None, True)
    Actor QAct = Queen.GetActorRef()
    If !QAct.IsDead()
      CCT_HitSpell_BigStagger.Cast(QAct as ObjectReference, None)
      Float fBlastDamage = QAct.GetBaseValue(Health) * UC08_AB_BroadcastDamageMultipler.GetValue()
      QAct.DamageValue(Health, fBlastDamage)
    EndIf
    Self.PlayBroadcastScene()
    Self.UpdateSignalMarker()
    Self.StaggerCreatures()
    If !QAct.IsDead()
      Int currSwitchCount = UC08_AB_SwitchCount.GetValueInt()
      If currSwitchCount == 1
        ActiveAlliedThralls.AddRefCollection(akThrallSupportCollection)
        QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF, None, None)
        Self.PrepAllyColl(akThrallSupportCollection)
      ElseIf currSwitchCount == 2
        ActiveAlliedThralls.AddRefCollection(akMorphSupportCollection)
        QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF, None, None)
        Self.PrepAllyColl(akMorphSupportCollection)
      Else
        ActiveAlliedThralls.AddRefCollection(akMorphSupportCollection)
        ActiveAlliedThralls.AddRefCollection(akThrallSupportCollection)
        QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF, None, None)
        Self.PrepAllyColl(akMorphSupportCollection)
        Self.PrepAllyColl(akThrallSupportCollection)
      EndIf
    EndIf
  EndIf
  Self.LockQueen()
EndFunction

Function PlayBroadcastScene()
  If !Queen.GetActorRef().IsDead()
    Int currVal = UC08_AB_SwitchCount.GetValueInt()
    If currVal == 1
      UC08_QueenBattle_PercivalHad_FirstSwitch.Start()
    ElseIf currVal == 2
      UC08_QueenBattle_PercivalHad_SecondSwitch.Start()
    ElseIf currVal == 3
      UC08_QueenBattle_PercivalHad_SecondSwitch.Stop()
      UC08_QueenBattle_PercivalHad_ThirdSwitch.Start()
    EndIf
  EndIf
EndFunction

Function StaggerCreatures()
  Int h = 0
  Int hCount = AllHostileThralls.GetCount()
  While h < hCount
    Actor currACT = AllHostileThralls.GetAt(h) as Actor
    If (currACT as Bool && currACT.IsEnabled()) && currACT.GetValue(AmbushTriggered) >= 1.0
      ActiveHostiles.AddRef(currACT as ObjectReference)
    EndIf
    h += 1
  EndWhile
  Int I = ActiveHostiles.GetCount() - 1
  Int k = 0
  Int kCount = ActiveHostiles.GetCount()
  Int iActiveCount = 0
  While k < kCount
    Actor curract = ActiveHostiles.GetAt(k) as Actor
    If curract.IsEnabled() && curract.GetValue(AmbushTriggered) >= 1.0
      iActiveCount += 1
    EndIf
    k += 1
  EndWhile
  Int j = 0
  Int jTurncoats = 0
  Int currVal = UC08_AB_SwitchCount.GetValueInt()
  If currVal == 3
    jTurncoats = ActiveHostiles.GetCount()
  Else
    jTurncoats = Math.Floor((iActiveCount / (4 - UC08_AB_SwitchCount.GetValueInt())) as Float)
  EndIf
  While I >= 0 && j <= jTurncoats
    Actor curract = ActiveHostiles.GetAt(I) as Actor
    If !curract.IsDisabled() && !curract.IsDead() && curract.GetValue(AmbushTriggered) >= 1.0
      curract.StopCombat()
      curract.StopCombatAlarm()
      curract.RemoveFromFaction(TerrormorphMindControlFaction)
      curract.AddToFaction(PlayerAllyFaction)
      curract.AddToFaction(UC08_PlayerAlignedNPCAllyFaction)
      curract.IgnoreFriendlyHits(True)
      AllAlliedThralls.AddRef(curract as ObjectReference)
      curract.RemoveSpell(UC08_CrTerrormorphMindControl_Permanent)
      AllHostileThralls.RemoveRef(curract as ObjectReference)
      ActiveHostiles.RemoveRef(curract as ObjectReference)
      If !curract.IsDead()
        ActiveAlliedThralls.AddRef(curract as ObjectReference)
      EndIf
      curract.StopCombat()
      curract.StopCombatAlarm()
      curract.EvaluatePackage(False)
      curract.StartCombat(Queen.GetActorRef() as ObjectReference, False)
      j += 1
    EndIf
    I -= 1
  EndWhile
  Int a = 0
  Int aCount = AllAlliedThralls.GetCount()
  While a < aCount
    Actor curract = AllAlliedThralls.GetAt(a) as Actor
    If curract.IsEnabled() && !curract.IsDead() && curract.GetValue(AmbushTriggered) >= 1.0
      
    EndIf
    a += 1
  EndWhile
EndFunction

Function LockQueen()
  Actor QAct = Queen.GetActorRef()
  If !QAct.IsDead()
    Actor CombatTarget = Self.FindNewQueenCombatTarget()
    If CombatTarget
      ActiveQueenCombatTarget.ForceRefTo(CombatTarget as ObjectReference)
      QAct.StartCombat(CombatTarget as ObjectReference, True)
      UC08_AB_AnomalyLocked.SetValue(1.0)
    EndIf
    Int I = ActiveAlliedThralls.GetCount() - 1
    While I >= 0
      Actor currACT = ActiveAlliedThralls.GetAt(I) as Actor
      If currACT.IsDead()
        ActiveAlliedThralls.RemoveRef(currACT as ObjectReference)
      EndIf
      I -= 1
    EndWhile
    Self.StartTimer(iQueenLockTimerLength as Float, iQueenLockTimerID)
  EndIf
EndFunction

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  If UC08_AB_AnomalyLocked.GetValue() >= 1.0
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnDeath")
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterBleedout")
    Actor CombatTarget = Self.FindNewQueenCombatTarget()
    If CombatTarget
      ActiveQueenCombatTarget.ForceRefTo(CombatTarget as ObjectReference)
      Queen.GetActorRef().StartCombat(CombatTarget as ObjectReference, True)
    EndIf
  EndIf
EndEvent

Event Actor.OnEnterBleedout(Actor akSender)
  If UC08_AB_AnomalyLocked.GetValue() >= 1.0
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnDeath")
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterBleedout")
    Actor CombatTarget = Self.FindNewQueenCombatTarget()
    If CombatTarget
      ActiveQueenCombatTarget.ForceRefTo(CombatTarget as ObjectReference)
      Queen.GetActorRef().StartCombat(CombatTarget as ObjectReference, True)
    EndIf
  EndIf
EndEvent

Function StartSignalIntroTimer()
  Self.StartTimer(iSignalIntroTimerLength as Float, iSignalIntroTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iSignalIntroTimerID
    Self.SetStage(iSignalIntroStage)
  ElseIf aiTimerID == iQueenLockTimerID
    UC08_AB_AnomalyLocked.SetValue(0.0)
    Self.UnregisterForRemoteEvent(ActiveQueenCombatTarget.GetActorRef() as ScriptObject, "OnDeath")
  EndIf
EndEvent

Function RemoveMindControlSpell()
  Int I = 0
  Int iCount = AllHostileThralls.GetCount()
  While I < iCount
    Actor currThrall = AllHostileThralls.GetAt(I) as Actor
    currThrall.RemoveSpell(UC08_CrTerrormorphMindControl_Permanent)
    CCT_HitSpell_BigStagger.Cast(currThrall as ObjectReference, None)
    currThrall.AddToFaction(PlayerAllyFaction)
    currThrall.AddToFaction(UC08_PlayerAlignedNPCAllyFaction)
    currThrall.IgnoreFriendlyHits(True)
    currThrall.EvaluatePackage(False)
    currThrall.StopCombat()
    currThrall.StopCombatAlarm()
    I += 1
  EndWhile
  Hadrian.GetActorRef().StopCombat()
  Kaiser.GetActorRef().StopCombat()
  Int j = 0
  Int jCount = AllAlliedThralls.GetCount()
  While j < jCount
    Actor currACT = AllAlliedThralls.GetAt(j) as Actor
    currACT.StopCombat()
    currACT.StopCombatAlarm()
    currACT.EvaluatePackage(False)
    j += 1
  EndWhile
EndFunction

Function KillActiveHostiles()
  ActiveHostiles.KillAll(None)
EndFunction

Function UpdateSignalMarker()
  ObjectReference currRef = ActiveSignalMarker.GetRef()
  currRef.Disable(False)
  ActiveSignalMarker.Clear()
  Int currSwitchCount = UC08_AB_SwitchCount.GetValueInt() - 1
  ObjectReference nextSignal = SignalMarkers[currSwitchCount].GetRef()
  If nextSignal != None
    nextSignal.Enable(False)
    ActiveSignalMarker.ForceRefTo(nextSignal)
  EndIf
EndFunction

Actor Function FindNewQueenCombatTarget()
  Actor QAct = Queen.GetActorRef()
  Int I = 0
  Int iFailsafeCount = 5
  Actor NewTarget = None
  Actor SearchSource = QAct
  While I < iFailsafeCount && NewTarget == None
    Actor PossibleTarget = Game.FindRandomActorFromRef(SearchSource as ObjectReference, 40.0)
    If PossibleTarget.IsInFaction(UC08_PlayerAlignedNPCAllyFaction) && !PossibleTarget.IsDead()
      NewTarget = PossibleTarget
    Else
      SearchSource = PossibleTarget
    EndIf
    I += 1
  EndWhile
  If NewTarget
    Self.RegisterForRemoteEvent(NewTarget as ScriptObject, "OnDeath")
    Self.RegisterForRemoteEvent(NewTarget as ScriptObject, "OnEnterBleedout")
  EndIf
  Return NewTarget
EndFunction

Function PrepAllyColl(RefCollectionAlias akTargetColl)
  Int I = 0
  Int iCount = akTargetColl.GetCount()
  While I < iCount
    Actor currACT = akTargetColl.GetAt(I) as Actor
    currACT.RemoveFromFaction(UC08_TerrormorphAnomalyFriendFaction)
    currACT.AddToFaction(PlayerAllyFaction)
    currACT.AddToFaction(UC08_PlayerAlignedNPCAllyFaction)
    currACT.IgnoreFriendlyHits(True)
    currACT.SetValue(AmbushTriggered, 1.0)
    currACT.EvaluatePackage(False)
    I += 1
  EndWhile
EndFunction

Function CleanUpPlantThralls()
  Int I = 0
  Int iCount = AcelesPlantThralls.GetCount()
  While I < iCount
    Actor currACT = AcelesPlantThralls.GetAt(I) as Actor
    If !currACT.IsDead()
      currACT.Disable(False)
    EndIf
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
