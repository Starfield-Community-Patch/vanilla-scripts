ScriptName Fragments:Quests:QF_BE_SC02_002BADF8 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ((Self as Quest) as be_sc02questscript).SetupCaptain()
  ((Self as Quest) as bescript).SetCrewPlayerFriend(True, True)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  bescript kmyQuest = __temp as bescript
  kmyQuest.SetCrewPlayerFriend(False, True)
EndFunction
