ScriptName Fragments:Quests:QF_City_AkilaLife05_0003DC10 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weapon Property Cutter Auto Const mandatory
Scene Property City_AkilaLife05_100_TateGivesQuest Auto Const mandatory
RefCollectionAlias Property Alias_Rocks Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest
  city_akilalife05script kmyQuest = __temp as city_akilalife05script
  kmyQuest.RegisterRocks()
EndFunction

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(25, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Game.GetPlayer().AddItem(Cutter as Form, 1, False)
  Alias_Rocks.EnableAll(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
