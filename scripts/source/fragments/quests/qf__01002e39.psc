ScriptName Fragments:Quests:QF__01002E39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory
GlobalVariable Property MQTempleQuest_HaveTempleObj Auto Const mandatory
GlobalVariable Property MQ_TurnOnTemples Auto Const mandatory
ReferenceAlias Property Alias_EyeScanner Auto Const mandatory
ReferenceAlias Property Alias_VladimirSall Auto Const mandatory
Message Property MQ401EyeScanMSG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0007_Item_00()
  MQ401EyeScanMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  Self.SetObjectiveCompleted(5, True)
  Self.SetObjectiveDisplayed(10, True, False)
  MQ_TurnOnTemples.SetValueInt(1)
  Alias_EyeScanner.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ_TurnOnTemples.SetValueInt(1)
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_EyeScanner.GetRef().Enable(False)
  Self.SetObjectiveDisplayed(5, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript
  kmyQuest.TempleDiscovered()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0060_Item_01()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
