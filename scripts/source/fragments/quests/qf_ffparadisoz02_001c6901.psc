ScriptName Fragments:Quests:QF_FFparadisoZ02_001C6901 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FFParadisoZ02_RoomKey Auto Const mandatory
MiscObject Property FFParadisoZ02_Thermos Auto Const mandatory
MiscObject Property FFParadisoZ02_WeddingRing Auto Const mandatory
MiscObject Property FFParadisoZ02_Slate Auto Const mandatory
Quest Property FFParadisoZ02Misc Auto Const mandatory
ReferenceAlias Property Alias_RoomKey Auto Const mandatory
ReferenceAlias Property Alias_Thermos Auto Const mandatory
ReferenceAlias Property Alias_WeddingRing Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
ActorValue Property FFParadisoZ02_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_RoomKey.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(Alias_Thermos.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_WeddingRing.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().MoveTo(Alias_Slate.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor myPlayer = Game.GetPlayer()
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetObjectiveDisplayed(300, True, False)
  Self.SetObjectiveDisplayed(400, True, False)
  Self.SetObjectiveDisplayed(500, True, False)
  If myPlayer.GetItemCount(FFParadisoZ02_RoomKey as Form) >= 1
    Self.SetStage(200)
  EndIf
  If myPlayer.GetItemCount(FFParadisoZ02_Thermos as Form) >= 1
    Self.SetStage(300)
  EndIf
  If myPlayer.GetItemCount(FFParadisoZ02_WeddingRing as Form) >= 1
    Self.SetStage(400)
  EndIf
  If myPlayer.GetItemCount(FFParadisoZ02_Slate as Form) >= 1
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True)
  If Self.GetStageDone(300) && Self.GetStageDone(400) && Self.GetStageDone(500)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If Self.GetStageDone(200) && Self.GetStageDone(400) && Self.GetStageDone(500)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  If Self.GetStageDone(200) && Self.GetStageDone(300) && Self.GetStageDone(500)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If Self.GetStageDone(200) && Self.GetStageDone(300) && Self.GetStageDone(400)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  FFParadisoZ02Misc.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.SetValue(FFParadisoZ02_Foreknowledge_AV, 1.0)
  myPlayer.RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_RoomKey.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_Thermos.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_WeddingRing.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
