ScriptName Fragments:Quests:QF_FFNewAtlantis02_0024C46C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNewAtlantis02_Credits_Medium Auto Const mandatory
GlobalVariable Property FFNewAtlantis02_Credits_Small Auto Const mandatory
ReferenceAlias Property Alias_PackageActivator Auto Const mandatory
ReferenceAlias Property Alias_Package Auto Const mandatory
MiscObject Property FFNewAtlantis02_Package Auto Const mandatory
Quest Property FFNewAtlantis04 Auto Const mandatory
Quest Property City_NA_GuardPointer_NA02 Auto Const mandatory
Quest Property FFNewAtlantis02 Auto Const mandatory
Quest Property FFNewAtlantis02TopLevels Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FFNewAtlantis02.Start()
  FFNewAtlantis02TopLevels.Start()
  FFNewAtlantis02Misc.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  Self.SetObjectiveDisplayed(10, True, False)
  If Self.GetStageDone(15) == True
    PlayerREF.AddItem(Credits as Form, FFNewAtlantis02_Credits_Medium.GetValueInt(), False)
  Else
    PlayerREF.AddItem(Credits as Form, FFNewAtlantis02_Credits_Small.GetValueInt(), False)
  EndIf
  City_NA_GuardPointer_NA02.SetStage(200)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_PackageActivator.GetRef().EnableNoWait(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_PackageActivator.GetRef().DisableNoWait(False)
  Game.GetPlayer().AddAliasedItem(FFNewAtlantis02_Package as Form, Alias_Package as Alias, 1, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Package.GetRef() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  FFNewAtlantis04.Start()
  Self.Stop()
EndFunction
