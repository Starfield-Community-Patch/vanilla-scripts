ScriptName RQ_TransportPersonScript Extends RQScript
{ for RQs with passengers }

;-- Variables ---------------------------------------
Int damageSound
Int onBoardCount = 0

;-- Properties --------------------------------------
Group TransportPerson
  ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
  ReferenceAlias Property Alias_QuestGiverShip Auto Const
  { optional - if this includes a questgiver ship }
  Bool Property DamageShips = True Auto Const
  { if true, put any landed ships in damaged state }
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  { engine system health - use to put ships in damaged state }
  LocationAlias Property Alias_PassengerDestination Auto Const mandatory
  { autofill }
  ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const mandatory
  { autofill }
  Int Property InitializeNPCsStage = -1 Auto Const
  { stage to set when NPCs are initialized }
  Int Property AgreeToTransportStage = 100 Auto Const
  { this stage being set means player has agreed to transport passengers }
  Int Property AgreeToTransportObjective = 100 Auto Const
  { objective related to transporting passengers }
  Int Property TransportDoneStage = 390 Auto Const
  { if this stage is set, means passengers have been delivered to destination }
  Keyword Property LocTypeStarSystem Auto Const mandatory
  { autofill }
  wwiseevent Property DamagedEngineSound Auto Const
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  Self.RegisterForRemoteEvent(Alias_PlayerShip as ScriptObject, "OnLocationChange")
  If Alias_QuestGiverShip
    Self.RegisterForRemoteEvent(Alias_QuestGiverShip as ScriptObject, "OnAliasChanged")
    Self.RegisterForRemoteEvent(Alias_QuestGiverShip as ScriptObject, "OnLoad")
    Self.RegisterForRemoteEvent(Alias_QuestGiverShip as ScriptObject, "OnUnload")
  EndIf
EndFunction

Function AgreeToTransportPassenger()
  oescript myOEScript = (Self as Quest) as oescript
  If myOEScript
    myOEScript.StopQuestWhenPlayerLeavesPlanet = False
  EndIf
  Int I = 0
  While I < DialogueAliases.Length
    RefCollectionAlias refCollection = DialogueAliases[I] as RefCollectionAlias
    If refCollection
      Self.RegisterForRemoteEvent(refCollection as ScriptObject, "OnEnterShipInterior")
      Self.RegisterForRemoteEvent(refCollection as ScriptObject, "OnExitShipInterior")
    Else
      Self.RegisterForRemoteEvent((DialogueAliases[I] as ReferenceAlias) as ScriptObject, "OnEnterShipInterior")
      Self.RegisterForRemoteEvent((DialogueAliases[I] as ReferenceAlias) as ScriptObject, "OnExitShipInterior")
    EndIf
    I += 1
  EndWhile
  Self.SetDialogueAV_Hello_Calm_PostAccept()
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == AgreeToTransportStage
    Self.AgreeToTransportPassenger()
  EndIf
EndEvent

Function InitializeNPCs()
  Parent.InitializeNPCs()
  If InitializeNPCsStage > -1
    Self.SetStage(InitializeNPCsStage)
  EndIf
  Self.DamageShip(Alias_QuestGiverShip)
EndFunction

Event ReferenceAlias.OnEnterShipInterior(ReferenceAlias akSender, ObjectReference akShip)
  Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterShipInterior")
  akSender.GetRef().SetValue(RQ_AV_Hello, RQ_Hello_AboardShipValue.GetValueInt() as Float)
EndEvent

Event RefCollectionAlias.OnEnterShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  onBoardCount += 1
  akSenderRef.SetValue(RQ_AV_Hello, RQ_Hello_AboardShipValue.GetValueInt() as Float)
  If onBoardCount >= akSender.GetCount()
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterShipInterior")
  EndIf
EndEvent

Event ReferenceAlias.OnExitShipInterior(ReferenceAlias akSender, ObjectReference akShip)
  Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnExitShipInterior")
  akSender.GetRef().SetValue(RQ_AV_Hello, RQ_Hello_Calm_SuccessValue.GetValueInt() as Float)
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  onBoardCount -= 1
  akSenderRef.SetValue(RQ_AV_Hello, RQ_Hello_Calm_SuccessValue.GetValueInt() as Float)
  If onBoardCount <= 0
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnExitShipInterior")
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Alias_PlayerShip
    If Self.GetStageDone(AgreeToTransportStage) && Self.GetStageDone(TransportDoneStage) == False
      Self.UpdatePassengerDestinationAliases(akNewLoc)
    EndIf
    Self.CheckForShutdown(akNewLoc)
  EndIf
EndEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
  If akSender == Alias_QuestGiverShip
    Self.DamageShip(Alias_QuestGiverShip)
  EndIf
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
  If akSender == Alias_QuestGiverShip
    If DamagedEngineSound as Bool && damageSound > 0
      wwiseevent.StopInstance(damageSound)
    EndIf
  EndIf
EndEvent

Function OnAliasChangedSpecific(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Alias_QuestGiverShip
    Self.DamageShip(Alias_QuestGiverShip)
  EndIf
EndFunction

Function DamageShip(ReferenceAlias akShipToDamage)
  If DamageShips && akShipToDamage as Bool
    spaceshipreference shipRef = akShipToDamage.GetShipRef()
    If shipRef
      If shipRef.Is3DLoaded()
        Float currentEngineHealth = shipRef.GetValue(ShipSystemEngineHealth)
        If currentEngineHealth <= 0.0
          shipRef.RestoreValue(ShipSystemEngineHealth, 99.0)
          currentEngineHealth = shipRef.GetValue(ShipSystemEngineHealth)
        EndIf
        shipRef.DamageValue(ShipSystemEngineHealth, currentEngineHealth)
        If DamagedEngineSound
          damageSound = DamagedEngineSound.Play(shipRef as ObjectReference, None, None)
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction

Function UpdatePassengerDestinationAliases(Location newLocation)
  Location currentDestination = Alias_PassengerDestination.GetLocation()
  If currentDestination.IsSameLocation(newLocation, LocTypeStarSystem) == False
    Alias_PassengerDestination.RefillAlias()
    Alias_PassengerDestination.RefillDependentAliases()
  EndIf
EndFunction
