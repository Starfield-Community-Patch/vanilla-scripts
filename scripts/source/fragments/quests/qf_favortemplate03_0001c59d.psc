ScriptName Fragments:Quests:QF_FavorTemplate03_0001C59D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RedHerring01 Auto Const mandatory
Scene Property FavorTemplate02_002_RedHerring01 Auto Const mandatory
ReferenceAlias Property Alias_RedHerring02 Auto Const mandatory
Scene Property FavorTemplate02_003_RedHerring02 Auto Const mandatory
ReferenceAlias Property Alias_KeyClue Auto Const mandatory
Scene Property FavorTemplate02_004_KeyClue Auto Const mandatory
ReferenceAlias Property Alias_AutopsyTarget Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False
    Self.SetObjectiveDisplayed(10, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0015_Item_00()
  If Self.GetStageDone(10) == False
    Self.SetObjectiveDisplayed(10, True, False)
  EndIf
  Alias_AutopsyTarget.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.GetStageDone(10) == False
    Self.SetObjectiveDisplayed(10, True, False)
  EndIf
  Alias_AutopsyTarget.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_RedHerring01.GetRef().Disable(False)
  FavorTemplate02_002_RedHerring01.Start()
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_RedHerring02.GetRef().Disable(False)
  FavorTemplate02_003_RedHerring02.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_KeyClue.GetRef().Disable(False)
  FavorTemplate02_004_KeyClue.Start()
EndFunction

Function Fragment_Stage_0060_Item_00()
  If Self.GetStageDone(100) == False
    Self.SetObjectiveCompleted(10, True)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True
    Self.SetObjectiveCompleted(20, True)
    Self.SetObjectiveDisplayed(30, True, False)
  Else
    Self.SetObjectiveCompleted(20, True)
    Self.SetObjectiveDisplayed(35, True, False)
  EndIf
  Alias_RedHerring01.GetRef().Disable(False)
  Alias_RedHerring02.GetRef().Disable(False)
  Alias_KeyClue.GetRef().Disable(False)
  Alias_AutopsyTarget.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction
