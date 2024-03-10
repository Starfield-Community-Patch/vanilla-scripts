ScriptName SQ_OutpostCargoLinkScript Extends Quest
{ script to handle outpost cargo links }

;-- Structs -----------------------------------------
Struct animData
  Int stateID
  String lightColorEvent
  String lightStateEvent
  String description
EndStruct


;-- Variables ---------------------------------------
Bool cargoLinkAchievementDone = False
Float cargoLinkCreationTimer = 1.0 Const
Int cargoLinkCreationTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard cargoLinkGuard
Guard linkedOutpostGuard

;-- Properties --------------------------------------
Group cargoLinkAchivementData
  RefCollectionAlias Property CargoLinks Auto Const mandatory
  { used to count linked outposts for cargo link achievement }
  Int Property CargoLinkAchievement = 24 Auto Const
  Int Property CargoLinkOutpostCountRequired = 5 Auto Const
  { min linked outposts to get achievement }
EndGroup

Group cargoshipLinks
  Keyword Property LinkOutpostCargoShipIncoming01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipIncoming02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipOutgoing01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipOutgoing02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipLandingMarker01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipLandingMarker02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipCargoLink01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipCargoLink02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipLandingMarkerCurrent Auto Const mandatory
EndGroup

Keyword Property LinkOutpostCargoLandingMarker Auto Const mandatory
{ get linked ref for landing marker }
Keyword Property LinkOutpostCargoOutgoing Auto Const mandatory
{ get linked ref for outgoing container }
Keyword Property LinkOutpostCargoIncoming Auto Const mandatory
{ get linked ref for incoming container }
Keyword Property LinkOutpostCargoLinkActive Auto Const mandatory
{ used to link cargo link refs to each other }
Keyword Property LinkOutpostCargoLinkShip Auto Const mandatory
{ used to link primary cargo link ref to the ship }
Keyword Property OutpostCargoLinkKeyword Auto Const mandatory
{ keyword used to find cargo links }
Keyword Property OutpostCargoLinkMission Auto Const mandatory
{ keyword to identify supply mission cargo links }
Keyword Property OutpostProductionHalted Auto Const mandatory
{ used to halt production }
ReferenceAlias Property LinkedOutpost Auto Const mandatory
{ used for text replacement in cargo link messages }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ to put inventory into when a cargo link is deleted }
Message Property OutpostCargoLinkFailureMessage Auto Const mandatory
{ message in case unable to create a link (this should only be possible to happen at a "mission" cargo link) }
spaceshipbase Property OutpostCargoLinkShip01 Auto Const mandatory
{ spaceship base for cargo ship }
ActorValue Property OutpostCargoLinkShipDestination Auto Const mandatory
{ use to condition packages }
sq_outpostcargolinkscript:animdata[] Property animationStates Auto Const
{ array of animations to play at different states }
Int Property stateEnum00_unlinked = 0 Auto Const hidden
Int Property stateEnum01_linked = 1 Auto Const hidden
Int Property stateEnum02_landing = 2 Auto Const hidden
Int Property stateEnum03_landed = 3 Auto Const hidden

;-- Functions ---------------------------------------

Event OnQuestInit()
  ; Empty function
EndEvent

Function ShipLanding(spaceshipreference cargoShipRef, Bool atOutpost01, Int animState)
  outpostcargolinkmarkerscript cargolinkMarker = None
  If atOutpost01
    cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink01) as outpostcargolinkmarkerscript
  Else
    cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink02) as outpostcargolinkmarkerscript
  EndIf
  Self.SetAnimationState(cargolinkMarker as ObjectReference, animState)
EndFunction

