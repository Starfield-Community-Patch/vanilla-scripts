ScriptName Fragments:Quests:QF_TestSB01Landing_002AB7CD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("OutpostTutorial")
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript
  kmyQuest.TempleDiscovered()
  Self.SetObjectiveDisplayed(10, True, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
  Self.Reset()
EndFunction