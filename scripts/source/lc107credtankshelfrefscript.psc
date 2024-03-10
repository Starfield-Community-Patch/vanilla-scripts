ScriptName LC107CredTankShelfRefScript Extends LC107CredTankSystemRefScript
{ Script for the CredTank Racks in the Vault.

CredTank Racks are instanced packins consisting of:
- This script, on the pivot dummy.
- The shelves themselves, linked to an enable marker.
- A set of 'Responsive' CredTanks, which this script animates based on player proximity, linked to an enable marker.
- A set of 'Always-On' CredTanks, linked to an enable marker.
- A set of 'Always-Off' CredTanks, linked to an enable marker.

The Responsive CredTanks look Off at Position=0, and On at Position=1, but we have to use this elaborate and complicated
system of enable swaps for perf reasons-- the renderer doesn't support having this many animatable objects enabled at
the same time, in the same cell. (Even if they aren't actually animating at any given moment, the mere fact that they
*could* animate is enough to kill the perf.) There's been a lot of back-and-forth over this. }

;-- Variables ---------------------------------------
Float CONST_CredTankProximityMaxRange = 20.0 Const
Float CONST_CredTankProximityMinRange = 2.0 Const
Int CONST_CredTankProximityPrecision = 4 Const
Float CONST_CredTankShelfTimerDelay = 1.0 Const
Int CONST_PlayerEnteredVaultStage = 301 Const
Float credTankProximityRange
ObjectReference[] credTanks
ObjectReference offTanksEnableMarker
ObjectReference onTanksEnableMarker
Actor player
Bool playerEnteredVaultStageDone
Int playerLastSeenUpdatesAgo
ObjectReference responsiveTanksEnableMarker
ObjectReference shelfEnableMarker
ObjectReference shelfTrigger
Bool verbose

;-- Properties --------------------------------------
Group AutofillProperties
  GlobalVariable Property LC107CredTankShelvesCurrentGlobal Auto Const mandatory
  GlobalVariable Property LC107CredTankShelvesTotalGlobal Auto Const mandatory
  Keyword Property LC107_LinkCredTankShelfTrigger Auto Const mandatory
  Keyword Property LC107_LinkCredTankEnableMarker Auto Const mandatory
EndGroup

String Property CONST_AnimVariable_Position = "Position" Auto Const hidden
String Property CONST_AnimVariable_Speed = "Speed" Auto Const hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function
EndEvent

Function PerformOperation(Int myNewOperation)
  Self.SetState(myNewOperation)
  LC107CredTankShelvesCurrentGlobal.Mod(1.0)
EndFunction

Function SetState(Int myNewOperation)
  myOperation = myNewOperation
  If myOperation == CONST_Operation_Initialize
    player = Game.GetPlayer()
    shelfTrigger = Self.GetLinkedRef(LC107_LinkCredTankShelfTrigger)
    shelfEnableMarker = Self.GetLinkedRef(LC107_LinkCredTankEnableMarker)
    responsiveTanksEnableMarker = shelfEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker)
    onTanksEnableMarker = responsiveTanksEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker)
    offTanksEnableMarker = onTanksEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker)
    credTanks = Self.GetLinkedRefChain(ChildObjectKeyword, 100)
    credTankProximityRange = CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange
    Self.RegisterForRemoteEvent(shelfTrigger as ScriptObject, "OnTriggerEnter")
    shelfEnableMarker.EnableNoWait(False)
    Self.SetState(CONST_Operation_Waiting)
  ElseIf myOperation == CONST_Operation_Waiting
    offTanksEnableMarker.EnableNoWait(False)
    Utility.Wait(0.01)
    responsiveTanksEnableMarker.DisableNoWait(False)
    Self.GoToState("Waiting")
    shelfTrigger.Enable(False)
  ElseIf myOperation == CONST_Operation_Responsive
    responsiveTanksEnableMarker.EnableNoWait(False)
    Utility.Wait(0.01)
    offTanksEnableMarker.DisableNoWait(False)
    Self.GoToState("Active")
    playerLastSeenUpdatesAgo = 0
    Self.StartTimer(0.0, 0)
  ElseIf myOperation == CONST_Operation_Boot
    onTanksEnableMarker.Enable(False)
    responsiveTanksEnableMarker.Disable(False)
    offTanksEnableMarker.Disable(False)
    shelfTrigger.Disable(False)
    Self.GoToState("Inactive")
  ElseIf myOperation == CONST_Operation_Drain
    offTanksEnableMarker.Enable(False)
    onTanksEnableMarker.Disable(False)
  ElseIf myOperation == CONST_Operation_Shutdown
    shelfTrigger.DisableNoWait(False)
    shelfEnableMarker.DisableNoWait(False)
    responsiveTanksEnableMarker.DisableNoWait(False)
    onTanksEnableMarker.DisableNoWait(False)
    offTanksEnableMarker.DisableNoWait(False)
    Self.GoToState("Inactive")
    player = None
    shelfTrigger = None
    shelfEnableMarker = None
    responsiveTanksEnableMarker = None
    offTanksEnableMarker = None
    onTanksEnableMarker = None
    credTanks = None
  EndIf
