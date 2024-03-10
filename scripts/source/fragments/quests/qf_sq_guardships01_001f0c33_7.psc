ScriptName Fragments:Quests:QF_SQ_GuardShips01_001F0C33_7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
GlobalVariable Property SQ_GuardShipsWaitToScan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0010_Item_00()
  SQ_GuardShipsWaitToScan.SetValue(0.0)
EndFunction

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
