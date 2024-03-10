ScriptName Fragments:Quests:QF_RE_AssaultMP01_003713D9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TRIGGER Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  rescript kmyQuest = __temp as rescript
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  reassaultquestscript kmyQuest = __temp as reassaultquestscript
  kmyQuest.StartAssault()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  reassaultquestscript kmyQuest = __temp as reassaultquestscript
  kmyQuest.CompleteAssault()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  reassaultquestscript kmyQuest = __temp as reassaultquestscript
  kmyQuest.CompleteAssault()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  reassaultquestscript kmyQuest = __temp as reassaultquestscript
  kmyQuest.CleanupAssault()
EndFunction

Function Fragment_Stage_1000_Item_01()
  Quest __temp = Self as Quest
  rescript kmyQuest = __temp as rescript
EndFunction
