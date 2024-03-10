ScriptName BEObjectiveBlockPilotSeatScript Extends ReferenceAlias
{ For BEObjective, a variant of BEBlockPilotSeatScript to handle the alias being force-filled by a different quest. }

;-- Variables ---------------------------------------
Bool blockedUntilAllCrewDead
Bool blockedUntilGravityRestored
bescript owningBEQuest

;-- Properties --------------------------------------
RefCollectionAlias Property AllCrew Auto Const mandatory
{ BEObjective's AllCrew RefCollectionAlias. }
Message Property BE_Objective_SecureShipMessage Auto Const mandatory
{ Message to display when the player tries to sit in the ship's pilot seat while the block is in place. }

;-- Functions ---------------------------------------

Function BlockTakeover(bescript ownerQuest)
  owningBEQuest = ownerQuest
  (Self.GetRef() as pilotseatfurniturescript).SuppressDefaultActivationBlockedMessage(True)
  If AllCrew.GetCount() > 0
    blockedUntilAllCrewDead = True
    Self.GetRef().BlockActivation(True, False)
    Self.RegisterForCustomEvent(owningBEQuest as ScriptObject, "bescript_BEAllCrewDead")
  EndIf
  If owningBEQuest.ShipGravity < 1.0
    blockedUntilGravityRestored = True
    Self.GetRef().BlockActivation(True, False)
  EndIf
EndFunction

Event BEScript.BEAllCrewDead(bescript source, Var[] akArgs)
  blockedUntilAllCrewDead = False
EndEvent

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.GotoState("Busy")
    If blockedUntilAllCrewDead
      BE_Objective_SecureShipMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf blockedUntilGravityRestored
      blockedUntilGravityRestored = False
      owningBEQuest.SetShipGravity(1.0)
    EndIf
    If blockedUntilAllCrewDead || blockedUntilGravityRestored
      Self.GotoState("Waiting")
    Else
      Self.GotoState("Done")
      ObjectReference myRef = Self.GetRef()
      myRef.BlockActivation(False, False)
      Self.UnregisterForCustomEvent(owningBEQuest as ScriptObject, "bescript_BEAllCrewDead")
      myRef.Activate(akActivator, False)
    EndIf
  EndEvent
EndState
