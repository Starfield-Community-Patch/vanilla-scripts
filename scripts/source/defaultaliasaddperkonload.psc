ScriptName DefaultAliasAddPerkOnLoad Extends ReferenceAlias default
{ Adds the specified perk to the actor on load. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToAdd Auto Const
{ The perk that should be added to the actor upon load. }
Bool Property doOnce = True Auto Const
{ Whether the Perk should only be added on first load. Default=TRUE }

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Ready

  Event OnLoad()
    Actor myActor = Self.GetActorRef()
    If myActor != None
      myActor.AddPerk(PerkToAdd, False)
    EndIf
    If doOnce
      Self.GoToState("Done")
    EndIf
  EndEvent
EndState
