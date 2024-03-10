ScriptName Fragments:Quests:QF_DialogueFCNeon_PlayerHome_00370965 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property FCNeon_TradeTowerPlayerHomeKey Auto Const mandatory
Key Property FCNeon_SleepcratePlayerHomeKey Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
GlobalVariable Property FCNeon_SleepcrateHomeGlobal Auto Const mandatory
GlobalVariable Property FCNeon_TradeTowerHomeGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  PlayerHouseSystem.PurchaseHouse(FCNeon_SleepcrateHomeGlobal, FCNeon_SleepcratePlayerHomeKey)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  If Self.GetStageDone(40)
    Self.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  PlayerHouseSystem.PurchaseHouse(FCNeon_TradeTowerHomeGlobal, FCNeon_TradeTowerPlayerHomeKey)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  If Self.GetStageDone(20)
    Self.Stop()
  EndIf
EndFunction
