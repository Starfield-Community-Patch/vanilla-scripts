ScriptName Fragments:Quests:QF_OE_AustinF_FuelAssault_0001575A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Attackers Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
RefCollectionAlias Property Alias_Defenders Auto Const mandatory
ReferenceAlias Property Alias_DefenderLeader Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_Attackers.EnableAll(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(250)
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.GetStageDone(200)
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.GetStageDone(200) && Self.GetStageDone(250)
    Self.SetStage(999)
  Else
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(360) || Self.GetStageDone(370) || Self.GetStageDone(380)
    Self.SetStage(390)
  EndIf
EndFunction

Function Fragment_Stage_0360_Item_00()
  If Self.GetStageDone(350) || Self.GetStageDone(370) || Self.GetStageDone(380)
    Self.SetStage(390)
  EndIf
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(350) || Self.GetStageDone(360) || Self.GetStageDone(380)
    Self.SetStage(390)
  EndIf
EndFunction

Function Fragment_Stage_0380_Item_00()
  If Self.GetStageDone(350) || Self.GetStageDone(360) || Self.GetStageDone(370)
    Self.SetStage(390)
  EndIf
EndFunction

Function Fragment_Stage_0390_Item_00()
  Alias_Defenders.AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Alias_DefenderLeader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0910_Item_00()
  Alias_DefenderLeader.GetActorRef().EvaluatePackage(False)
  Alias_Defenders.EvaluateAll()
EndFunction

Function Fragment_Stage_0950_Item_00()
  Alias_DefenderLeader.GetActorRef().EvaluatePackage(False)
  Alias_Defenders.EvaluateAll()
  Self.SetStage(999)
EndFunction
