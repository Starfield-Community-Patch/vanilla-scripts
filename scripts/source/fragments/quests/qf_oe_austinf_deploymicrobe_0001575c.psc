ScriptName Fragments:Quests:QF_OE_AustinF_DeployMicrobe_0001575C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_VanguardNPC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_VanguardNPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_VanguardNPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
