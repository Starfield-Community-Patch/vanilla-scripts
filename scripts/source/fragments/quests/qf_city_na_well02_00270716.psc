ScriptName Fragments:Quests:QF_City_NA_Well02_00270716 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_NA_Well02_002_Zoe_Louisa Auto Const mandatory
ReferenceAlias Property Alias_LouisaReyez Auto Const mandatory
ReferenceAlias Property Alias_Louisa_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_ZoeKaminski Auto Const mandatory
Scene Property City_NA_Well02_007_Stage70Scene Auto Const mandatory
Scene Property City_NA_Well02_009_Stage90Scene Auto Const mandatory
Scene Property City_NA_Well02_011_Stage110Scene Auto Const mandatory
Scene Property City_NA_Well02_012_Stage115Scene Auto Const mandatory
Scene Property City_NA_Well02_004_Zoe_Louisa_Stage40 Auto Const mandatory
Scene Property City_NA_Well02_013_Stage120Scene Auto Const mandatory
Scene Property City_NA_Well02_014_Stage150Scene Auto Const mandatory
Scene Property JunctionBoxScene01 Auto Const
Quest Property City_NA_Well01 Auto Const mandatory
Scene Property JunctionBoxScene02 Auto Const
Scene Property JunctionBoxScene03 Auto Const
Scene Property JunctionBoxScene04 Auto Const
ReferenceAlias Property Alias_BoxDoor01 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor02 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor03 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor04 Auto Const mandatory
Scene Property City_NA_Well02_Stage60_LouisaFollowUp Auto Const mandatory
ReferenceAlias Property Alias_ApartmentDoor Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
Scene Property City_NA_Well02_WrapUp_Stage190Done Auto Const mandatory
Scene Property City_NA_Well02_WrapUp_Stage180Done Auto Const mandatory
Quest Property pCity_NA_Well02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NA_Well01.SetStage(200)
  Alias_LouisaReyez.GetReference().MoveTo(Alias_Louisa_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10)
    Self.SetObjectiveCompleted(10, True)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
  City_NA_Well02_002_Zoe_Louisa.Start()
  Alias_LouisaReyez.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_LouisaReyez.GetActorReference().EvaluatePackage(False)
  City_NA_Well02_004_Zoe_Louisa_Stage40.Start()
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False)
  Alias_BoxDoor01.GetReference().Lock(False, False, True)
  City_NA_Well02_Stage60_LouisaFollowUp.Start()
EndFunction

Function Fragment_Stage_0060_Item_00()
  JunctionBoxScene01.Start()
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  If JunctionBoxScene01.IsPlaying()
    JunctionBoxScene01.Stop()
    Self.SetObjectiveCompleted(50, True)
  EndIf
  Self.SetObjectiveCompleted(60, True)
  City_NA_Well02_007_Stage70Scene.Start()
  Self.SetObjectiveDisplayed(70, True, False)
  Self.SetObjectiveDisplayed(71, True, False)
  pCity_NA_Well02.SetObjectiveDisplayedAtTop(70)
  Alias_BoxDoor02.GetReference().Lock(False, False, True)
  Alias_BoxDoor03.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0080_Item_00()
  If Self.GetStageDone(110) == False
    JunctionBoxScene02.Start()
  EndIf
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(71, True)
  Self.SetObjectiveDisplayed(70, False, False)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  If JunctionBoxScene02.IsPlaying()
    JunctionBoxScene02.Stop()
    Self.SetObjectiveCompleted(71, True)
    Self.SetObjectiveDisplayed(70, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(80)
    Self.SetObjectiveDisplayed(80, False, False)
  EndIf
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
  City_NA_Well02_011_Stage110Scene.Start()
  Alias_BoxDoor04.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(90) == False
    JunctionBoxScene03.Start()
  EndIf
EndFunction

Function Fragment_Stage_0105_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(71, False, False)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  If JunctionBoxScene03.IsPlaying()
    JunctionBoxScene03.Stop()
    Self.SetObjectiveCompleted(70, True)
    Self.SetObjectiveDisplayed(71, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(100)
    Self.SetObjectiveDisplayed(100, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(80)
    Self.SetObjectiveCompleted(80, True)
  EndIf
  Self.SetObjectiveDisplayed(110, True, False)
  If Self.GetStageDone(90) == False
    City_NA_Well02_009_Stage90Scene.Start()
  EndIf
  Alias_BoxDoor04.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0115_Item_00()
  City_NA_Well02_012_Stage115Scene.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  JunctionBoxScene04.Start()
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  If JunctionBoxScene04.IsPlaying()
    JunctionBoxScene04.Stop()
  EndIf
  If Self.IsObjectiveCompleted(110) == False
    Self.SetObjectiveCompleted(110, True)
  EndIf
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(150, True, False)
  City_NA_Well02_014_Stage150Scene.Start()
  Alias_ApartmentDoor.GetReference().SetLockLevel(25)
EndFunction

Function Fragment_Stage_0151_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(151, True, False)
EndFunction

Function Fragment_Stage_0152_Item_00()
  Game.GetPlayer().AddItem(Digipick as Form, 3, False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(151, True)
  Self.SetObjectiveDisplayed(160, True, False)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(160, True)
  Self.SetObjectiveDisplayed(170, True, False)
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(170, False, False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(170, True)
  Self.SetObjectiveDisplayed(180, False, False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  If Self.GetStageDone(180)
    City_NA_Well02_WrapUp_Stage180Done.Start()
  Else
    City_NA_Well02_WrapUp_Stage190Done.Start()
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
