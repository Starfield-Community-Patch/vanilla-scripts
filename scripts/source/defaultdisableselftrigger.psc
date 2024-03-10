ScriptName DefaultDisableSelfTrigger Extends ObjectReference
{ Default script that simply activates itself once when player enters trigger, can optionally triggered by specific refs, aliases, or factions. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property PlayerOnly = True Auto Const
{ Only Player Triggers?  Default: TRUE
Must be FALSE if you put anything in the arrays. }
Int Property PlayerMinLevel Auto Const
{ Optional: If set, player must be >= PlayerMinLevel to activate this }
ObjectReference[] Property TriggeredByReferences Auto Const
{ OPTIONAL: Activation will occur if Triggered by any of these references.
If ALL arrays are empty then stage is set if Triggered by anybody. }
ReferenceAlias[] Property TriggeredByAliases Auto Const
{ OPTIONAL: Activation will occur if Triggered by any of these aliases.
If ALL arrays are empty then stage is set if Triggered by anybody. }
Faction[] Property TriggeredByFactions Auto Const
{ OPTIONAL: Activation will occur if Triggered by any of these factions.
If ALL arrays are empty then stage is set if Triggered by anybody. }

;-- State -------------------------------------------
State DoneWaiting

  Event onBeginState(String asOldState)
    Self.Disable(False)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event onTriggerEnter(ObjectReference triggerRef)
    If PlayerOnly
      If triggerRef == Game.GetPlayer() as ObjectReference
        If PlayerMinLevel == 0 || Game.GetPlayer().getLevel() >= PlayerMinLevel
          Self.GoToState("DoneWaiting")
          Self.activate(Self as ObjectReference, False)
        EndIf
      EndIf
    ElseIf TriggeredByReferences.Length > 0 || TriggeredByAliases.Length > 0 || TriggeredByFactions.Length > 0
      Self.GoToState("DoneWaiting")
      Self.activate(Self as ObjectReference, False)
    ElseIf commonarrayfunctions.CheckObjectReferenceAgainstArray(triggerRef, TriggeredByReferences, False) || commonarrayfunctions.CheckObjectReferenceAgainstReferenceAliasArray(triggerRef, TriggeredByAliases, False) || commonarrayfunctions.CheckActorAgainstFactionArray(triggerRef as Actor, TriggeredByFactions, False)
      If PlayerMinLevel == 0 || Game.GetPlayer().getLevel() >= PlayerMinLevel
        Self.GoToState("DoneWaiting")
        Self.activate(Self as ObjectReference, False)
      EndIf
    EndIf
  EndEvent
EndState
