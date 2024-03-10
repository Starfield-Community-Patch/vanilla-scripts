ScriptName Fragments:Quests:QF_OE_MP_Creatures07_00067FAB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property StandardLoot Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
Keyword Property FleePackageActivated Auto Const mandatory
ReferenceAlias Property Alias_Attacker Auto Const mandatory
RefCollectionAlias Property Alias_Defenders Auto Const mandatory
MiscObject Property Creature_Egg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_Defenders.EvaluateAll()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Attacker.GetActorRef().Enable(False)
  Alias_Attacker.GetActorRef().EvaluatePackage(False)
  Alias_Defenders.EvaluateAll()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Defenders.EvaluateAll()
  If !Self.GetStageDone(500)
    Self.SetStage(400)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Utility.RandomInt(1, 2) == 1
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False)
  Else
    Alias_Nest.GetRef().AddItem(Creature_Egg as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  If !Self.GetStageDone(200)
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0950_Item_00()
  Alias_Attacker.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
