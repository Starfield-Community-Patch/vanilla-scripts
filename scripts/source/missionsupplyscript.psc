ScriptName MissionSupplyScript Extends MissionQuestScript conditional
{ mission to supply resource to a settlement }

;-- Variables ---------------------------------------
ObjectReference incomingCargoRef
outpostcargolinkmarkerscript myCargoLink
missionboardsupplymarkerscript supplyMarker

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard cargoLinkGuard
Guard outpostaliasguard

;-- Properties --------------------------------------
Group MissionTypeData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
  RefCollectionAlias Property SourceCollection01 Auto Const
  { Optional - only needed if there are multiple ref types }
  RefCollectionAlias Property SourceCollection02 Auto Const
  { Optional - only needed if there are multiple ref types }
  Keyword Property LinkOutpostCargoLink Auto Const mandatory
  { keyword to find linked ref of my cargo link }
  ReferenceAlias Property SourceCargoLinkActivator Auto Const mandatory
  { activator player uses to establish cargo link }
  ReferenceAlias Property PlayerCargoLink Auto Const mandatory
  { player's linked cargo link }
  ReferenceAlias Property Builder Auto Const mandatory
  { created "builder" to simulate supply need }
  Int Property EstablishCargoLinkObjective = 10 Auto Const
  { objective for establishing a cargo link }
  Int Property SupplyResourceObjective = 20 Auto Const
  { objective for supplying resource }
  ActorValue Property MissionAmountMax Auto Const mandatory
  { holds max amount of shipment on supply marker }
  ActorValue Property MissionSupplyAmountMult Auto Const mandatory
  { holds max amount of shipment on supply marker }
  ActorValue Property MissionRewardBase Auto Const mandatory
  { holds base reward value (per unit) for shipment on supply marker }
  Int Property MissionAcceptTutorialID = 4 Auto Const
  { tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }
  LocationAlias Property PlayerOutpostLocation Auto Const mandatory
  { filled when player enters an outpost location }
  ReferenceAlias Property PlayerOutpostBeacon Auto Const mandatory
  { filled when player enters an outpost location }
  RefCollectionAlias Property PlayerCargoLinks Auto Const mandatory
  { used to provide QT to nearby player cargo links if they exist }
  Keyword Property LocTypeOutpost Auto Const mandatory
  { keyword to find outpost locations }
  Keyword Property OutpostTutorialCargoLink Auto Const mandatory
  { keyword to find when a cargo link is placed }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  myCargoLink = SourceCargoLinkActivator.GetRef().GetLinkedRef(LinkOutpostCargoLink) as outpostcargolinkmarkerscript
  incomingCargoRef = myCargoLink.GetLinkedRef(SQ_OutpostCargoLink.LinkOutpostCargoIncoming)
  If SourceCollection01 as Bool && SourceCollection02 as Bool
    ObjectReference[] validRefs = new ObjectReference[0]
    Int I = 0
    While I < SourceCollection01.GetCount()
      ObjectReference testRef = SourceCollection01.GetAt(I)
      If SourceCollection02.Find(testRef) > -1
        validRefs.add(testRef, 1)
      EndIf
      I += 1
    EndWhile
    If validRefs.Length > 0
      Int randomIndex = Utility.RandomInt(0, validRefs.Length - 1)
      PrimaryRef.ForceRefTo(validRefs[randomIndex])
    EndIf
  EndIf
  supplyMarker = PrimaryRef.GetRef() as missionboardsupplymarkerscript
  If supplyMarker
    Parent.OnQuestStarted()
  Else
    Self.Stop()
  EndIf
EndEvent

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID)
    Self.RegisterForCustomEvent(SQ_OutpostCargoLink as ScriptObject, "sq_outpostcargolinkscript_SQ_OutpostCargoLinkUnloadCargo")
    Self.RegisterForCustomEvent(SQ_OutpostCargoLink as ScriptObject, "sq_outpostcargolinkscript_SQ_OutpostCargoLinkChanged")
    Self.RegisterForRemoteEvent(PlayerOutpostBeacon as ScriptObject, "OnWorkshopObjectRemoved")
    Self.RegisterForRemoteEvent(PlayerOutpostBeacon as ScriptObject, "OnWorkshopObjectPlaced")
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnOutpostPlaced")
    missioncargolinkactivatorscript activatorRef = SourceCargoLinkActivator.GetRef() as missioncargolinkactivatorscript
    activatorRef.AllowActivation(True)
    Builder.TryToEnable()
    myCargoLink.EnableNoWait(False)
  EndIf
  Parent.MissionAccepted(bAccepted)
