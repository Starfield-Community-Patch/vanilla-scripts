ScriptName Fragments:Quests:QF_OE_MP_Creatures05_00067FD0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AttackerA1 Auto Const mandatory
ReferenceAlias Property Alias_AttackerA3 Auto Const mandatory
ReferenceAlias Property Alias_AttackerB1 Auto Const mandatory
ReferenceAlias Property Alias_AttackerB3 Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory
MiscObject Property Creature_Egg Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  defaultgroupspawnquestscript kmyQuest = __temp as defaultgroupspawnquestscript
  Int Chance = Utility.RandomInt(1, 4)
  If Chance == 4
    Alias_Corpse.GetRef().AddItem(BonusLoot as Form, 1, False)
  ElseIf Chance == 3
    Alias_Corpse.GetRef().AddItem(Creature_Egg as Form, 1, False)
  ElseIf Chance == 2
    Alias_Nest.GetRef().AddItem(Creature_Egg as Form, 1, False)
  Else
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor AttackerA1 = Alias_AttackerA1.GetActorRef()
  Actor AttackerA3 = Alias_AttackerA3.GetActorRef()
  AttackerA1.Enable(False)
  AttackerA3.Enable(False)
  AttackerA1.EvaluatePackage(False)
  AttackerA3.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor AttackerB1 = Alias_AttackerB1.GetActorRef()
  Actor AttackerB3 = Alias_AttackerB3.GetActorRef()
  AttackerB1.Enable(False)
  AttackerB3.Enable(False)
  AttackerB1.EvaluatePackage(False)
  AttackerB3.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  If !Self.GetStageDone(300)
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  If !Self.GetStageDone(300)
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
