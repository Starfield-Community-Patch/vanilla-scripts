ScriptName DefaultCollectionSetGroupFaction Extends RefCollectionAlias default
{ sets a group faction on the aliased actors }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

Faction Property GroupFaction Auto Const mandatory
{ group faction to set on the aliased actors }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.SetGroupFactionOnAll()
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False
    Self.SetGroupFaction(akObject as Actor)
  EndIf
EndEvent

Function SetGroupFactionOnAll()
  Int I = 0
  Int count = Self.GetCount()
  While I < count
    Actor actorRef = Self.GetActorAt(I)
    Self.SetGroupFaction(actorRef)
    I += 1
  EndWhile
EndFunction

Function SetGroupFaction(Actor actorToUpdate)
  If actorToUpdate
    actorToUpdate.SetGroupFaction(GroupFaction)
  EndIf
EndFunction