EndFunction

Function UpdateOnTimer()
  Bool playerIsInTrigger = shelfTrigger.IsInTrigger(player as ObjectReference)
  If !playerEnteredVaultStageDone
    playerEnteredVaultStageDone = LC107.GetStageDone(CONST_PlayerEnteredVaultStage)
  EndIf
  If !playerEnteredVaultStageDone
    Self.StartTimer(CONST_CredTankShelfTimerDelay, 0)
  ElseIf !playerIsInTrigger && playerLastSeenUpdatesAgo > 1
    Self.GoToState("Busy")
    shelfTrigger.Disable(False)
    Utility.Wait(0.100000001)
    Self.SetState(CONST_Operation_Waiting)
  Else
    If !playerIsInTrigger
      playerLastSeenUpdatesAgo += 1
      Int I = 0
      While I < credTanks.Length && myOperation == CONST_Operation_Responsive
        credTanks[I].SetAnimationVariableFloat(CONST_AnimVariable_Position, 0.0)
        I += 1
      EndWhile
    Else
      playerLastSeenUpdatesAgo = 0
      Float[] tankDistances = new Float[credTanks.Length]
      Float tankMinDistance = 0.0
      Int i = 0
      While i < credTanks.Length
        tankDistances[i] = player.GetDistance(credTanks[i])
        i += CONST_CredTankProximityPrecision
      EndWhile
      If tankDistances[credTanks.Length - 1] == 0.0
        tankDistances[credTanks.Length - 1] = player.GetDistance(credTanks[credTanks.Length - 1])
      EndIf
      i = 0
      While i < credTanks.Length
        If tankDistances[i] == 0.0
          Int priorIndex = i - i % CONST_CredTankProximityPrecision
          Int priorIndexBelowCurrent = i - priorIndex
          Int nextIndex = Math.Min((tankDistances.Length - 1) as Float, (priorIndex + CONST_CredTankProximityPrecision) as Float) as Int
          Int nextIndexAboveCurrent = nextIndex - i
          Float indexRange = (priorIndexBelowCurrent + nextIndexAboveCurrent) as Float
          Float priorMultiple = 1.0 - (priorIndexBelowCurrent as Float / indexRange)
          Float nextMultiple = 1.0 - (nextIndexAboveCurrent as Float / indexRange)
          tankDistances[i] = tankDistances[priorIndex] * priorMultiple + tankDistances[nextIndex] * nextMultiple
        EndIf
        i += 1
      EndWhile
      i = 0
      While i < credTanks.Length && myOperation == CONST_Operation_Responsive
        Float tankPosition = 1.0 - Math.Min(Math.Max(Math.Max(tankDistances[i] - CONST_CredTankProximityMinRange, 0.0) / credTankProximityRange, 0.0), 1.0)
        credTanks[i].SetAnimationVariableFloat(CONST_AnimVariable_Position, tankPosition)
        i += 1
      EndWhile
    EndIf
    Self.StartTimer(CONST_CredTankShelfTimerDelay, 0)
  EndIf
EndFunction

Function DEBUG_SetVerbose(Bool shouldBeVerbose)
  verbose = shouldBeVerbose
EndFunction

;-- State -------------------------------------------
State Active

  Event OnTimer(Int timerID)
    Self.UpdateOnTimer()
  EndEvent
EndState

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State Inactive
EndState

;-- State -------------------------------------------
State Waiting

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
    Self.GoToState("Busy")
    Self.SetState(CONST_Operation_Responsive)
  EndEvent
EndState
