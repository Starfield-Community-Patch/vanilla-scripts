ScriptName MS02Script Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionCrucible Auto Const mandatory
Faction Property CrucibleFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property MS02_PragmatistsFaction Auto Const mandatory
Faction Property MS02_BelieversFaction Auto Const mandatory
Faction Property MS02_RenegadesFaction Auto Const mandatory
GlobalVariable Property MS02_CluesCollected Auto Const mandatory
RefCollectionAlias Property Believers Auto Const mandatory
RefCollectionAlias Property Neutral Auto Const mandatory
RefCollectionAlias Property Pragmatists Auto Const mandatory
RefCollectionAlias Property Renegades Auto Const mandatory
RefCollectionAlias Property Everyone Auto Const mandatory
ReferenceAlias Property Amanirenas Auto Const mandatory
ReferenceAlias Property FDR Auto Const mandatory
ReferenceAlias Property GenghisKhan Auto Const mandatory
ReferenceAlias Property AdaLovelace Auto Const mandatory
ReferenceAlias Property AmeliaEarhart Auto Const mandatory
ReferenceAlias Property HH_Holmes Auto Const mandatory
Int Property GenghisDeadStage01 = 1632 Auto Const
Int Property GenghisDeadStage02 = 1730 Auto Const
Int Property AmanirenasDeadStage01 = 1634 Auto Const
Int Property AmanirenasDeadStage02 = 1832 Auto Const
Int Property FDRDeadStage = 1834 Auto Const
Int Property FightingStoppedStage = 1871 Auto Const
Int Property StopOnHitCheckStage = 1873 Auto Const

;-- Functions ---------------------------------------

Int Function CountClues()
  Int nCluesFound = 0
  If Self.GetStageDone(1001)
    nCluesFound += 1
  EndIf
  If Self.GetStageDone(1002)
    nCluesFound += 1
  EndIf
  If Self.GetStageDone(1003)
    nCluesFound += 1
  EndIf
  If Self.GetStageDone(1004)
    nCluesFound += 1
  EndIf
  If Self.GetStageDone(1005)
    nCluesFound += 1
  EndIf
  If Self.GetStageDone(1006)
    nCluesFound += 1
  EndIf
  If Self.GetStageDone(1007)
    nCluesFound += 1
  EndIf
  MS02_CluesCollected.SetValue(nCluesFound as Float)
  Self.UpdateCurrentInstanceGlobal(MS02_CluesCollected)
  Self.SetObjectiveDisplayed(1000, True, True)
  If nCluesFound >= 7
    Self.SetStage(1100)
  EndIf
EndFunction

Function GoHostile(Actor aTarg)
  aTarg.SetEssential(False)
  aTarg.RemoveFromFaction(CrucibleFaction)
  aTarg.RemoveFromFaction(CrimeFactionCrucible)
  aTarg.RemoveFromFaction(PlayerFriendFaction)
  aTarg.AddToFaction(PlayerEnemyFaction)
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function RemoveFactions()
  Actor myFDR = FDR.GetActorRef()
  Actor myAmani = Amanirenas.GetActorRef()
  Actor myGenghis = GenghisKhan.GetActorRef()
  Actor myAda = AdaLovelace.GetActorRef()
  Actor MyAmelia = AmeliaEarhart.GetActorRef()
  Actor myHolmes = HH_Holmes.GetActorRef()
  Neutral.RemoveFromFaction(CrimeFactionCrucible)
  Neutral.RemoveFromFaction(CrucibleFaction)
  myFDR.RemoveFromFaction(CrimeFactionCrucible)
  myFDR.RemoveFromFaction(CrucibleFaction)
  myAmani.RemoveFromFaction(CrimeFactionCrucible)
  myAmani.RemoveFromFaction(CrucibleFaction)
  myGenghis.RemoveFromFaction(CrimeFactionCrucible)
  myGenghis.RemoveFromFaction(CrucibleFaction)
  myAda.RemoveFromFaction(CrimeFactionCrucible)
  myAda.RemoveFromFaction(CrucibleFaction)
  MyAmelia.RemoveFromFaction(CrimeFactionCrucible)
  MyAmelia.RemoveFromFaction(CrucibleFaction)
  myHolmes.RemoveFromFaction(CrimeFactionCrucible)
  myHolmes.RemoveFromFaction(CrucibleFaction)
  Pragmatists.RemoveFromFaction(CrimeFactionCrucible)
  Pragmatists.RemoveFromFaction(CrucibleFaction)
  Believers.RemoveFromFaction(CrimeFactionCrucible)
  Believers.RemoveFromFaction(CrucibleFaction)
  Renegades.RemoveFromFaction(CrimeFactionCrucible)
  Renegades.RemoveFromFaction(CrucibleFaction)
