ScriptName Fragments:Quests:QF_FFParadisoZ03_001C433F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFParadisoZ03Misc Auto Const mandatory
ReferenceAlias Property Alias_Recipe Auto Const mandatory
ReferenceAlias Property Alias_Rowan Auto Const mandatory
ActorValue Property FFParadisoZ03_Foreknowledge_AV Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFParadisoZ03_BribePrice Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FFParadisoZ03Misc.SetStage(1000)
  If !DialogueParadiso.GetStageDone(1320)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
  Alias_Rowan.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Actor myPlayer = Game.GetPlayer()
  Int iBribeAmount = FFParadisoZ03_BribePrice.GetValue() as Int
  If myPlayer.GetItemCount(Credits as Form) >= iBribeAmount
    myPlayer.RemoveItem(Credits as Form, iBribeAmount, False, None)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor myPlayer = Game.GetPlayer()
  ObjectReference myRecipe = Alias_Recipe.GetRef()
  If myPlayer.GetItemCount(myRecipe as Form) < 1
    myPlayer.AddItem(myRecipe as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer()
  If myPlayer.GetValue(FFParadisoZ03_Foreknowledge_AV) < 4.0
    myPlayer.ModValue(FFParadisoZ03_Foreknowledge_AV, 1.0)
  EndIf
  ObjectReference myRecipe = Alias_Recipe.GetRef()
  If myPlayer.GetItemCount(myRecipe as Form) > 0
    myPlayer.RemoveItem(myRecipe as Form, 1, False, None)
  EndIf
  Alias_Rowan.GetRef().Disable(False)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
