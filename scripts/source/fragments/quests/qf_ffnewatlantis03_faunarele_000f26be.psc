ScriptName Fragments:Quests:QF_FFNewAtlantis03_FaunaRele_000F26BE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Fauna Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
RefCollectionAlias Property Alias_FaunaCollection Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_FaunaCollection.SetValue(Aggression, 0.0)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.Stop()
EndFunction
