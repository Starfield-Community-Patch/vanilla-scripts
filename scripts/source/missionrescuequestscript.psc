ScriptName MissionRescueQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RescueMissionData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  ReferenceAlias Property Prisoner Auto Const mandatory
  { prisoner to rescue }
  Faction Property EnemyShipFaction Auto Const mandatory
  { faction to remove from target ship after rescue }
  Faction Property CaptiveFaction Auto Const mandatory
  { remove this from prisoner after rescue }
  RefCollectionAlias Property Enemies Auto Const mandatory
  { filled with enemies on the target ship (after BE quest starts) }
  ActorValue Property Suspicious Auto Const mandatory
  { clear on hostage so won't have }
  Faction Property ShipOwnerFaction Auto Const
  { optional - if set, ship interior will be set with this ownership }
  Keyword Property SpaceshipLinkedInterior Auto Const mandatory
  { to get ship interior cell }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted)
  If bAccepted
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted")
    spaceshipreference targetShip = PrimaryRef.GetShipRef()
    targetShip.Enable(False)
    targetShip.SetValue(Game.GetAggressionAV(), 1.0)
    Actor prisonerRef = Prisoner.GetActorRef()
    prisonerRef.IgnoreFriendlyHits(True)
    If ShipOwnerFaction
      Cell shipInterior = targetShip.GetLinkedCell(SpaceshipLinkedInterior)
      If shipInterior
        shipInterior.SetFactionOwner(ShipOwnerFaction)
        shipInterior.SetPublic(True)
      EndIf
    EndIf
  EndIf
EndFunction

Function MissionComplete()
  Self.HandleRescuePrisoner()
  Parent.MissionComplete()
EndFunction

Function HandleRescuePrisoner()
  Prisoner.TryToRemoveFromFaction(CaptiveFaction)
  PrimaryRef.TryToRemoveFromFaction(EnemyShipFaction)
  Actor prisonerRef = Prisoner.GetActorRef()
  prisonerRef.IgnoreFriendlyHits(False)
  prisonerRef.SetValue(Suspicious, 0.0)
EndFunction

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript akSource, Var[] akArgs)
  spaceshipreference boardedShip = akArgs[0] as spaceshipreference
  spaceshipreference targetShip = PrimaryRef.GetShipRef()
  If boardedShip == targetShip
    bescript boardingQuest = akArgs[1] as bescript
    If boardingQuest
      Enemies.AddRefCollection(boardingQuest.AllCrew)
    EndIf
  EndIf
EndEvent