EndFunction

Function AddEveryone()
  Actor myFDR = FDR.GetActorRef()
  Actor myAmani = Amanirenas.GetActorRef()
  Actor myGenghis = GenghisKhan.GetActorRef()
  Actor myAda = AdaLovelace.GetActorRef()
  Actor MyAmelia = AmeliaEarhart.GetActorRef()
  Actor myHolmes = HH_Holmes.GetActorRef()
  Everyone.AddRef(myFDR as ObjectReference)
  Everyone.AddRef(myAmani as ObjectReference)
  Everyone.AddRef(myGenghis as ObjectReference)
  Everyone.AddRef(myAda as ObjectReference)
  Everyone.AddRef(MyAmelia as ObjectReference)
  Everyone.AddRef(myHolmes as ObjectReference)
  Everyone.AddRefCollection(Pragmatists)
  Everyone.AddRefCollection(Believers)
  Everyone.AddRefCollection(Renegades)
  Everyone.AddRefCollection(Neutral)
EndFunction

Function EveryoneStopFighting()
  Actor myFDR = FDR.GetActorRef()
  Actor myAmani = Amanirenas.GetActorRef()
  Actor myGenghis = GenghisKhan.GetActorRef()
  Self.AddEveryone()
  Everyone.RemoveFromFaction(PlayerEnemyFaction)
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, True, True)
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, True, True)
  MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, True, True)
  MS02_PragmatistsFaction.SetEnemy(MS02_BelieversFaction, True, True)
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, True, True)
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, True, True)
  MS02_RenegadesFaction.SetAlly(MS02_PragmatistsFaction, False, False)
  MS02_RenegadesFaction.SetAlly(MS02_BelieversFaction, False, False)
  MS02_PragmatistsFaction.SetAlly(MS02_RenegadesFaction, False, False)
  MS02_PragmatistsFaction.SetAlly(MS02_BelieversFaction, False, False)
  MS02_BelieversFaction.SetAlly(MS02_PragmatistsFaction, False, False)
  MS02_BelieversFaction.SetAlly(MS02_RenegadesFaction, False, False)
  Everyone.EvaluateAll()
  myFDR.RemoveFromFaction(MS02_PragmatistsFaction)
  Pragmatists.RemoveFromFaction(MS02_PragmatistsFaction)
  myAmani.RemoveFromFaction(MS02_BelieversFaction)
  Believers.RemoveFromFaction(MS02_BelieversFaction)
  myGenghis.RemoveFromFaction(MS02_RenegadesFaction)
  Renegades.RemoveFromFaction(MS02_RenegadesFaction)
  Everyone.StopCombatAlarm()
  Everyone.StopCombat()
  Game.GetPlayer().StopCombatAlarm()
  Self.SetStage(FightingStoppedStage)
  Everyone.EvaluateAll()
EndFunction

Function ResetBaseFactions()
  Self.SetStage(StopOnHitCheckStage)
  Actor myFDR = FDR.GetActorRef()
  Actor myAmani = Amanirenas.GetActorRef()
  Actor myGenghis = GenghisKhan.GetActorRef()
  Actor myAda = AdaLovelace.GetActorRef()
  Actor MyAmelia = AmeliaEarhart.GetActorRef()
  Actor myHolmes = HH_Holmes.GetActorRef()
  myFDR.AddToFaction(CrimeFactionCrucible)
  myFDR.AddToFaction(CrucibleFaction)
  myAmani.AddToFaction(CrimeFactionCrucible)
  myAmani.AddToFaction(CrucibleFaction)
  myGenghis.AddToFaction(CrimeFactionCrucible)
  myGenghis.AddToFaction(CrucibleFaction)
  myAda.AddToFaction(CrimeFactionCrucible)
  myAda.AddToFaction(CrucibleFaction)
  MyAmelia.AddToFaction(CrimeFactionCrucible)
  MyAmelia.AddToFaction(CrucibleFaction)
  myHolmes.AddToFaction(CrimeFactionCrucible)
  myHolmes.AddToFaction(CrucibleFaction)
  Pragmatists.AddToFaction(CrimeFactionCrucible)
  Pragmatists.AddToFaction(CrucibleFaction)
  Believers.AddToFaction(CrimeFactionCrucible)
  Believers.AddToFaction(CrucibleFaction)
  Renegades.AddToFaction(CrimeFactionCrucible)
  Renegades.AddToFaction(CrucibleFaction)
  Neutral.AddToFaction(CrimeFactionCrucible)
  Neutral.AddToFaction(CrucibleFaction)
  Everyone.EvaluateAll()
  Everyone.RemoveAll()
EndFunction
