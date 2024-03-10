ScriptName Fragments:Quests:QF_OE_AustinF_DeadManBox02_000626FF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory
ReferenceAlias Property Alias_KeyObject Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory
ReferenceAlias Property Alias_BiomePredator Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_RewardContainer.Getref().Lock(True, False, True)
  Alias_RewardContainer.Getref().SetLockLevel(255)
  Alias_Corpse.Getref().AddItem(Alias_KeyObject.Getref() as Form, 1, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Creature = None
  If Alias_BiomePredator
    Creature = Alias_BiomePredator.GetActorRef()
    Creature.Enable(False)
    Creature.EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
