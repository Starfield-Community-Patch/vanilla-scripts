ScriptName Fragments:Quests:QF_FCR01_0014AFC0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FCR01TimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_FirstBossRename Auto Const mandatory
ReferenceAlias Property Alias_BossREF Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
  If FCR01TimesCompleted.GetValue() == 0.0
    Self.SetStage(110)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  If FCR01TimesCompleted.GetValue() == 0.0
    Alias_FirstBossRename.ForceRefTo(Alias_BossREF.GetRef())
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  If FCR01TimesCompleted.GetValue() == 0.0
    Self.SetObjectiveDisplayed(155, True, False)
  Else
    Self.SetObjectiveDisplayed(150, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveCompleted(155, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives()
  FCR01TimesCompleted.Mod(1.0)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
