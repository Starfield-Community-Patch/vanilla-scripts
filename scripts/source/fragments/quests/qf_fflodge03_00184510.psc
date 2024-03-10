ScriptName Fragments:Quests:QF_FFLodge03_00184510 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Matteo Auto Const mandatory
ReferenceAlias Property Alias_Sam Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Alias_Sam.GetActorReference().EvaluatePackage(False)
  Alias_Matteo.GetActorReference().EvaluatePackage(False)
  Self.Stop()
EndFunction