Bool Function TransferCargo(sq_outpostcargolinkshipscript cargoShipRef, Bool atOutpost01, Bool bUnloadCargo)
  Keyword outgoingKeyword = None
  Keyword incomingKeyword = None
  If atOutpost01
    outgoingKeyword = LinkOutpostCargoShipOutgoing01
    incomingKeyword = LinkOutpostCargoShipIncoming01
  Else
    outgoingKeyword = LinkOutpostCargoShipOutgoing02
    incomingKeyword = LinkOutpostCargoShipIncoming02
  EndIf
  Bool canProduce = True
  outpostcargolinkmarkerscript cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink01) as outpostcargolinkmarkerscript
  outpostcargolinkmarkerscript cargolinkMarker2 = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink02) as outpostcargolinkmarkerscript
  If bUnloadCargo
    ObjectReference incomingRef = cargoShipRef.GetLinkedRef(incomingKeyword)
    If cargolinkMarker as Bool && cargolinkMarker.SpecificCargo as Bool
      cargoShipRef.RemoveItemByComponent(cargolinkMarker.SpecificCargo, cargolinkMarker.SpecificCargoMax, False, incomingRef)
    ElseIf cargolinkMarker2 as Bool && cargolinkMarker2.SpecificCargo as Bool
      cargoShipRef.RemoveItemByComponent(cargolinkMarker2.SpecificCargo, cargolinkMarker2.SpecificCargoMax, False, incomingRef)
    Else
      cargoShipRef.RemoveAllItems(incomingRef, False, True)
    EndIf
    incomingRef.MoveContainerContentToUnfilledContainers()
    canProduce = Self.CargoLinkCanProduce(cargoShipRef, atOutpost01)
    Self.SendOutpostCargoLinkUnloadCargoEvent(incomingRef, cargoShipRef as spaceshipreference)
  Else
    ObjectReference outgoingRef = cargoShipRef.GetLinkedRef(outgoingKeyword)
    outgoingRef.MoveContainerContentToUnfilledContainers()
    Bool bDoneLoading = False
    Int totalLoaded = 0
    While bDoneLoading == False
      outgoingRef.MoveContainerContentToUnfilledContainers()
      Int itemCountBeforeLoading = outgoingRef.GetItemCount(None)
      If cargolinkMarker as Bool && cargolinkMarker.SpecificCargo as Bool
        totalLoaded += outgoingRef.RemoveItemByComponent(cargolinkMarker.SpecificCargo, cargolinkMarker.SpecificCargoMax, False, cargoShipRef as ObjectReference)
      ElseIf cargolinkMarker2 as Bool && cargolinkMarker2.SpecificCargo as Bool
        totalLoaded += outgoingRef.RemoveItemByComponent(cargolinkMarker2.SpecificCargo, cargolinkMarker2.SpecificCargoMax, False, cargoShipRef as ObjectReference)
      Else
        outgoingRef.RemoveAllItems(cargoShipRef as ObjectReference, False, True)
      EndIf
      bDoneLoading = itemCountBeforeLoading == outgoingRef.GetItemCount(None)
      If (bDoneLoading == False && cargolinkMarker as Bool) && cargolinkMarker.SpecificCargo as Bool
        bDoneLoading = totalLoaded >= cargolinkMarker.SpecificCargoMax
      EndIf
    EndWhile
    Self.SendOutpostCargoLinkLoadCargoEvent(outgoingRef, cargoShipRef as spaceshipreference)
  EndIf
  Return canProduce
EndFunction

