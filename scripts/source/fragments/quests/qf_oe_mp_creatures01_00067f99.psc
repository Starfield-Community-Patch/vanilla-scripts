ScriptName Fragments:Quests:QF_OE_MP_Creatures01_00067F99 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Attacker Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
LeveledItem Property StandardLoot Auto Const mandatory
ReferenceAlias Property Alias_Defender Auto Const mandatory
ReferenceAlias Property Alias_Backup Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_Nest.GetRef().AddItem(StandardLoot as Form, 1, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Backup = Alias_Backup.GetActorRef()
  Actor Attacker = Alias_Attacker.GetActorRef()
  Actor Defender = Alias_Defender.GetActorRef()
  Attacker.StartCombat(Defender as ObjectReference, False)
  Defender.StartCombat(Attacker as ObjectReference, False)
  Attacker.EvaluatePackage(False)
  Defender.EvaluatePackage(False)
  Backup.Enable(False)
  Backup.EvaluatePackage(False)
  Backup.StartCombat(Attacker as ObjectReference, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  If !Self.GetStageDone(300)
    Alias_Attacker.GetRef().AddItem(StandardLoot as Form, 1, False)
  EndIf
  If !Self.GetStageDone(500)
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False)
  EndIf
EndFunction
