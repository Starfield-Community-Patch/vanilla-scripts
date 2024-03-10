ScriptName Fragments:Quests:QF_City_CY_Psych01_00225130 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AndresAnswers01 Auto Const mandatory
ReferenceAlias Property Alias_AndresAnswers02 Auto Const mandatory
ReferenceAlias Property Alias_AndresAnswers03 Auto Const mandatory
ReferenceAlias Property Alias_AndresAnswers04 Auto Const mandatory
ReferenceAlias Property Alias_HankAnswers Auto Const mandatory
ReferenceAlias Property Alias_LeonaAnswers Auto Const mandatory
ReferenceAlias Property Alias_SamundAnswers Auto Const mandatory
ReferenceAlias Property Alias_AndresQuestions Auto Const mandatory
ReferenceAlias Property Alias_HankQuestions Auto Const mandatory
ReferenceAlias Property Alias_LeonaQuestions Auto Const mandatory
ReferenceAlias Property Alias_SamundQuestions Auto Const mandatory
GlobalVariable Property City_CY_RedTape02Request01 Auto Const mandatory
Quest Property City_CY_RedTape03 Auto Const mandatory
conditionform Property City_CY_RedTape03_HankGoneConditionForm Auto Const mandatory
conditionform Property City_CY_Psych01_CheckStagesConditionForm Auto Const mandatory
conditionform Property City_CY_Psych01_CheckStagesNoHankConditionForm Auto Const mandatory
Quest Property City_CY_Psych01Misc Auto Const mandatory
Topic Property City_CY_Psych01_0201_Leona Auto Const mandatory
ReferenceAlias Property Alias_Andres Auto Const mandatory
ReferenceAlias Property Alias_Hank Auto Const mandatory
ReferenceAlias Property Alias_Leona Auto Const mandatory
ReferenceAlias Property Alias_Samund Auto Const mandatory
Float[] Property MarkerOffset Auto Const
ReferenceAlias Property Alias_SlateMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().MoveTo(Alias_Andres.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_Hank.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Leona.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().MoveTo(Alias_Samund.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If City_CY_Psych01Misc.IsRunning()
    City_CY_Psych01Misc.SetStage(1000)
  EndIf
  Actor myPlayer = Game.GetPlayer()
  myPlayer.AddItem(Alias_AndresQuestions.GetRef() as Form, 1, False)
  myPlayer.AddItem(Alias_LeonaQuestions.GetRef() as Form, 1, False)
  myPlayer.AddItem(Alias_SamundQuestions.GetRef() as Form, 1, False)
  Self.SetObjectiveDisplayed(110, True, False)
  Self.SetObjectiveDisplayed(130, True, False)
  Self.SetObjectiveDisplayed(140, True, False)
  If !City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None)
    Self.SetObjectiveDisplayed(120, True, False)
    myPlayer.AddItem(Alias_HankQuestions.GetRef() as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Actor myPlayer = Game.GetPlayer()
  Float myRequestValue = City_CY_RedTape02Request01.GetValue()
  Bool myHankBool = City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None)
  myPlayer.RemoveItem(Alias_AndresQuestions.GetRef() as Form, 1, False, None)
  If myRequestValue == 0.0 && myHankBool == False
    myPlayer.AddItem(Alias_AndresAnswers01.GetRef() as Form, 1, False)
  ElseIf myRequestValue == 1.0 && myHankBool == False
    myPlayer.AddItem(Alias_AndresAnswers02.GetRef() as Form, 1, False)
  ElseIf myRequestValue == 0.0 && myHankBool == True
    myPlayer.AddItem(Alias_AndresAnswers03.GetRef() as Form, 1, False)
  ElseIf myRequestValue == 1.0 && myHankBool == True
    myPlayer.AddItem(Alias_AndresAnswers04.GetRef() as Form, 1, False)
  EndIf
  If myHankBool
    If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue(None, None)
      Self.SetStage(200)
    EndIf
  ElseIf City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Actor myPlayer = Game.GetPlayer()
  myPlayer.RemoveItem(Alias_HankQuestions.GetRef() as Form, 1, False, None)
  myPlayer.AddItem(Alias_HankAnswers.GetRef() as Form, 1, False)
  If City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0121_Item_00()
  Self.SetObjectiveDisplayed(120, False, False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(130, True)
  Actor myPlayer = Game.GetPlayer()
  myPlayer.RemoveItem(Alias_LeonaQuestions.GetRef() as Form, 1, False, None)
  myPlayer.AddItem(Alias_LeonaAnswers.GetRef() as Form, 1, False)
  If City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None)
    If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue(None, None)
      Self.SetStage(200)
    EndIf
  ElseIf City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(140, True)
  Actor myPlayer = Game.GetPlayer()
  myPlayer.RemoveItem(Alias_SamundQuestions.GetRef() as Form, 1, False, None)
  myPlayer.AddItem(Alias_SamundAnswers.GetRef() as Form, 1, False)
  If City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None)
    If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue(None, None)
      Self.SetStage(200)
    EndIf
  ElseIf City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0201_Item_00()
  Alias_Leona.GetActorRef().Say(City_CY_Psych01_0201_Leona, None, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.RemoveItem(Alias_HankQuestions.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_AndresAnswers01.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_AndresAnswers02.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_AndresAnswers03.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_AndresAnswers04.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_HankAnswers.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_LeonaAnswers.GetRef() as Form, 1, False, None)
  myPlayer.RemoveItem(Alias_SamundAnswers.GetRef() as Form, 1, False, None)
  Self.SetObjectiveCompleted(200, True)
  Self.Stop()
EndFunction
