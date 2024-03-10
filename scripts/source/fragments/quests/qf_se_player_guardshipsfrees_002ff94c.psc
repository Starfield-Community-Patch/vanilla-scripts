ScriptName Fragments:Quests:QF_SE_Player_GuardShipsFrees_002FF94C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  guardshipquestscript kmyQuest = __temp as guardshipquestscript
  kmyQuest.AllowLanding(True)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
