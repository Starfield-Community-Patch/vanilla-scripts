ScriptName LC088_DefensiveBatteryScript Extends SpaceshipReference
{ Script to toggle the Defensive Batteries' Laser Fire. }

;-- Variables ---------------------------------------
Int CONST_AimingTimerDelay = 5 Const
Int CONST_AimingTimerID = 1 Const
Int CONST_BatteryState_Aiming = 0 Const
Int CONST_BatteryState_AimingToFire = 1 Const
Int CONST_BatteryState_Firing = 2 Const
Int CONST_BatteryState_Recharging = 3 Const
Int CONST_FiringTimerExpireDelay = 15 Const
Int CONST_FiringTimerExpireID = 2 Const
Int CONST_FiringTimerLapseHitRecheckTime = 1 Const
Int CONST_FiringTimerLapsedTime = 5 Const
Int CONST_HitCheckTimerDelay = 1 Const
Int CONST_HitCheckTimerID = 4 Const
Int CONST_RechargingTimerDelay = 5 Const
Int CONST_RechargingTimerID = 3 Const
Float CONST_RegenHealthTimerDelay = 0.300000012 Const
Int CONST_RegenHealthTimerID = 5 Const
SpaceshipReference activeCombatTarget
Float baseHealth
Int batteryState
Float firingTimeLastHitTimestamp

;-- Properties --------------------------------------
Group AutofillProperties
  ActorValue Property Health Auto Const mandatory
  ActorValue Property SpaceshipWeaponGroup1SystemHealth Auto Const mandatory
  ActorValue Property SpaceshipWeaponGroup2SystemHealth Auto Const mandatory
  Projectile Property DefensiveBatteryLaserProjectile Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If batteryState != CONST_BatteryState_Recharging
    Self.SetBatteryState(CONST_BatteryState_Aiming)
  EndIf
EndEvent

Function SetBatteryState(Int newState)
  batteryState = newState
  If batteryState == CONST_BatteryState_Aiming
    Self.DamageValue(SpaceshipWeaponGroup2SystemHealth, Self.GetValue(SpaceshipWeaponGroup2SystemHealth))
    Self.RestoreValue(SpaceshipWeaponGroup1SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup1SystemHealth))
    Self.StartTimer(CONST_AimingTimerDelay as Float, CONST_AimingTimerID)
  ElseIf batteryState == CONST_BatteryState_AimingToFire
    Self.RestoreValue(SpaceshipWeaponGroup1SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup1SystemHealth))
    Self.RestoreValue(SpaceshipWeaponGroup2SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup2SystemHealth))
    Self.UpdateActiveCombatTarget(None)
    Self.StartTimer(CONST_HitCheckTimerDelay as Float, CONST_HitCheckTimerID)
  ElseIf batteryState == CONST_BatteryState_Firing
    Self.DamageValue(SpaceshipWeaponGroup2SystemHealth, Self.GetValue(SpaceshipWeaponGroup2SystemHealth))
    Self.RestoreValue(SpaceshipWeaponGroup1SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup1SystemHealth))
    Self.UpdateActiveCombatTarget(None)
    Self.StartTimer(CONST_FiringTimerExpireDelay as Float, CONST_FiringTimerExpireID)
  Else
    Self.DamageValue(SpaceshipWeaponGroup1SystemHealth, Self.GetValue(SpaceshipWeaponGroup1SystemHealth))
    Self.DamageValue(SpaceshipWeaponGroup2SystemHealth, Self.GetValue(SpaceshipWeaponGroup2SystemHealth))
    Self.StartTimer(CONST_RechargingTimerDelay as Float, CONST_RechargingTimerID)
  EndIf
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_AimingTimerID
    Self.SetBatteryState(CONST_BatteryState_AimingToFire)
  ElseIf timerID == CONST_FiringTimerExpireID
    Self.SetBatteryState(CONST_BatteryState_Recharging)
  ElseIf timerID == CONST_RechargingTimerID
    Self.SetBatteryState(CONST_BatteryState_Aiming)
  ElseIf timerID == CONST_HitCheckTimerID
    SpaceshipReference currentCombatTarget = Self.GetCombatTarget()
    If activeCombatTarget != currentCombatTarget
      Self.UpdateActiveCombatTarget(currentCombatTarget)
    EndIf
    Float currentTime = Utility.GetCurrentRealTime()
    If firingTimeLastHitTimestamp < currentTime
      firingTimeLastHitTimestamp = currentTime
    EndIf
    If batteryState == CONST_BatteryState_Firing && (firingTimeLastHitTimestamp + CONST_FiringTimerLapsedTime as Float) < currentTime
      Self.SetBatteryState(CONST_BatteryState_Aiming)
    ElseIf batteryState == CONST_BatteryState_AimingToFire || batteryState == CONST_BatteryState_Firing
      Self.StartTimer(CONST_HitCheckTimerDelay as Float, CONST_HitCheckTimerID)
    EndIf
  ElseIf timerID == CONST_RegenHealthTimerID
    Self.RestoreValue(Health, baseHealth / 25.0)
    If Self.GetValue(Health) < baseHealth
      Self.StartTimer(CONST_RegenHealthTimerDelay, CONST_RegenHealthTimerID)
    EndIf
  EndIf
EndEvent

Function UpdateActiveCombatTarget(SpaceshipReference currentCombatTarget)
  If currentCombatTarget == None
    currentCombatTarget = Self.GetCombatTarget()
  EndIf
  If activeCombatTarget != None
    Self.UnregisterForHitEvent(activeCombatTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
  activeCombatTarget = currentCombatTarget
  If batteryState == CONST_BatteryState_Firing
    Self.SetBatteryState(CONST_BatteryState_Aiming)
  Else
    Self.RegisterForHitEvent(activeCombatTarget as ScriptObject, None, None, DefensiveBatteryLaserProjectile as Form, -1, -1, -1, -1, True)
  EndIf
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akTarget == activeCombatTarget as ObjectReference
    If batteryState == CONST_BatteryState_AimingToFire
      Self.SetBatteryState(CONST_BatteryState_Firing)
    EndIf
    If batteryState == CONST_BatteryState_Firing
      Utility.Wait(CONST_FiringTimerLapseHitRecheckTime as Float)
      firingTimeLastHitTimestamp = Utility.GetCurrentRealTime()
      Self.RegisterForHitEvent(activeCombatTarget as ScriptObject, None, None, DefensiveBatteryLaserProjectile as Form, -1, -1, -1, -1, True)
    EndIf
  EndIf
EndEvent

Function RegenBattery()
  Self.StartTimer(0.0, CONST_RegenHealthTimerID)
EndFunction

;-- State -------------------------------------------
State Active
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellLoad()
    baseHealth = Self.GetBaseValue(Health)
    Self.EnablePartRepair(SpaceshipWeaponGroup1SystemHealth, False)
    Self.EnablePartRepair(SpaceshipWeaponGroup2SystemHealth, False)
    Self.GoToState("Active")
  EndEvent
EndState