Bool Function CreateCargoLink(ObjectReference cargoLink01Ref, ObjectReference cargoLink02Ref)
  Bool success = False
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    ObjectReference cargoLink01LandingMarker = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLandingMarker)
    ObjectReference cargoLink02LandingMarker = cargoLink02Ref.GetLinkedRef(LinkOutpostCargoLandingMarker)
    ObjectReference cargoLink01Outgoing = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoOutgoing)
    ObjectReference cargoLink02Outgoing = cargoLink02Ref.GetLinkedRef(LinkOutpostCargoOutgoing)
    ObjectReference cargoLink01Incoming = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoIncoming)
    ObjectReference cargoLink02Incoming = cargoLink02Ref.GetLinkedRef(LinkOutpostCargoIncoming)
    spaceshipbase cargoLinkShipBase = OutpostCargoLinkShip01
    outpostcargolinkmarkerscript cargolinkMarker = cargoLink01Ref as outpostcargolinkmarkerscript
    Bool CreateShipAtCargoLink01 = True
    If cargolinkMarker
      CreateShipAtCargoLink01 = cargolinkMarker.CreateShipAtCargoLink01
    EndIf
    If cargolinkMarker as Bool && cargolinkMarker.OutpostCargoLinkShip as Bool
      cargoLinkShipBase = cargolinkMarker.OutpostCargoLinkShip
    EndIf
    spaceshipreference cargoShipRef = None
    Int failsafeCount = 0
    While cargoShipRef == None && failsafeCount < 30
      If CreateShipAtCargoLink01
        cargoShipRef = cargoLink01LandingMarker.PlaceShipAtMe(cargoLinkShipBase as Form, 4, True, False, False, True, None, None, None, True)
      Else
        cargoShipRef = cargoLink02LandingMarker.PlaceShipAtMe(cargoLinkShipBase as Form, 4, True, False, False, True, None, None, None, True)
      EndIf
      If cargoShipRef == None
        failsafeCount += 1
        Utility.wait(1.0)
      EndIf
    EndWhile
    If cargoShipRef
      success = True
      If cargolinkMarker
        (cargoShipRef as sq_outpostcargolinkshipscript).RequiresFuel = cargolinkMarker.RequiresFuel
      EndIf
      cargoLink01Ref.SetLinkedRef(cargoShipRef as ObjectReference, LinkOutpostCargoLinkShip, True)
      cargoLink02Ref.SetLinkedRef(cargoShipRef as ObjectReference, LinkOutpostCargoLinkShip, True)
      cargoShipRef.SetLinkedRef(cargoLink01LandingMarker, LinkOutpostCargoShipLandingMarker01, True)
      cargoShipRef.SetLinkedRef(cargoLink02LandingMarker, LinkOutpostCargoShipLandingMarker02, True)
      If CreateShipAtCargoLink01
        cargoShipRef.SetLinkedRef(cargoLink01LandingMarker, LinkOutpostCargoShipLandingMarkerCurrent, True)
        Self.SetAnimationState(cargoLink01Ref, stateEnum02_landing)
        Self.SetAnimationState(cargoLink02Ref, stateEnum01_linked)
      Else
        cargoShipRef.SetLinkedRef(cargoLink02LandingMarker, LinkOutpostCargoShipLandingMarkerCurrent, True)
        cargoShipRef.SetValue(OutpostCargoLinkShipDestination, 1.0)
        Self.SetAnimationState(cargoLink02Ref, stateEnum02_landing)
        Self.SetAnimationState(cargoLink01Ref, stateEnum01_linked)
      EndIf
      cargoShipRef.SetLinkedRef(cargoLink01Outgoing, LinkOutpostCargoShipOutgoing01, True)
      cargoShipRef.SetLinkedRef(cargoLink02Outgoing, LinkOutpostCargoShipOutgoing02, True)
      cargoShipRef.SetLinkedRef(cargoLink01Incoming, LinkOutpostCargoShipIncoming01, True)
      cargoShipRef.SetLinkedRef(cargoLink02Incoming, LinkOutpostCargoShipIncoming02, True)
      cargoShipRef.SetLinkedRef(cargoLink01Ref, LinkOutpostCargoShipCargoLink01, True)
      cargoShipRef.SetLinkedRef(cargoLink02Ref, LinkOutpostCargoShipCargoLink02, True)
      LinkedOutpost.ForceRefTo(cargoLink02Ref.GetWorkshop())
      cargoLink01Ref.RemoveKeyword(OutpostProductionHalted)
      cargoLink02Ref.RemoveKeyword(OutpostProductionHalted)
    EndIf
    If success == False
      OutpostCargoLinkFailureMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      (cargoLink01Ref as outpostcargolinkmarkerscript).isLinked = True
      (cargoLink02Ref as outpostcargolinkmarkerscript).isLinked = True
      If cargoLinkAchievementDone == False
        Self.StartTimer(cargoLinkCreationTimer, cargoLinkCreationTimerID)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
  Return success
EndFunction

Function ClearCargoLink(ObjectReference cargoLink01Ref, ObjectReference cargoLink02Ref)
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    sq_outpostcargolinkshipscript cargoShipRef = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkShip) as sq_outpostcargolinkshipscript
    If cargoShipRef
      ObjectReference playerShip = SQ_PlayerShip.HomeShip.GetRef()
      If playerShip
        cargoShipRef.RemoveAllItems(playerShip, False, True)
      EndIf
      cargoShipRef.RemoveAllItems(Game.GetPlayer() as ObjectReference, False, False)
    EndIf
    If cargoLink02Ref == None
      cargoLink02Ref = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkActive)
    EndIf
    Self.ClearCargoLinkRef(cargoLink01Ref as outpostcargolinkmarkerscript)
    Self.ClearCargoLinkRef(cargoLink02Ref as outpostcargolinkmarkerscript)
    If cargoShipRef
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipLandingMarker01, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipLandingMarker02, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipLandingMarkerCurrent, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipOutgoing01, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipOutgoing02, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipIncoming01, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipIncoming02, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipCargoLink01, True)
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipCargoLink02, True)
      If cargoShipRef.IsLanded() == False
        cargoShipRef.DisableNoWait(False)
      Else
        cargoShipRef.DisableWithTakeOffOrLandingNoWait()
      EndIf
      cargoShipRef.CancelTimers()
      cargoShipRef = None
    EndIf
    Self.SetAnimationState(cargoLink01Ref, stateEnum00_unlinked)
    Self.SetAnimationState(cargoLink02Ref, stateEnum00_unlinked)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function ClearCargoLinkRef(outpostcargolinkmarkerscript cargoLinkRef)
  If cargoLinkRef
    If cargoLinkRef.RequiresFuel
      cargoLinkRef.AddKeyword(OutpostProductionHalted)
    EndIf
    cargoLinkRef.SetLinkedRef(None, LinkOutpostCargoLinkShip, True)
    cargoLinkRef.SetLinkedRef(None, LinkOutpostCargoLinkActive, True)
    cargoLinkRef.isLinked = False
  EndIf
