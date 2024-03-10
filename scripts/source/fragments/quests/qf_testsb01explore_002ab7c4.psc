ScriptName Fragments:Quests:QF_TestSB01Explore_002AB7C4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  MQ104A.SetObjectiveCompleted(70, True)
  If Alias_PlanetExploredTrait.GetLocation() == None
    MQ104A.SetObjectiveDisplayed(71, True, False)
  Else
    MQ104A.SetObjectiveDisplayed(73, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Game.GetPlayer().WaitFor3DLoad()
  Utility.Wait(0.25)
  MQ_TempleTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.25)
  MQ104A.SetObjectiveCompleted(71, True)
  MQ104A.SetObjectiveDisplayed(72, True, False)
  MQ104A.SetObjectiveDisplayed(74, True, False)
  MQ104A.SetStage(305)
  kmyQuest.ShowHelpMessage("OutpostTutorial")
EndFunction

Function Fragment_Stage_0032_Item_00()
  MQ104A.SetObjectiveCompleted(74, True)
  MQ104A.SetObjectiveDisplayed(75, True, False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  MQ104A.SetObjectiveCompleted(74, True)
  MQ104A.SetObjectiveCompleted(75, True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript
  kmyQuest.TempleDiscovered()
  MQ104A.SetObjectiveCompleted(72, True)
  MQ104A.SetObjectiveDisplayed(73, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40)
  MQ104A.SetStage(400)
EndFunction

Function Fragment_Stage_0060_Item_00()
  MQ104A.SetStage(600)
  Self.Stop()
EndFunction
