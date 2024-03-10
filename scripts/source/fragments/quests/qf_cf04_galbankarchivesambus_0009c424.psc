ScriptName Fragments:Quests:QF_CF04_GalbankArchivesAmbus_0009C424 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF04 Auto Const mandatory
RefCollectionAlias Property Alias_GalbankEclipticActors Auto Const
ReferenceAlias Property Alias_GalbankEclipticBoss Auto Const mandatory
Location Property CityNewAtlantisGalBankArchivesLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CityNewAtlantisGalBankArchivesLocation.Reset()
  Alias_GalbankEclipticBoss.TryToReset()
  Alias_GalbankEclipticActors.ResetAll()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  cf04galbankarchivesambushquestscript kmyQuest = __temp as cf04galbankarchivesambushquestscript
  kmyQuest.OnGalbankArchivesTriggerEntered()
  CF04.SetStage(350)
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF04.SetStage(370)
EndFunction
