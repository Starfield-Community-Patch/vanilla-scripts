ScriptName OLD_BE_QuestScript Extends Quest conditional
{ parent script for BE quests }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TargetShip Auto Const
{ this ship }
RefCollectionAlias Property CrewCollection Auto Const
{ OPTIONAL: collection of crew actors
    if included, will move crew collection to matching markers in CrewMarkers array, and assign them to matching aliases in CrewAliases }
ReferenceAlias[] Property CrewMarkers Auto Const
{ OPTIONAL: collection of markers for crew
    only used with CrewCollection; if provided, will move crew collection to matching markers in CrewMarkers array, and assign them to matching aliases in CrewAliases }
ReferenceAlias[] Property CrewAliases Auto Const
{ array of ref aliases for individual crew actors }
ActorValue Property SpaceshipCrew Auto Const
{ tracks number of crew on a ship }
Bool Property StopQuestOnUndock = True Auto Const
{ stop quest when player undocks - should be TRUE unless you are doing special handling to shut down the quest some other way }

;-- Functions ---------------------------------------

Event OnQuestInit()
  spaceshipreference shipRef = TargetShip.GetShipRef()
  Self.RegisterForRemoteEvent(shipRef as ScriptObject, "OnShipUndock")
  Int crewValue = shipRef.GetValue(SpaceshipCrew) as Int
  Int baseCrewValue = shipRef.GetBaseValue(SpaceshipCrew) as Int
  If CrewCollection
    Int i = 0
    While i < baseCrewValue && i < CrewCollection.GetCount()
      Actor theCrew = CrewCollection.GetAt(i) as Actor
      CrewAliases[i].ForceRefTo(theCrew as ObjectReference)
      If CrewMarkers as Bool && i < CrewMarkers.Length
        ObjectReference theMarker = CrewMarkers[i].GetRef()
        If theMarker
          theCrew.MoveTo(theMarker, 0.0, 0.0, 0.0, True, False)
        EndIf
      EndIf
      i += 1
    EndWhile
  EndIf
  Int I = 0
  While I < baseCrewValue && I < CrewAliases.Length
    Actor thecrew = CrewAliases[I].GetActorRef()
    thecrew.EnableNoWait(False)
    If I >= crewValue
      thecrew.KillSilent(None)
    EndIf
    Self.RegisterForRemoteEvent(thecrew as ScriptObject, "OnDying")
    I += 1
  EndWhile
EndEvent

Function StartCombatWithPlayer()
  Actor player = Game.GetPlayer()
  Int I = 0
  While I < CrewAliases.Length
    Actor theCrew = CrewAliases[I].GetActorRef()
    theCrew.StartCombat(player as ObjectReference, False)
    I += 1
  EndWhile
EndFunction

Event SpaceshipReference.OnShipUndock(spaceshipreference akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If StopQuestOnUndock
    Self.Stop()
  EndIf
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
  spaceshipreference shipRef = TargetShip.GetShipRef()
  shipRef.ModValue(SpaceshipCrew, -1.0)
EndEvent
