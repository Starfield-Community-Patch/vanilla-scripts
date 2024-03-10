ScriptName UC01_ShipSimulationQuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct EnemyWave
  FormList BaseEnemyList
  { Required form list of initial enemies to spawn in }
  Int Difficulty = 2
  { What difficulty level the NPCs should be spawned in }
EndStruct


;-- Variables ---------------------------------------
Bool bSequenceComplete
Int iGetUpTimerID = 4 Const
Int iResetTimerID = 3 Const
Int iTimerID = 1 Const
Int iUpgradeSceneTimerID = 2 Const

;-- Properties --------------------------------------
Group Objects
  FormList Property UC01_SimEnemyShips_FormList Auto Const mandatory
  { List of enemy ships }
  uc01_shipsimulationquestscript:enemywave[] Property EnemyTierLists Auto Const mandatory
  { Array of structs of enemy tiers, as well as the difficulty they should be spawned at }
  ActorValue Property Health Auto Const mandatory
  { Health value }
  ActorValue Property SpaceshipCrew Auto Const mandatory
  { Spaceship crew value (used to get the ships to stop fighting) }
  wwiseevent Property ResetShipSoundEvent Auto Const mandatory
  { Sound to play when the player's ship is being reset }
  GlobalVariable Property UC01_ShipSim_CurrentTier Auto Const mandatory
  { Global used to track the player's progression through the sequence }
  GlobalVariable Property UC01_ShipSim_TotalEnemyCount Auto Const mandatory
  { The total number of enemies the player has to face in order to complete the sequence totally }
  GlobalVariable Property UC01_ShipSim_MinTierRequired Auto Const mandatory
  { How many enemies the player has to kill in order to pass }
  GlobalVariable Property UC01_ShipSim_PlayerDeaths Auto Const mandatory
  { Global var used to track the number of ship deaths. Only saves out after the first go around }
  inputenablelayer Property SimShipEnablePlayer Auto
  { Enable layer that manages the player's controls during the sequence }
  GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountDefeated Auto mandatory
  { Global used to track how many enemies we've defeated in the current wave }
  GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountTotal Auto Const mandatory
  { Global used to track how many total enemies we'll be fighting each wave }
  GlobalVariable Property UC01_ShipSim_Debug_InifinitePerks Auto Const mandatory
  { If set to 1, we don't clean up the player's perks between rounds }
  ActorValue Property WeaponGroup1SystemHealth Auto Const mandatory
  { Spaceship Weapon Group 1 health (used to repair the ship) }
  ActorValue Property WeaponGroup2SystemHealth Auto Const mandatory
  { Spaceship Weapon Group 2 health (used to repair the ship) }
  ActorValue Property WeaponGroup3SystemHealth Auto Const mandatory
  { Spaceship Weapon Group 3 health (used to repair the ship) }
  ActorValue Property EngineSystemHealth Auto Const mandatory
  { Spaceship Engine health (used to repair the ship) }
  ActorValue Property ShieldSystemHealth Auto Const mandatory
  { Spaceship Shield health (used to repair the ship) }
  ActorValue Property GravDriveSystemHealth Auto Const mandatory
  { Spaceship Grav Drive health (used to repair the ship) }
  ActorValue Property ReactorSystemHealth Auto Const mandatory
  { Spaceship Reactor health (used to repair the ship) }
  ActorValue Property ShipSystemEngineEMHealth Auto Const mandatory
  { Spaceship Engine EM health (used to repair the ship) }
  ActorValue Property ShipSystemGravDriveEMHealth Auto Const mandatory
  { Spaceship Grav Drive EM health (used to repair the ship) }
  ActorValue Property ShipSystemShieldsEMHealth Auto Const mandatory
  { Spaceship Shields EM health (used to repair the ship) }
  ActorValue Property ShipSystemWeaponEMHealth Auto Const mandatory
  { Spaceship Weapon EM health (used to repair the ship) }
  ActorValue Property SpaceshipWeaponGroup1EMHealth Auto Const mandatory
  { Spaceship Weapon Group 1 EM health (used to repair the ship) }
  ActorValue Property SpaceshipWeaponGroup2EMHealth Auto Const mandatory
  { Spaceship Weapon Group 1 EM health (used to repair the ship) }
  ActorValue Property SpaceshipWeaponGroup3EMHealth Auto Const mandatory
  { Spaceship Weapon Group 1 EM health (used to repair the ship) }
  Perk[] Property UpgradePerks Auto Const mandatory
  { Array of all the upgrade perks the player can use during this sequence that get removed after a round }
  Scene Property UC01_ShipSimQuest_400b_Upgrade_Manager Auto Const mandatory
  { Upgrade scene. Triggered by all the upgrades, which then loop through each other and trigger the 
    appropriate ones to avoid concatinating. I am super up for better suggestions on how to handle this. }
  GlobalVariable Property UC01_ShipSim_SpawnWaitTimer Auto Const mandatory
  { If we're spawning a large group of enemies, how long should we regularly wait? }
  Potion Property ShipRepairKit Auto Const mandatory
  { Player gets one repair kit per tier }
  GlobalVariable Property UC01_RepairKitPerTier Auto Const mandatory
  { Global used to turn on giving the player a reapir kit every Tier if we want that }
  GlobalVariable Property UC01_RestoreRepairKitsOnFail Auto Const mandatory
  { Global var used to manage if we want to restore the player's repair kits after they fail }
  ActorValue[] Property ShipActorValues Auto Const mandatory
  { Array of actor values that we repair on the ship when it's downed }
  Message Property UC01_ShipSim_ExitPilotSeat Auto Const mandatory
  { Message to show for MKB urging the player to get out of their seat }
  Message Property UC01_ShipSim_ExitPilotSeat_Controller Auto Const mandatory
  { Message to show for Gamepad urging the player to get out of their seat }
  GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Basic Auto Const mandatory
  { Global var for the Ship Sim basic ally }
  GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Debug Auto Const mandatory
  { Global var for the Ship Sim debug ally }
  GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const mandatory
  { Global var for the Ship Sim shields debug bonus }
  GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const mandatory
  { Global var for the Ship Sim weapons debug bonus }
EndGroup

Group Aliases
  RefCollectionAlias Property EnemySpawns Auto Const mandatory
  { Ref collection for the enemy spawns }
  ReferenceAlias Property ActiveEnemy Auto Const mandatory
  { Alias to hold the active opponent for the player }
  RefCollectionAlias Property ActiveEnemies Auto Const mandatory
  { RefColl to hold all the enemies for a given tier }
  ReferenceAlias Property ExitRock Auto Const mandatory
  { The rock that manages the exit for the experience }
  ReferenceAlias Property SimShip Auto Const mandatory
  { Alias for the player's ship }
  ReferenceAlias Property currEnemySpawn Auto Const mandatory
  { Alias used to hold the spawn point of the current enemy }
  ReferenceAlias Property nextEnemySpawn Auto Const mandatory
  { Conditional alias used to find spawn points an appropriate distance away from the player }
  RefCollectionAlias Property AlliedShips Auto Const mandatory
  { Holding collection for any allied ships the player's calling in }
  ReferenceAlias Property ShipSimSeat Auto Const mandatory
  { Alias for the Sim Ship's seat. Used to check if the player's still sitting in it }
EndGroup

Group Scenes
  Scene Property UC01_ShipSimulatorHelperQuest_300_NewTargetAvailable Auto Const mandatory
  { New target available scene }
  Scene Property UC01_ShipSimulatorHelperQuest_300a_TargetDefeated Auto Const mandatory
  { Enemy defeated scene }
  Scene Property UC01_ShipSimulatorHelperQuest_601_PrepareForNextOpponent Auto Const mandatory
  { Scene to play after the player's reset the sequence }
EndGroup

Group Vars
  Float Property CountdownTimer = 8.0 Auto Const
  { How long to wait after telling the player the next wave is coming to spawn them }
  Float Property ResetTimerLength = 0.25 Auto Const
  { How long to wait until kicking off the reset sequence }
  Float Property GetUpTimerLength = 14.0 Auto Const
  { How long to wait to check and tell the player to get out of their seat again }
  Int Property WaitForNextEnemyObj = 250 Auto Const
  { Objective directing player to wait for the next enemy }
  Int Property EngageEnemyObj = 300 Auto Const
  { Objective index directing the player to attack the new enemy }
  Int Property PlayerPassedStage = 400 Auto Const
  { Stage to set if the player's successfully passed the sequence }
  Int Property ProceedToPilotsSeatObjIndex = 100 Auto Const
  { Objective index for directing the player to sit in the pilot's seat }
  Int Property TriggerResetObjIndex = 350 Auto Const
  { Objective index for directing the player to reset the sequence }
EndGroup

Group Properties
  Bool Property bResetRequired Auto conditional
  { Used to track if the quest is in need of reseting }
  Bool Property bSequencePaused Auto conditional
  { Used to track if the quest is paused (player hasn't both reset the sequence AND reentered the pilots seat) }
  Bool Property bSequenceInited Auto conditional
  { Used to track if the combat sequence has been started }
  Int Property FailureCount Auto conditional
  { Count how many times the player has failed. Open up new dialogue options if it's more than once }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  UC01_ShipSim_CurrentTier.SetValue(0.0)
  UC01_ShipSim_TotalEnemyCount.SetValue(EnemyTierLists.Length as Float)
  Self.ResetDebugGlobals()
EndEvent

Function ResetDebugGlobals()
  UC01_ShipSim_Debug_AllySpawned_Basic.SetValue(0.0)
  UC01_ShipSim_Debug_AllySpawned_Debug.SetValue(0.0)
  UC01_ShipSim_Debug_InifinitePerks.SetValue(0.0)
  UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(0.0)
  UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(0.0)
EndFunction

Function ApplyShipPerk(Perk akPerkToApply)
  SimShip.GetShipRef().AddPerk(akPerkToApply, False)
EndFunction

Function BeginSequence()
  Self.StartCooldownTimer(-1.0)
  bSequenceInited = True
  (ExitRock as uc01_rockaliasscript).StartSequence()
EndFunction

Function StartNewWave()
  If !bSequenceComplete
    Self.SpawnEnemies()
  EndIf
EndFunction

Function SpawnEnemies()
  Int h = 0
  Int hCount = EnemySpawns.GetCount()
  ObjectReference[] TempSpawns = new ObjectReference[hCount]
  While h < hCount
    TempSpawns[h] = EnemySpawns.GetAt(h)
    h += 1
  EndWhile
  Int currWave = UC01_ShipSim_CurrentTier.GetValueInt()
  FormList currList = EnemyTierLists[currWave].BaseEnemyList
  Int currDifficulty = EnemyTierLists[currWave].Difficulty
  Int I = 0
  Int iCount = currList.GetSize()
  Bool waitAfterEveryShipSpawn = iCount > 3
  Float fWaitTimer = UC01_ShipSim_SpawnWaitTimer.GetValue()
  While I < iCount
    Int iRand = Utility.RandomInt(0, TempSpawns.Length - 1)
    ObjectReference EnemySpawn = TempSpawns[iRand]
    If EnemySpawn == None
      h = 0
      While h < hCount
        TempSpawns.add(EnemySpawns.GetAt(h), 1)
        h += 1
      EndWhile
      EnemySpawn = TempSpawns[0]
      iRand = 0
    EndIf
    Form CurrentEnemy = currList.GetAt(I)
    spaceshipreference NewEnemy = EnemySpawn.PlaceShipAtMe(CurrentEnemy, currDifficulty, True, False, False, True, None, None, None, True)
    If CurrentEnemy != None && NewEnemy != None
      ActiveEnemies.AddRef(NewEnemy as ObjectReference)
      TempSpawns.remove(iRand, 1)
    EndIf
    If waitAfterEveryShipSpawn
      Utility.Wait(fWaitTimer)
    ElseIf I != 0 && I % 2 == 0
      Utility.Wait(fWaitTimer)
    EndIf
    I += 1
  EndWhile
  If ActiveEnemies.GetCount() > 0
    UC01_ShipSimulatorHelperQuest_300_NewTargetAvailable.Start()
    Self.SetObjectiveDisplayed(WaitForNextEnemyObj, False, False)
    UC01_ShipSim_CurrentWaveEnemyCountTotal.SetValue(iCount as Float)
    Self.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountTotal)
    Self.SetObjectiveDisplayedAtTop(EngageEnemyObj)
    Int j = 0
    Int jCount = ActiveEnemies.GetCount()
    While j < jCount
      spaceshipreference currEnemy = ActiveEnemies.GetAt(j) as spaceshipreference
      currEnemy.EnableWithGravJump()
      j += 1
    EndWhile
  EndIf
EndFunction

Function EnemyDefeated()
  If !bSequenceComplete && !bSequencePaused
    Self.SetObjectiveDisplayed(EngageEnemyObj, False, False)
    UC01_ShipSim_CurrentTier.Mod(1.0)
    If UC01_ShipSim_CurrentTier.GetValue() >= UC01_ShipSim_MinTierRequired.GetValue()
      Self.SetStage(PlayerPassedStage)
    EndIf
    UC01_ShipSimulatorHelperQuest_300a_TargetDefeated.Start()
  EndIf
EndFunction

Function ClearShipUpgrades()
  If UC01_ShipSim_Debug_InifinitePerks.GetValue() < 1.0
    Int I = 0
    Int iLength = UpgradePerks.Length
    While I < iLength
      Perk currPerk = UpgradePerks[I]
      spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference
      If PlayerShip.HasPerk(currPerk)
        PlayerShip.RemovePerk(currPerk)
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Function PauseSequence()
  bSequencePaused = True
  bResetRequired = True
  Self.ClearShipUpgrades()
  Self.CancelTimer(iTimerID)
  Int I = 0
  Int iCount = ActiveEnemies.GetCount()
  While I < iCount
    spaceshipreference currRef = ActiveEnemies.GetAt(I) as spaceshipreference
    currRef.SetUnconscious(True)
    currRef.SetGhost(True)
    I += 1
  EndWhile
  Self.SetObjectiveFailed(EngageEnemyObj, True)
EndFunction

Function DirectPlayerToReset()
  Self.SetObjectiveDisplayed(TriggerResetObjIndex, True, False)
  Self.ToggleGetUpTimer(True)
EndFunction

Function DirectPlayerToPilotsSeat()
  Self.ToggleGetUpTimer(False)
  Self.SetObjectiveDisplayed(TriggerResetObjIndex, True, False)
EndFunction

Function TriggerResetTimer()
  Self.StartTimer(ResetTimerLength, iResetTimerID)
EndFunction

Function ResetSequence()
  bResetRequired = False
  FailureCount += 1
  Self.ToggleGetUpTimer(False)
  Int I = ActiveEnemies.GetCount() - 1
  While I >= 0
    ObjectReference currObj = ActiveEnemies.GetAt(I)
    spaceshipreference currRef = currObj as spaceshipreference
    currRef.DisableWithGravJump()
    ActiveEnemies.RemoveRef(currObj)
    I -= 1
  EndWhile
  Self.RepairPlayerShip()
  If UC01_RestoreRepairKitsOnFail.GetValueInt() > 0
    spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference
    Int iKitsToAdd = 3 - PlayerShip.GetItemCount(ShipRepairKit as Form)
    If iKitsToAdd > 0
      PlayerShip.AddItem(ShipRepairKit as Form, iKitsToAdd, True)
    EndIf
  EndIf
  UC01_ShipSim_CurrentWaveEnemyCountDefeated.SetValue(0.0)
  Self.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated)
  Self.SetObjectiveDisplayed(TriggerResetObjIndex, False, False)
  Self.SetObjectiveDisplayed(ProceedToPilotsSeatObjIndex, True, False)
EndFunction

Function ResumeCombatSequence()
  bSequencePaused = False
  UC01_ShipSimulatorHelperQuest_601_PrepareForNextOpponent.Start()
EndFunction

Function RepairPlayerShip()
  spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference
  Bool PlayRepairSound = Self.CheckForRepairAudio()
  PlayerShip.RestoreValue(Health, PlayerShip.GetValue(Health))
  PlayerShip.RestoreValue(WeaponGroup1SystemHealth, 1000000.0)
  PlayerShip.RestoreValue(WeaponGroup2SystemHealth, 1000000.0)
  PlayerShip.RestoreValue(WeaponGroup3SystemHealth, 1000000.0)
  PlayerShip.RestoreValue(EngineSystemHealth, 1000000.0)
  PlayerShip.RestoreValue(ShieldSystemHealth, 1000000.0)
  PlayerShip.RestoreValue(GravDriveSystemHealth, 1000000.0)
  PlayerShip.RestoreValue(ReactorSystemHealth, 1000000.0)
  PlayerShip.RestoreValue(ShipSystemEngineEMHealth, 1000000.0)
  PlayerShip.RestoreValue(ShipSystemGravDriveEMHealth, 1000000.0)
  PlayerShip.RestoreValue(ShipSystemShieldsEMHealth, 1000000.0)
  PlayerShip.RestoreValue(ShipSystemWeaponEMHealth, 1000000.0)
  PlayerShip.RestoreValue(SpaceshipWeaponGroup1EMHealth, 1000000.0)
  PlayerShip.RestoreValue(SpaceshipWeaponGroup2EMHealth, 1000000.0)
  PlayerShip.RestoreValue(SpaceshipWeaponGroup3EMHealth, 1000000.0)
  If UC01_RepairKitPerTier.GetValueInt() > 0 && PlayerShip.GetItemCount(ShipRepairKit as Form) < 1
    PlayerShip.AddItem(ShipRepairKit as Form, 1, True)
  EndIf
  If PlayRepairSound
    ResetShipSoundEvent.PlayAndWait(SimShip.GetRef(), None, None)
  EndIf
EndFunction

Bool Function CheckForRepairAudio()
  Int I = 0
  Int iLength = ShipActorValues.Length
  Bool bPlayRepairSound = False
  spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference
  While I < iLength && !bPlayRepairSound
    ActorValue currValue = ShipActorValues[I]
    If PlayerShip.GetBaseValue(currValue) != PlayerShip.GetValue(currValue)
      bPlayRepairSound = True
    EndIf
    I += 1
  EndWhile
  Return bPlayRepairSound
EndFunction

Function SpawnPlayerAlly(Form akBaseObject)
  spaceshipreference NewAlly = SimShip.GetRef().PlaceShipNearMe(akBaseObject, 0, 0, 0, 4, True, False, False, True, None)
  NewAlly.IgnoreFriendlyHits(True)
  AlliedShips.AddRef(NewAlly as ObjectReference)
EndFunction

Function StartCooldownTimer(Float fTimerOverride)
  If fTimerOverride > -1.0
    Self.StartTimer(fTimerOverride, iTimerID)
  Else
    Self.StartTimer(CountdownTimer, iTimerID)
  EndIf
  Self.SetObjectiveDisplayed(ProceedToPilotsSeatObjIndex, False, False)
  Self.SetObjectiveDisplayed(EngageEnemyObj, False, False)
  Self.SetObjectiveDisplayedAtTop(WaitForNextEnemyObj)
  Self.RepairPlayerShip()
EndFunction

Function ShutdownSimulation()
  bSequenceComplete = True
  Self.CancelTimer(iTimerID)
  ActiveEnemy.GetActorRef().SetUnconscious(True)
EndFunction

Function TriggerUpgradeScene()
  Self.StartTimer(0.5, iUpgradeSceneTimerID)
EndFunction

ObjectReference Function FindEnemySpawn()
  ObjectReference NextSpawn = None
  ObjectReference MostRecentEnemySpawn = currEnemySpawn.GetRef()
  ObjectReference FallbackSpawn = EnemySpawns.GetAt(Utility.RandomInt(0, EnemySpawns.GetCount() - 1))
  nextEnemySpawn.RefillAlias()
  ObjectReference PossibleNextSpawn = nextEnemySpawn.GetRef()
  If nextEnemySpawn as Bool && PossibleNextSpawn != MostRecentEnemySpawn
    NextSpawn = PossibleNextSpawn
  Else
    NextSpawn = FallbackSpawn
  EndIf
  Return NextSpawn
EndFunction

Function SetEnemyScale(Float fScaletoSet)
  Int I = 0
  Int iCount = ActiveEnemies.GetCount()
  While I < iCount
    ObjectReference currRef = ActiveEnemies.GetAt(I)
    currRef.SetScale(fScaletoSet)
    I += 1
  EndWhile
EndFunction

Event OnTimer(Int aiTimerID)
  If !bSequenceComplete && aiTimerID == iTimerID
    Self.StartNewWave()
  ElseIf aiTimerID == iUpgradeSceneTimerID
    UC01_ShipSimQuest_400b_Upgrade_Manager.Start()
  ElseIf aiTimerID == iResetTimerID
    Self.ResetSequence()
  ElseIf aiTimerID == iGetUpTimerID
    Self.CheckForGetUpMessage()
  EndIf
EndEvent

Function ToggleGetUpTimer(Bool bStart)
  If bStart
    Self.StartTimer(GetUpTimerLength, iGetUpTimerID)
  Else
    Self.CancelTimer(iGetUpTimerID)
  EndIf
EndFunction

Function CheckForGetUpMessage()
  If bSequencePaused
    If Game.GetPlayer().GetFurnitureUsing() == ShipSimSeat.GetRef()
      If Game.UsingGamepad()
        UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
      Else
        UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
      EndIf
    EndIf
    Self.ToggleGetUpTimer(True)
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
