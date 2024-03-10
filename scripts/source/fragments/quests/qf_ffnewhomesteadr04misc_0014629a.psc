ScriptName Fragments:Quests:QF_FFNewHomesteadR04Misc_0014629A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Turbine01 Auto Const mandatory
ReferenceAlias Property Alias_Turbine02 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker01 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker02 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker03 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker04 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker05 Auto Const mandatory
ReferenceAlias[] Property QuestTurbines Auto Const
RefCollectionAlias Property Alias_AllTurbines Auto Const mandatory
ReferenceAlias Property Alias_Turbine03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  ffnewhomesteadr04miscquestscript kmyQuest = __temp as ffnewhomesteadr04miscquestscript
  kmyQuest.RegisterIce()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
