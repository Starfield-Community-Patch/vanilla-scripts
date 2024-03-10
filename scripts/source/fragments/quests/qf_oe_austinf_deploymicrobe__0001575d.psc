ScriptName Fragments:Quests:QF_OE_AustinF_DeployMicrobe__0001575D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Vanguard Auto Const mandatory
Faction Property HostileFaction Auto Const
RefCollectionAlias Property Settlers Auto Const mandatory
ReferenceAlias Property SettlerLeader Auto Const mandatory
Scene Property IntroScene Auto Const
ReferenceAlias Property Alias_Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  IntroScene.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Vanguard.GetActorRef().EvaluatePackage(False)
  SettlerLeader.GetActorRef().EvaluatePackage(False)
  Settlers.EvaluateAll()
  If !Self.GetStageDone(50)
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  IntroScene.Stop()
  Vanguard.GetActorRef().EvaluatePackage(False)
  SettlerLeader.GetActorRef().EvaluatePackage(False)
  Settlers.EvaluateAll()
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(250, True, False)
  Vanguard.GetActorRef().EvaluatePackage(False)
  SettlerLeader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Int level = Game.GetPlayer().GetLevel()
  Int chance = 0
  If level > 100
    level = 99
  EndIf
  If Utility.RandomInt(0, 1) == 0
    If Utility.RandomInt(0, 100) < level
      Self.SetStage(510)
    EndIf
  EndIf
  If !Self.GetStageDone(510)
    Self.SetStage(520)
  EndIf
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Vanguard.GetActorRef().EvaluatePackage(False)
  SettlerLeader.GetActorRef().EvaluatePackage(False)
  Settlers.EvaluateAll()
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
