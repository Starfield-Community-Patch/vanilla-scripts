ScriptName Fragments:Quests:QF_OE_MP_Creatures03_00067FA3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property OE_PlayerInRange_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
ReferenceAlias Property Alias_Ambusher Auto Const mandatory
LeveledItem Property CommonLoot Auto Const mandatory
LeveledItem Property UncommonLoot Auto Const mandatory
LeveledItem Property RareLoot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  Actor Ambusher = Alias_Ambusher.GetActorRef()
  Ambusher.Enable(False)
  Ambusher.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