EndFunction

Function HandleOnQuestRejected()
  Self.UpdateSupplyAmount(MissionIntValue02.GetValueInt())
  If MissionIntValue02.GetValueInt() > 0
    Self.MissionComplete()
  Else
    Self.MissionFailed()
  EndIf
EndFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc as Bool && akNewLoc.HasKeyword(LocTypeOutpost)
    PlayerOutpostLocation.ForceLocationTo(akNewLoc)
    PlayerOutpostLocation.RefillDependentAliases()
    Self.UpdatePlayerOutpostAliases(None)
  EndIf
EndFunction

Function MissionComplete()
  Self.CleanupMission()
  Parent.MissionComplete()
EndFunction

Function MissionFailed()
  Self.CleanupMission()
  Parent.MissionFailed()
EndFunction

Function CleanupMission()
  Self.UnregisterForCustomEvent(SQ_OutpostCargoLink as ScriptObject, "sq_outpostcargolinkscript_SQ_OutpostCargoLinkUnloadCargo")
  missioncargolinkactivatorscript activatorRef = SourceCargoLinkActivator.GetRef() as missioncargolinkactivatorscript
  activatorRef.AllowActivation(False)
  ObjectReference theBuilder = Builder.GetRef()
  incomingCargoRef.RemoveTransferLink(theBuilder)
  theBuilder.Disable(False)
  SQ_OutpostCargoLink.ClearCargoLink(myCargoLink as ObjectReference, None)
  myCargoLink.DisableNoWait(False)
EndFunction

Int Function GetActualReward()
  Return Self.UpdateSupplyAmount(-1)
EndFunction

Int Function UpdateSupplyAmount(Int overrideAmount)
  Location sourceLocation = TargetLocation.GetLocation()
  missionparentscript:missionsupplytype[] resourceAVs = MissionParent.resourceAVs
  Int I = 0
  resource myResource = None
  ActorValue myActorValue = None
  While I < resourceAVs.Length && myResource == None
    missionparentscript:missionsupplytype theSupplyType = resourceAVs[I]
    Int minSupplyAmount = supplyMarker.GetValue(theSupplyType.supplyAV) as Int
    If minSupplyAmount > 0
      myActorValue = theSupplyType.supplyAV
      myResource = myActorValue.GetResource()
      supplyMarker.myResource = myResource
      Int supplyAmount = Utility.RandomInt(minSupplyAmount, supplyMarker.GetValueInt(MissionAmountMax))
      If supplyAmount > 1000
        Int supplyAmountModulo = supplyAmount % 100
        If supplyAmountModulo > 50
          supplyAmount += 100 - supplyAmountModulo
        Else
          supplyAmount -= supplyAmountModulo
        EndIf
      Else
        Int supplyamountmodulo = supplyAmount % 10
        If supplyamountmodulo > 5
          supplyAmount += 10 - supplyamountmodulo
        Else
          supplyAmount -= supplyamountmodulo
        EndIf
      EndIf
      If overrideAmount < 0
        Float supplyAmountMult = sourceLocation.GetValue(MissionSupplyAmountMult)
        If supplyAmountMult > 0.0
          supplyAmount = (supplyAmount as Float * supplyAmountMult) as Int
        EndIf
      Else
        supplyAmount = overrideAmount
      EndIf
      MissionIntValue01.SetValueInt(supplyAmount)
      Self.UpdateCurrentInstanceGlobal(MissionIntValue01)
      ObjectReference theBuilder = Builder.GetRef()
      ActorValue supplyNeedAV = MissionParent.supplyNeedAVs[I]
      theBuilder.SetValue(supplyNeedAV, supplyAmount as Float)
      myCargoLink.SpecificCargoMax = supplyAmount
      myCargoLink.SpecificCargo = supplyMarker.myResource as Form
      Bool bSuccess = incomingCargoRef.AddTransferLink(theBuilder)
    EndIf
    I += 1
  EndWhile
  Float reward = MissionIntValue01.GetValue() * supplyMarker.GetValue(MissionRewardBase)
  Float locationMult = sourceLocation.GetValue(myActorValue)
  If locationMult > 0.0
    reward *= locationMult
  EndIf
  Return reward as Int
