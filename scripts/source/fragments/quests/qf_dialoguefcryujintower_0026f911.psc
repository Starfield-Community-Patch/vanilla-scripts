ScriptName Fragments:Quests:QF_DialogueFCRyujinTower_0026F911 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property JupiterEllicott Auto Const
ReferenceAlias Property JupiterAliasRef Auto Const
Quest Property RI01Quest Auto Const
Quest Property RI02Quest Auto Const
Quest Property RI03Quest Auto Const
ObjectReference Property SettlementEnableMarker Auto Const
GlobalVariable Property DR017_DataCredits Auto Const mandatory
Book Property DR017_ValuableData01 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property DR017_DataCreditsHigh Auto Const mandatory
GlobalVariable Property DR017_DemandedHighPrice Auto Const mandatory
ReferenceAlias Property Alias_SeanMcAfee Auto Const mandatory
GlobalVariable Property RI_LaneUnlockTLs Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  RI01Quest.SetStage(10)
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01Quest.CompleteQuest()
  RI02Quest.SetStage(10)
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI02Quest.CompleteQuest()
  RI03Quest.SetStage(10)
EndFunction

Function Fragment_Stage_0004_Item_00()
  SettlementEnableMarker.Enable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  JupiterAliasRef.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  RI_LaneUnlockTLs.SetValue(1.0)
EndFunction

Function Fragment_Stage_1350_Item_00()
  RI05_ImogeneDead.SetValue(1.0)
EndFunction

Function Fragment_Stage_2010_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  Int DataCount = PlayerREF.GetItemCount(DR017_ValuableData01 as Form)
  Float fDemandedHighPrice = DR017_DemandedHighPrice.GetValue()
  If fDemandedHighPrice == 1.0
    PlayerREF.AddItem(Credits as Form, DataCount * DR017_DataCreditsHigh.GetValueInt(), False)
  Else
    PlayerREF.AddItem(Credits as Form, DataCount * DR017_DataCredits.GetValueInt(), False)
  EndIf
  PlayerREF.RemoveItem(DR017_ValuableData01 as Form, DataCount, False, None)
EndFunction

Function Fragment_Stage_2020_Item_00()
  DR017_DemandedHighPrice.SetValue(1.0)
  Self.SetStage(2010)
EndFunction

Function Fragment_Stage_4410_Item_00()
  Alias_SeanMcAfee.GetRef().Disable(False)
EndFunction
