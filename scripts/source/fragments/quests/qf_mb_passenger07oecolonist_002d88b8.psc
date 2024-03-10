ScriptName Fragments:Quests:QF_MB_Passenger07OEColonist_002D88B8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PCM_Request_OE_Civilian Auto Const mandatory
LocationAlias Property Alias_TargetPlanetLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_TargetPlanetLocation.GetLocation().AddKeyword(PCM_Request_OE_Civilian)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.StopQuestTimer()
  Self.SetObjectiveCompleted(10, True)
EndFunction
