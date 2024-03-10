ScriptName Fragments:Quests:QF_City_GG_Bet_0018BC55 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AgGoods Auto Const mandatory
ReferenceAlias Property Alias_ShipContainer Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
ObjectReference Property UC_GG_Bet_DebugMarker01 Auto Const mandatory
MiscObject Property UC_GG_Bet_Liquor Auto Const mandatory
GlobalVariable Property UC_GG_Bet_PlayerNegotiatedBonus Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_DebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Int I = 0
  Int iCount = Alias_AgGoods.GetCount()
  ObjectReference PlayINV = Game.GetPlayer() as ObjectReference
  While I < iCount
    ObjectReference currGood = Alias_AgGoods.GetAt(I)
    If currGood != None
      PlayINV.AddItem(currGood as Form, 1, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(200)
  Game.GetPlayer().MoveTo(UC_GG_Bet_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  UC_GG_Bet_PlayerNegotiatedBonus.SetValue(1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Bet_Liquor as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
