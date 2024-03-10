ScriptName Fragments:Quests:QF_OE_MP_Creatures06_00067FBC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nest Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
LeveledItem Property StandardLoot Auto Const mandatory
ReferenceAlias Property Alias_Attacker Auto Const mandatory
MiscObject Property Creature_Egg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0500_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Attacker = Alias_Attacker.GetActorRef()
  Attacker.Enable(False)
  Attacker.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.GetStageDone(500)
    Alias_Nest.GetRef().AddItem(StandardLoot as Form, 1, False)
  ElseIf Utility.RandomInt(1, 2) == 1
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False)
  Else
    Alias_Nest.GetRef().AddItem(Creature_Egg as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
