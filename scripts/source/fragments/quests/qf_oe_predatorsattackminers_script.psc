ScriptName Fragments:Quests:QF_OE_PredatorsAttackMiners_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_PredatorGroup Auto Const mandatory
ReferenceAlias Property Alias_Miner Auto Const mandatory
ReferenceAlias Property Alias_WoundedMiner Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_Miner.GetActorRef().EvaluatePackage(False)
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Miner.GetActorRef().EvaluatePackage(False)
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(600)
  Alias_Miner.GetActorRef().EvaluatePackage(False)
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Alias_PredatorGroup.EnableAll(False)
  Alias_PredatorGroup.EvaluateAll()
  If Self.GetStageDone(300)
    Self.SetObjectiveDisplayed(600, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Alias_Miner.GetActorRef().EvaluatePackage(False)
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False)
  If !Self.GetStageDone(800)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.GetStageDone(600)
    Self.SetStage(600)
  EndIf
  If !Self.GetStageDone(990)
    Self.SetStage(980)
  EndIf
EndFunction

Function Fragment_Stage_0825_Item_00()
  If Self.IsObjectiveDisplayed(800)
    Self.SetObjectiveSkipped(800)
    Self.SetObjectiveDisplayed(825, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  If !Self.GetStageDone(600)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(300)
    Self.SetObjectiveDisplayed(900, True, False)
  Else
    Self.SetStage(990)
  EndIf
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
