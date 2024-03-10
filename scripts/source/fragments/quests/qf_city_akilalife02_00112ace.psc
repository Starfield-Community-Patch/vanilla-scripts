ScriptName Fragments:Quests:QF_City_AkilaLife02_00112ACE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SaharFarmMapMarker Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_FarmContainer Auto Const mandatory
Book Property AkilaLife02_SaharWill Auto Const mandatory
ReferenceAlias Property Alias_SaharWill Auto Const mandatory
ReferenceAlias Property Alias_OETrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_SaharFarmMapMarker.GetRef().Disable(False)
  Alias_OETrigger.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(25, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_SaharFarmMapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Int I = 0
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Alias_SaharWill.GetRef().Delete()
  Game.GetPlayer().RemoveItem(AkilaLife02_SaharWill as Form, 1, False, None)
  Game.GetPlayer().AddItem(Credits as Form, 10000, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(300, False, False)
  Self.SetObjectiveCompleted(400, True)
  Alias_SaharWill.GetRef().Delete()
  Game.GetPlayer().RemoveItem(AkilaLife02_SaharWill as Form, 1, False, None)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
