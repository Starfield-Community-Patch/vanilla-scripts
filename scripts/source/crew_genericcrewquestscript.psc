ScriptName Crew_GenericCrewQuestScript Extends Crew_RecruitQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { The keyword to use to find the linked spawn marker that spawned this Generic Crew. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Alias_CrewMember as ScriptObject, "OnAliasChanged")
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  CrewMemberRef = Alias_CrewMember.GetActorReference()
  If Game.GetPlayer().HasPerk(Trait_Taskmaster)
    Self.SetCostMultAndUpdateCost(CostMult_Taskmaster)
  Else
    Self.UpdateCost()
  EndIf
EndEvent

Function Recruited()
  If CrewMemberRef
    crewspawnerscript crewSpawner = CrewMemberRef.GetLinkedRef(LinkGenericCrewSpawnMarker) as crewspawnerscript
    If crewSpawner
      crewSpawner.RemoveFromSpawnedCrewArray(CrewMemberRef)
    EndIf
  EndIf
  Parent.Recruited()
EndFunction