EndFunction

Function CargoLinkEstablished(ObjectReference newCargoLink)
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.SetObjectiveCompleted(EstablishCargoLinkObjective, True)
    Self.SetObjectiveDisplayed(SupplyResourceObjective, True, False)
    PlayerCargoLink.ForceRefTo(newCargoLink)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function CargoLinkCleared()
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.SetObjectiveCompleted(EstablishCargoLinkObjective, False)
    PlayerCargoLink.Clear()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event SQ_OutpostCargoLinkScript.SQ_OutpostCargoLinkUnloadCargo(sq_outpostcargolinkscript akSender, Var[] akArgs)
  ObjectReference eventCargoRef = akArgs[0] as ObjectReference
  spaceshipreference cargoShipRef = akArgs[1] as spaceshipreference
  If incomingCargoRef == eventCargoRef
    Int neededAmount = MissionIntValue01.GetValueInt()
    Int newResources = incomingCargoRef.RemoveResources(supplyMarker.myResource, neededAmount, True)
    incomingCargoRef.RemoveAllItems(None, False, False)
    If newResources > 0
      Self.ModObjectiveGlobal(newResources as Float, MissionIntValue02, SupplyResourceObjective, neededAmount as Float, True, True, True, False)
    EndIf
    Int currentAmount = MissionIntValue02.GetValueInt()
    If currentAmount >= neededAmount
      Self.MissionComplete()
    Else
      myCargoLink.SpecificCargoMax = neededAmount - currentAmount
    EndIf
  EndIf
EndEvent

Event SQ_OutpostCargoLinkScript.SQ_OutpostCargoLinkChanged(sq_outpostcargolinkscript akSender, Var[] akArgs)
  ObjectReference outpostRef = akArgs[0] as ObjectReference
  ObjectReference cargoLinkRef = akArgs[1] as ObjectReference
  ObjectReference akOldTarget = akArgs[2] as ObjectReference
  ObjectReference akNewTarget = akArgs[3] as ObjectReference
  If (akOldTarget == myCargoLink as ObjectReference) && (akNewTarget != myCargoLink as ObjectReference)
    Self.CargoLinkCleared()
  ElseIf (akNewTarget == myCargoLink as ObjectReference) && akNewTarget != akOldTarget
    Self.CargoLinkEstablished(cargoLinkRef)
  EndIf
EndEvent

Function UpdatePlayerOutpostAliases(ObjectReference akSourceRef)
  Guard outpostaliasguard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Location outpostLocation = None
    If akSourceRef
      outpostLocation = akSourceRef.GetCurrentLocation()
      PlayerOutpostLocation.ForceLocationTo(outpostLocation)
      PlayerOutpostLocation.RefillDependentAliases()
    Else
      outpostLocation = PlayerOutpostLocation.GetLocation()
    EndIf
    Bool sameSystem = MissionSourceLocation.IsSameLocation(outpostLocation, MissionParent.LocTypeStarSystem)
    If sameSystem == False
      Keyword OutpostCargoLinkFueledKeyword = MissionParent.OutpostCargoLinkFueledKeyword
      Int I = PlayerCargoLinks.GetCount() - 1
      While I >= 0
        outpostcargolinkmenuscript cargoLinkActivatorRef = PlayerCargoLinks.GetAt(I) as outpostcargolinkmenuscript
        If cargoLinkActivatorRef
          ObjectReference cargoLinkRef = cargoLinkActivatorRef.GetLinkedRef(cargoLinkActivatorRef.LinkOutpostCargoLink)
          If cargoLinkRef as Bool && cargoLinkRef.HasKeyword(OutpostCargoLinkFueledKeyword) == False
            PlayerCargoLinks.RemoveRef(cargoLinkActivatorRef as ObjectReference)
          EndIf
        EndIf
        I -= 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.HasKeyword(OutpostTutorialCargoLink)
    Self.UpdatePlayerOutpostAliases(akReference)
  EndIf
EndEvent

Event ReferenceAlias.OnWorkshopObjectRemoved(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.HasKeyword(OutpostTutorialCargoLink)
    Self.UpdatePlayerOutpostAliases(akReference)
  EndIf
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
  Self.UpdatePlayerOutpostAliases(akOutpostBeacon)
EndEvent
