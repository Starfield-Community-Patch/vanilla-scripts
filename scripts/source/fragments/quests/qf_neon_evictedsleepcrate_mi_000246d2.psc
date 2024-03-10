ScriptName Fragments:Quests:QF_Neon_EvictedSleepcrate_Mi_000246D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Door1 Auto Const mandatory
ReferenceAlias Property Alias_Door2 Auto Const mandatory
ReferenceAlias Property Alias_Door3 Auto Const mandatory
ReferenceAlias Property Alias_Door4 Auto Const mandatory
GlobalVariable Property pNeon_EvictedSleepcrate_Global Auto Const mandatory
MiscObject Property Credits Auto Const
Key Property Neon_EvictedSleepcrate_Key01 Auto Const
Key Property Neon_EvictedSleepcrate_Key02 Auto Const
Key Property Neon_EvictedSleepcrate_Key03 Auto Const
Key Property Neon_EvictedSleepcrate_Key04 Auto Const
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key01 as Form, 1, False)
  pNeon_EvictedSleepcrate_Global.Mod(1.0)
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  If Self.GetStageDone(40) == True && Self.GetStageDone(60) == True && Self.GetStageDone(80) == True
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key02 as Form, 1, False)
  pNeon_EvictedSleepcrate_Global.Mod(1.0)
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  If Self.GetStageDone(20) == True && Self.GetStageDone(60) == True && Self.GetStageDone(80) == True
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key03 as Form, 1, False)
  pNeon_EvictedSleepcrate_Global.Mod(1.0)
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True && Self.GetStageDone(80) == True
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0070_Item_00()
  Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key04 as Form, 1, False)
  pNeon_EvictedSleepcrate_Global.Mod(1.0)
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(70, True)
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True && Self.GetStageDone(60) == True
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.stop()
EndFunction
