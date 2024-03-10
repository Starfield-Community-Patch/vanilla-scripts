ScriptName Fragments:Quests:QF_City_ER_Ghost_SupportQues_0014332E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RobotEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_PirateEnableMarkers Auto Const mandatory
GlobalVariable Property StoryManager_EleosRetreatLoad Auto Const mandatory
LocationAlias Property Alias_DR007ListeningPostLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_RobotEnableMarker.GetRef().Enable(False)
  Alias_PirateEnableMarkers.DisableAll(False)
  StoryManager_EleosRetreatLoad.SetValue(1.0)
  Alias_DR007ListeningPostLocation.GetLocation().SetNeverResets(True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
