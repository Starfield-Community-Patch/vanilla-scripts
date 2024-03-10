ScriptName Fragments:Quests:QF_OE_MP_Creatures04_00067FAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Attacker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Attacker = Alias_Attacker.GetActorRef()
  Attacker.Enable(False)
  Attacker.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0325_Item_00()
  If Self.GetStageDone(350)
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(325)
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
