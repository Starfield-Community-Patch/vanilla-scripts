ScriptName CompanionCrimeFactionHostilityScript Extends Actor
{ Makes Companion Crime Faction hostile if they are ever in combat with a shared crime faction which is enemy to the player because of crime }

;-- Variables ---------------------------------------
Float TimerInterval = 3.0 Const

;-- Properties --------------------------------------
Faction[] Property IgnoreSharedCrimeForAnyoneInTheseFactions Auto Const
{ Even if the companion would help them because they are in his shared crime list, ignore it if they are in this faction. }

;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0
    Self.StartTimer(Game.GetGameSettingFloat("fCombatYieldTime"), 0)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  Self.TestForSharedCrimeCombatants()
  If Self.IsInCombat()
    Self.StartTimer(TimerInterval, 0)
  EndIf
EndEvent

Function TestForSharedCrimeCombatants()
  Faction myCrimeFaction = Self.GetCrimeFaction()
  If myCrimeFaction.IsPlayerEnemy()
    Return 
  EndIf
  Actor[] combatants = Self.GetAllCombatTargets()
  Int I = 0
  Int max = combatants.Length
  While I < max
    Faction currentCrimeFaction = combatants[I].GetCrimeFaction()
    If currentCrimeFaction as Bool && currentCrimeFaction.IsPlayerEnemy()
      If myCrimeFaction.IsFactionInCrimeGroup(currentCrimeFaction) && commonarrayfunctions.CheckActorAgainstFactionArray(combatants[I], IgnoreSharedCrimeForAnyoneInTheseFactions, False) == False
        myCrimeFaction.SetPlayerEnemy(True)
        Return 
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction
