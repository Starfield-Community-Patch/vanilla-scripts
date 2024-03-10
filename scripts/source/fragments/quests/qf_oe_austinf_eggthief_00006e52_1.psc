ScriptName Fragments:Quests:QF_OE_AustinF_EggThief_00006E52_1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PredatorA Auto Const mandatory
ReferenceAlias Property Alias_PredatorB Auto Const mandatory
ReferenceAlias Property Alias_PredatorC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_PredatorA.GetRef().Enable(False)
  Alias_PredatorB.GetRef().Enable(False)
  Alias_PredatorC.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop()
EndFunction
