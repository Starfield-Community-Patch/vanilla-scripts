ScriptName Fragments:Quests:QF_SQ_GuardShips00_001F0C32_4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest
  guardshipquestscript kmyQuest = __temp as guardshipquestscript
  kmyQuest.debugAlarmStatus()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  guardshipquestscript kmyQuest = __temp as guardshipquestscript
  kmyQuest.AllowLanding(True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
