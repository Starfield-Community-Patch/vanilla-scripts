ScriptName DefaultAliasSetGroupFaction Extends ReferenceAlias default
{ sets a group faction on the aliased actor }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

Faction Property GroupFaction Auto Const mandatory
{ group faction to set on the aliased actor }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.SetGroupFaction()
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False
    Self.SetGroupFaction()
  EndIf
EndEvent

Function SetGroupFaction()
  Actor actorRef = Self.GetActorReference()
  If actorRef
    actorRef.SetGroupFaction(GroupFaction)
  EndIf
EndFunction
