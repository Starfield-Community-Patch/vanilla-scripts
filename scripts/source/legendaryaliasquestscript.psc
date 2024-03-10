ScriptName LegendaryAliasQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ForceLegendaryAlias Auto Const mandatory
Keyword Property LegendaryActorAliasApplied Auto Const mandatory

;-- Functions ---------------------------------------

Function MakeLegendary(Actor ActorToMakeLegendary)
  If ActorToMakeLegendary.HasKeyword(LegendaryActorAliasApplied) == False
    ForceLegendaryAlias.ApplyToRef(ActorToMakeLegendary as ObjectReference)
  EndIf
EndFunction

Function RemoveLegendary(Actor ActorToRemoveLegendary)
  ForceLegendaryAlias.RemoveFromRef(ActorToRemoveLegendary as ObjectReference)
EndFunction
