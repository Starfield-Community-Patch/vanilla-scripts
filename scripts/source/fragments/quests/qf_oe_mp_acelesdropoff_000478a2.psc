ScriptName Fragments:Quests:QF_OE_MP_AcelesDropoff_000478A2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TerrorMorph Auto Const mandatory
ReferenceAlias Property Alias_Aceles Auto Const mandatory
ReferenceAlias Property Alias_Vanguard Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Keyword Property LocTypeOE_ThemeNaturalKeyword Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
LeveledItem Property LL_Ammo Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Large Auto Const mandatory
LeveledItem Property LL_Weapon_Ranged_Marine Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory
ReferenceAlias Property Alias_RewardKey Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Location Loc = Alias_OE_Location.GetLocation()
  ObjectReference reward = Alias_RewardContainer.GetRef()
  Alias_MapMarker.TryToEnable()
  If Loc.HasKeyword(LocTypeOE_ThemeNaturalKeyword)
    Self.SetStage(10)
  ElseIf reward.HasKeyword(LocTypeOE_ThemeNaturalKeyword)
    Self.SetStage(10)
  Else
    Self.SetStage(5)
  EndIf
  Self.SetStage(25)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_RewardContainer.GetRef().Lock(True, False, True)
  If Alias_RewardKey.GetRef()
    Alias_RewardContainer.GetRef().SetLockLevel(255)
  Else
    Alias_RewardContainer.GetRef().SetLockLevel(75)
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_RewardContainer.GetRef().Lock(False, False, True)
  Alias_RewardKey.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_TerrorMorph.GetActorRef().EvaluatePackage(False)
  Alias_TerrorMorph.GetRef().Disable(False)
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Aceles.GetRef().Enable(False)
  Alias_Vanguard.GetRef().Enable(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Alias_Vanguard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Vanguard.GetActorRef().EvaluatePackage(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().AddItem(LL_Weapon_Ranged_Marine as Form, 1, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280)
    Self.SetStage(285)
  EndIf
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280)
    Self.SetStage(285)
  EndIf
EndFunction

Function Fragment_Stage_0280_Item_00()
  If Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280)
    Self.SetStage(285)
  EndIf
EndFunction

Function Fragment_Stage_0285_Item_00()
  Self.SetStage(290)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_TerrorMorph.GetRef().Enable(False)
  Alias_TerrorMorph.GetActorRef().EvaluatePackage(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Alias_Vanguard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(300, True)
  If !Self.GetStageDone(700)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  If !Self.GetStageDone(700)
    Self.SetObjectiveDisplayed(500, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(980)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(980)
EndFunction

Function Fragment_Stage_0970_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Large as Form, 1, False)
EndFunction

Function Fragment_Stage_0975_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits as Form, 1, False)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If !Self.GetStageDone(700)
    Self.SetStage(995)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
