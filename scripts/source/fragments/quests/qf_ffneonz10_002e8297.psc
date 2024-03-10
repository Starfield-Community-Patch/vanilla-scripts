ScriptName Fragments:Quests:QF_FFNeonZ10_002E8297 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Thug01 Auto Const mandatory
Scene Property FFNeonZ10_020_TL_ThugScene Auto Const mandatory
ReferenceAlias Property Alias_FrankContainer Auto Const mandatory
ReferenceAlias Property Alias_Contraband Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Thug02 Auto Const mandatory
ReferenceAlias Property Alias_Thug03 Auto Const mandatory
Quest Property City_Neon_Gang03 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CreditsRewardMinorExtortion Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
Quest Property FFNeonGuardPointer_Z10 Auto Const mandatory
ReferenceAlias Property Alias_Manaia Auto Const mandatory
GlobalVariable Property FFNeonZ10_SidestarValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Manaia.GetReF().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  If City_Neon_Gang03.IsRunning()
    Alias_Thug01.GetReF().DisableNoWait(False)
  Else
    FFNeonZ10_020_TL_ThugScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Actor Thug01 = Alias_Thug01.GetActorRef()
  If !City_Neon_Gang03.IsRunning()
    Thug01.EnableNoWait(False)
    Thug01.SetValue(Aggression, 1.0)
    Alias_Thug02.GetActorRef().SetValue(Aggression, 1.0)
    Alias_Thug03.GetActorRef().SetValue(Aggression, 1.0)
  EndIf
  FFNeonGuardPointer_Z10.SetStage(200)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Game.GetPlayer().RemoveItem(Alias_Contraband.GetReF() as Form, 1, False, None)
  If Self.GetStageDone(40)
    Game.GetPlayer().AddItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False)
  Else
    Game.GetPlayer().AddItem(Credits as Form, FFNeonZ10_SidestarValue.GetValueInt(), False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Manaia.GetReF().DisableNoWait(False)
  Self.Stop()
EndFunction
