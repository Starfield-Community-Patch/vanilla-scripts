ScriptName Fragments:Quests:QF_OE_AustinF_DeadManBox_00062700 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory
ReferenceAlias Property Alias_StashContainer Auto Const mandatory
ReferenceAlias Property Alias_KeyObject Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ObjectReference RewardKey = Alias_KeyObject.GetRef()
  ObjectReference CorpseInventory = Alias_Corpse.GetRef()
  CorpseInventory.AddItem(RewardKey as Form, 1, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_StashContainer.GetRef().Lock(True, False, True)
  Alias_StashContainer.GetRef().SetLockLevel(75)
  Alias_StashContainer.GetRef().MoveTo(Alias_StashContainer.GetRef(), 0.0, 0.0, -0.200000003, True, False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
