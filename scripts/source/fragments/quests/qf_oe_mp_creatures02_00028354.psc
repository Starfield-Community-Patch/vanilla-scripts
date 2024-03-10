ScriptName Fragments:Quests:QF_OE_MP_Creatures02_00028354 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nest Auto Const mandatory
ReferenceAlias Property Alias_Attacker Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetStage(450)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Actor Attacker = Alias_Attacker.GetActorRef()
  Attacker.Enable(False)
  Attacker.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(450)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
