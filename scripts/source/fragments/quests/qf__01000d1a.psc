ScriptName Fragments:Quests:QF__01000D1A Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int SelectedScene = Utility.RandomInt(1, 10)
  If SelectedScene <= 2
    Self.SetStage(110)
  ElseIf SelectedScene <= 6
    Self.SetStage(120)
  Else
    Self.SetStage(130)
  EndIf
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
