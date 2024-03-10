ScriptName Fragments:Quests:QF_TraitWanted_000EA113 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property TRAIT_Wanted Auto Const mandatory
GlobalVariable Property Trait_WantedPerkRemovalCost Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Minister Auto Const mandatory
Book Property Trait_Wanted_DataSlate02 Auto Const mandatory
ReferenceAlias Property Alias_MinisterGuard Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_WantedPerkRemovalCost.GetValueInt(), False, None)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_Minister.GetRef().EnableNoWait(False)
  Alias_MinisterGuard.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Game.GetPlayer().RemoveItem(Trait_Wanted_DataSlate02 as Form, 1, False, None)
  Alias_Minister.GetRef().DisableNoWait(False)
  Alias_MinisterGuard.GetRef().DisableNoWait(False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_Wanted)
EndFunction