EndFunction

Function SendOutpostCargoLinkUnloadCargoEvent(ObjectReference incomingCargoRef, spaceshipreference cargoShipRef)
  Var[] kargs = new Var[2]
  kargs[0] = incomingCargoRef as Var
  kargs[1] = cargoShipRef as Var
  Self.SendCustomEvent("sq_outpostcargolinkscript_SQ_OutpostCargoLinkUnloadCargo", kargs)
EndFunction

Function SendOutpostCargoLinkLoadCargoEvent(ObjectReference outgoingCargoRef, spaceshipreference cargoShipRef)
  Var[] kargs = new Var[2]
  kargs[0] = outgoingCargoRef as Var
  kargs[1] = cargoShipRef as Var
  Self.SendCustomEvent("sq_outpostcargolinkscript_SQ_OutpostCargoLinkLoadCargo", kargs)
EndFunction

Bool Function CargoLinkCanProduce(sq_outpostcargolinkshipscript cargoShipRef, Bool atOutpost01)
  Bool canProduce = cargoShipRef.RequiresFuel == False
  If canProduce == False
    ObjectReference[] shipCargoLinks = cargoShipRef.GetRefsLinkedToMe(LinkOutpostCargoLinkShip, None)
    Int I = 0
    While I < shipCargoLinks.Length && canProduce == False
      ObjectReference cargoLinkRef = shipCargoLinks[I]
      canProduce = cargoLinkRef.HasKeyword(OutpostCargoLinkMission) == False && cargoLinkRef.CanProduceForWorkshop()
      I += 1
    EndWhile
  EndIf
  Return canProduce
EndFunction

Function SetAnimationState(ObjectReference cargoLinkRef, Int stateEnum)
  If cargoLinkRef
    outpostcargolinkmarkerscript cargoLinkMarkerRef = cargoLinkRef as outpostcargolinkmarkerscript
    If cargoLinkMarkerRef
      sq_outpostcargolinkscript:animdata theData = Self.GetAnimationData(stateEnum)
      If theData
        cargoLinkMarkerRef.SetAnimationState(theData.stateID, theData)
      EndIf
    EndIf
  EndIf
EndFunction

sq_outpostcargolinkscript:animdata Function GetAnimationData(Int stateEnum)
  sq_outpostcargolinkscript:animdata theData = None
  Int stateIndex = animationStates.findstruct("stateID", stateEnum, 0)
  If stateIndex > -1
    theData = animationStates[stateIndex]
  EndIf
  Return theData
EndFunction

Function SendOutpostCargoLinkChangedEvent(ObjectReference outpostRef, ObjectReference cargoLinkRef, ObjectReference akOldTarget, ObjectReference akNewTarget)
  If outpostRef as Bool && cargoLinkRef as Bool
    Var[] kargs = new Var[4]
    kargs[0] = outpostRef as Var
    kargs[1] = cargoLinkRef as Var
    kargs[2] = akOldTarget as Var
    kargs[3] = akNewTarget as Var
    Self.SendCustomEvent("sq_outpostcargolinkscript_SQ_OutpostCargoLinkChanged", kargs)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == cargoLinkCreationTimerID
    Self.CountLinkedOutposts()
  EndIf
EndEvent

Function CountLinkedOutposts()
  Guard linkedOutpostGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    CargoLinks.RefillAlias()
    Int cargoLinkCount = CargoLinks.GetCount()
    If cargoLinkCount > 0
      ObjectReference[] linkedOutposts = new ObjectReference[0]
      Int I = 0
      While I < cargoLinkCount
        outpostcargolinkmarkerscript cargoLinkRef = CargoLinks.GetAt(I) as outpostcargolinkmarkerscript
        If cargoLinkRef
          ObjectReference myOutpostRef = cargoLinkRef.GetWorkshop()
          If myOutpostRef as Bool && cargoLinkRef.isLinked
            Int foundOutpost = linkedOutposts.find(myOutpostRef, 0)
            If foundOutpost < 0
              linkedOutposts.add(myOutpostRef, 1)
            EndIf
          EndIf
        EndIf
        I += 1
      EndWhile
      If linkedOutposts.Length >= CargoLinkOutpostCountRequired
        Game.AddAchievement(CargoLinkAchievement)
        cargoLinkAchievementDone = True
      EndIf
    EndIf
    CargoLinks.RemoveAll()
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function debugRefillCargoLinks()
  CargoLinks.RefillAlias()
EndFunction
