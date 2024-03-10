ScriptName REParentScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ConstProperties
  Faction Property REPlayerFriend Auto Const mandatory
  Faction Property REPlayerEnemy Auto Const mandatory
  Faction Property REIgnoreForCleanup Auto Const mandatory
  { add actors to this faction to have them ignored during cleanup check
	  i.e. quest can clean up even if they are loaded/alive }
  GlobalVariable Property GameDaysPassed Auto Const mandatory
  GlobalVariable Property REGlobalCooldown Auto Const mandatory
  { global variable which holds the time that GameDaysPassed has to exceed before another RE can trigger }
  Float Property GlobalCooldownDays = 0.0 Auto
  { how long after a RE is triggered before another encounter can trigger? }
  Explosion Property REDeathExplosion Auto Const mandatory
  Keyword Property RELootedCorpse Auto conditional Const mandatory
  Keyword Property LocTypeStarSystem Auto conditional Const mandatory
  { use to check for system locations }
EndGroup


;-- Functions ---------------------------------------

Function KillWithForce(Actor akVictim, Actor akKiller, Bool abKillSilent)
  Int waitCount = 0
  Float afForceMagnitude = 150.0
  While !akVictim.Is3DLoaded() && waitCount < 10
    waitCount += 1
    Utility.wait(0.5)
  EndWhile
  If abKillSilent
    akVictim.KillSilent(akKiller)
  Else
    akVictim.Kill(akKiller)
  EndIf
  If akVictim.Is3DLoaded()
    Int aiForceDirection = Utility.RandomInt(1, 4)
    akVictim.ApplyHavokImpulse(0.0, 0.0, 1.0, 250.0)
    Utility.wait(0.200000003)
    akVictim.PlaceAtMe(REDeathExplosion as Form, 1, False, False, True, None, None, True)
  EndIf
EndFunction

Function KillWithForceNoWait(Actor akVictim, Actor akKiller, Bool abKillSilent)
  Var[] akArgs = new Var[3]
  akArgs[0] = akVictim as Var
  akArgs[1] = akKiller as Var
  akArgs[2] = abKillSilent as Var
  Self.CallFunctionNoWait("KillWithForce", akArgs)
EndFunction

Function LootContainer(ObjectReference lootingRef, ObjectReference targetRef)
  targetRef.RemoveAllItems(lootingRef, False, False)
  targetRef.AddKeyword(RELootedCorpse)
EndFunction

Function UpdateGlobalCooldown()
  REGlobalCooldown.SetValue(GameDaysPassed.GetValue() + GlobalCooldownDays)
EndFunction

Function RandomlyEnableOrKill(ReferenceAlias theAlias, Int PercentChanceEnable, Int PercentChanceKill)
  Self.RandomlyEnableOrKillActor(theAlias.GetActorRef(), PercentChanceEnable, PercentChanceKill)
EndFunction

Function RandomlyEnableOrKillCollection(RefCollectionAlias theCollection, Int PercentChanceEnable, Int PercentChanceKill, Int minimumEnableCount)
  Int I = 0
  While I < theCollection.GetCount()
    Actor theActor = theCollection.GetAt(I) as Actor
    If I < minimumEnableCount
      theActor.Enable(False)
    Else
      Self.RandomlyEnableOrKillActor(theActor, PercentChanceEnable, PercentChanceKill)
    EndIf
    I += 1
  EndWhile
EndFunction

Function RandomlyEnableOrKillActor(Actor theActor, Int PercentChanceEnable, Int PercentChanceKill)
  If theActor
    If Utility.RandomInt(0, 100) <= PercentChanceEnable
      theActor.Enable(False)
      If Utility.RandomInt(0, 100) <= PercentChanceKill
        theActor.KillSilent(None)
      EndIf
    Else
      theActor.KillSilent(None)
    EndIf
  EndIf
EndFunction

Function SendCleanupEvent()
  Self.SendCustomEvent("reparentscript_RECheckForCleanup", None)
EndFunction
