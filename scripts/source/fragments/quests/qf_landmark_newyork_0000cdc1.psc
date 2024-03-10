ScriptName Fragments:Quests:QF_Landmark_NewYork_0000CDC1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property Wwise_Event_QST_Landmark_Snowglobe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  landmarkscript kmyQuest = __temp as landmarkscript
  Self.SetObjectiveCompleted(100, True)
  Wwise_Event_QST_Landmark_Snowglobe.PlayUI(None, None)
  kmyQuest.LandmarkFound()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
