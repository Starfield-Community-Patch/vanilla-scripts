ScriptName Fragments:Quests:QF_City_AkilaLife08_002D2517 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property AkilaLife08_WheatJar Auto Const mandatory
ReferenceAlias Property Alias_WheatDelivery Auto Const mandatory
ReferenceAlias Property Alias_Ashta Auto Const mandatory
ReferenceAlias Property Alias_Ashta02 Auto Const mandatory
ReferenceAlias Property Alias_Ashta03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_Ashta.GetRef().Enable(False)
  Alias_Ashta02.GetRef().Enable(False)
  Alias_Ashta03.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Self.SetObjectiveDisplayed(600, True, False)
  Self.SetObjectiveDisplayed(700, True, False)
  If Alias_Ashta.GetActorRef().IsDead() == False
    Alias_Ashta.GetActorRef().Disable(False)
  EndIf
  If Alias_Ashta02.GetActorRef().IsDead() == False
    Alias_Ashta02.GetRef().Disable(False)
  EndIf
  If Alias_Ashta03.GetActorRef().IsDead() == False
    Alias_Ashta03.GetRef().Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If Self.GetStageDone(600) && Self.GetStageDone(700)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If Self.GetStageDone(500) && Self.GetStageDone(700)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True)
  If Self.GetStageDone(600) && Self.GetStageDone(500)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  Game.GetPlayer().AddAliasedItem(AkilaLife08_WheatJar as Form, Alias_WheatDelivery as Alias, 1, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().RemoveItem(AkilaLife08_WheatJar as Form, 1, False, None)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
