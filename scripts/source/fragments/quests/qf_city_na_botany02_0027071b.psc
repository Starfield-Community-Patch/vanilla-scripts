ScriptName Fragments:Quests:QF_City_NA_Botany02_0027071B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EmilioHadek Auto Const mandatory
ReferenceAlias Property Alias_DataSlate Auto Const mandatory
ObjectReference Property City_NA_Botany01_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_KeltonFrush Auto Const mandatory
Quest Property City_NA_Botany03 Auto Const mandatory
Quest Property Botany02Pointer Auto Const
Quest Property Botany03Pointer Auto Const
GlobalVariable Property Botany3Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property Botany03 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Game.GetPlayer().MoveTo(City_NA_Botany01_StartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_KeltonFrush.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Botany02Pointer.SetStage(1000)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10)
    Self.SetObjectiveCompleted(10, True)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
  Botany02Pointer.SetStage(1000)
  Alias_EmilioHadek.GetRef().Enable(False)
  Utility.Wait(2.0)
  Alias_EmilioHadek.GetActorRef().EvaluatePackage(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Self.IsObjectiveDisplayed(40)
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(30)
    Self.SetObjectiveDisplayed(30, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveDisplayed(20, False, False)
  EndIf
  If Self.GetStageDone(180) == False
    Self.SetObjectiveDisplayed(150, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0180_Item_00()
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveDisplayed(20, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(40)
    Self.SetObjectiveDisplayed(40, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(60)
    Self.SetObjectiveCompleted(60, True)
  EndIf
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveCompleted(20, True)
  EndIf
  If Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveCompleted(150, True)
  EndIf
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataSlate.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Botany03.Start()
  Self.Stop()
  Botany3Timer.SetValue(DaysPassed.GetValue() + 1.0)
  Botany03Pointer.SetStage(10)
EndFunction
