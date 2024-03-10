ScriptName Fragments:Quests:QF_OE_KMK_Supply01_0025B292 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ActorValue Property RQ_AV_Hello Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01Amount Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01AmountHalf Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01AmountThird Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01RewardHalf Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01RewardThird Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01RewardActual Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 1.0)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Int baseAmount = OE_KMK_Supply01Amount.GetValueInt()
  Int halfAmount = baseAmount / 2
  Int thirdAmount = baseAmount / 3
  OE_KMK_Supply01AmountHalf.SetValue(halfAmount as Float)
  OE_KMK_Supply01AmountThird.SetValue(thirdAmount as Float)
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01AmountHalf)
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01AmountThird)
  Int baseReward = OE_KMK_Supply01RewardActual.GetValueInt()
  Int halfReward = baseReward / 2
  Int thirdReward = baseReward / 3
  OE_KMK_Supply01RewardHalf.SetValue(halfReward as Float)
  OE_KMK_Supply01RewardThird.SetValue(thirdReward as Float)
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardHalf)
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardThird)
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardActual)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  missionsupplyscript kmyQuest = __temp as missionsupplyscript
  kmyQuest.UpdateSupplyAmount(OE_KMK_Supply01AmountHalf.GetValueInt())
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  missionsupplyscript kmyQuest = __temp as missionsupplyscript
  kmyQuest.UpdateSupplyAmount(OE_KMK_Supply01AmountThird.GetValueInt())
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  missionsupplyscript kmyQuest = __temp as missionsupplyscript
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 2.0)
  kmyQuest.MissionAccepted(True)
  Alias_MapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 3.0)
EndFunction
