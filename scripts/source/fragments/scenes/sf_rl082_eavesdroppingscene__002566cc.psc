ScriptName Fragments:Scenes:SF_RL082_EavesdroppingScene__002566CC Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor03 Auto Const
ReferenceAlias Property Alias_Actor04 Auto Const
ReferenceAlias Property EavesdropGroup Auto Const
RefCollectionAlias Property EavesdropGroupAlias Auto Const
Faction Property PlayerAllyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  Alias_Actor03.getref().disable(False)
  Alias_Actor04.getref().disable(False)
  EavesdropGroupAlias.RemoveFromFaction(PlayerAllyFaction)
EndFunction
