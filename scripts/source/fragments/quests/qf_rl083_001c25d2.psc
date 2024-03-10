ScriptName Fragments:Quests:QF_RL083_001C25D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PanelTop01 Auto Const
ObjectReference Property PanelTop02 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  rl083_assemblyline kmyQuest = __temp as rl083_assemblyline
  kmyQuest.StartConstruct()
EndFunction
