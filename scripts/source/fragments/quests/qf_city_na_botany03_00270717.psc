ScriptName Fragments:Quests:QF_City_NA_Botany03_00270717 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Branch Auto Const mandatory
ReferenceAlias Property Alias_DebugStartMarker Auto Const mandatory
Scene Property City_NA_Botany03_005_Kelton Auto Const mandatory
Quest Property City_NA_Botany01 Auto Const mandatory
Quest Property City_NA_Botany02 Auto Const mandatory
GlobalVariable Property RAD02_InterviewCount Auto Const mandatory
ReferenceAlias Property Alias_Kelton_Slate Auto Const mandatory
ReferenceAlias Property Alias_EarlFulton Auto Const mandatory
ReferenceAlias Property Alias_Branch_Earl Auto Const mandatory
ReferenceAlias Property Alias_DebugAkilaMarker01 Auto Const mandatory
ReferenceAlias Property Alias_DebugAkilaMarker02 Auto Const mandatory
ReferenceAlias Property Alias_SSNNDebugMarker Auto Const mandatory
Quest Property Botany03Pointer Auto Const
ReferenceAlias Property Alias_Leah_Safe Auto Const
ReferenceAlias Property Alias_KeltonFrush Auto Const mandatory
Quest Property pCity_NA_Botany03_FlowerStateChange Auto Const mandatory
ObjectReference Property TreeSoundMarker Auto Const
ObjectReference Property KioskSoundMarker Auto Const
ObjectReference Property TreeSap_Enabler Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NA_Botany01.SetStage(200)
  City_NA_Botany02.SetStage(200)
  Game.GetPlayer().MoveTo(Alias_DebugStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(1)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(20)
  Game.GetPlayer().MoveTo(Alias_DebugAkilaMarker01.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(20)
  Self.SetStage(40)
  Self.SetStage(42)
  Game.GetPlayer().MoveTo(Alias_DebugAkilaMarker02.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(20)
  Self.SetStage(40)
  Self.SetStage(50)
  Self.SetStage(60)
  Game.GetPlayer().MoveTo(Alias_SSNNDebugMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Botany03Pointer.SetStage(1000)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Branch.GetReference().Enable(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Botany03Pointer.SetStage(1000)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(45, True, False)
EndFunction

Function Fragment_Stage_0042_Item_00()
  Self.SetObjectiveDisplayed(40, False, False)
EndFunction

Function Fragment_Stage_0046_Item_00()
  Self.SetObjectiveDisplayed(46, True, False)
EndFunction

Function Fragment_Stage_0047_Item_00()
  Self.SetObjectiveCompleted(46, True)
  Self.SetObjectiveDisplayed(47, True, False)
EndFunction

Function Fragment_Stage_0048_Item_00()
  If Self.GetStageDone(42)
    Self.SetObjectiveDisplayed(45, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(46)
    Self.SetObjectiveCompleted(46, True)
  EndIf
  Self.SetObjectiveCompleted(47, True)
  Alias_EarlFulton.GetActorRef().RemoveItem(Alias_Branch_Earl.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Branch_Earl.GetRef() as Form, 1, False)
  Alias_Leah_Safe.GetRef().RemoveItem(Alias_Branch.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(47) == False
    If Self.GetStageDone(41)
      Self.SetObjectiveCompleted(40, True)
      Self.SetObjectiveDisplayed(45, False, False)
    Else
      Self.SetObjectiveDisplayed(40, False, False)
      Self.SetObjectiveCompleted(45, True)
    EndIf
    Alias_EarlFulton.GetReference().RemoveItem(Alias_Branch_Earl.GetReference() as Form, 1, False, None)
  Else
    Self.SetObjectiveDisplayed(45, False, False)
  EndIf
  If Self.IsObjectiveCompleted(46) == False
    Self.SetObjectiveDisplayed(46, False, False)
  EndIf
  If Self.IsObjectiveCompleted(20) == False
    Self.SetObjectiveDisplayed(20, False, False)
  EndIf
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0055_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Branch.GetReference() as Form, 1, False, None)
  Game.GetPlayer().RemoveItem(Alias_Branch_Earl.GetReference() as Form, 1, False, None)
  City_NA_Botany03_005_Kelton.Start()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(55, True, False)
EndFunction

Function Fragment_Stage_0056_Item_00()
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveDisplayed(56, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(56, True)
  Self.SetObjectiveDisplayed(60, True, False)
  If RAD02_InterviewCount.GetValue() >= 3.0
    Self.SetStage(70)
  EndIf
  Alias_KeltonFrush.GetActorRef().RemoveItem(Alias_Kelton_Slate.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Kelton_Slate.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Kelton_Slate.GetReference() as Form, 1, False, None)
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(65, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0074_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Kelton_Slate.GetReference() as Form, 1, False, None)
  Self.SetStage(75)
EndFunction

Function Fragment_Stage_0075_Item_00()
  If Self.GetStageDone(65)
    Self.SetObjectiveCompleted(60, True)
    If Self.IsObjectiveDisplayed(70)
      Self.SetObjectiveDisplayed(70, False, False)
    EndIf
    If Self.IsObjectiveDisplayed(65)
      Self.SetObjectiveCompleted(65, True)
    EndIf
  ElseIf Self.GetStageDone(74)
    Self.SetObjectiveCompleted(70, True)
    Self.SetObjectiveDisplayed(60, False, False)
  EndIf
  Self.SetObjectiveDisplayed(75, True, False)
  KioskSoundMarker.Enable(False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(75, True)
  Self.SetObjectiveDisplayed(80, True, False)
  TreeSap_Enabler.Disable(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  pCity_NA_Botany03_FlowerStateChange.Start()
  pCity_NA_Botany03_FlowerStateChange.SetStage(10)
  TreeSoundMarker.Disable(False)
  KioskSoundMarker.Disable(False)
  Self.Stop()
EndFunction
