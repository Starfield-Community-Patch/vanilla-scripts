ScriptName Fragments:Quests:QF_OE_AustinF_DyingWish_000FC908 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC Auto Const mandatory
Spell Property AbilityDamageHealthSlow Auto Const
LeveledItem Property LL_Food_Homemade Auto Const mandatory
Potion Property FriedPickles Auto Const mandatory
Potion Property Kiffles Auto Const mandatory
Potion Property Pierogis Auto Const mandatory
Potion Property Gazpacho Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int Request = Utility.RandomInt(1, 3)
  If Request == 1
    Self.SetStage(110)
  ElseIf Request == 2
    Self.SetStage(120)
  Else
    Self.SetStage(130)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().RemoveItem(FriedPickles as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(Kiffles as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0235_Item_00()
  Game.GetPlayer().RemoveItem(Pierogis as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0245_Item_00()
  Game.GetPlayer().RemoveItem(Gazpacho as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Actor NPC = Alias_NPC.GetActorRef()
  NPC.EvaluatePackage(False)
  NPC.SetUnconscious(True)
  Alias_NPC.GetActorRef().AddSpell(AbilityDamageHealthSlow, True)
  Utility.Wait(2.5)
  Self.SetStage(450)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor NPC = Alias_NPC.GetActorRef()
  NPC.Kill(None)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Actor NPC = Alias_NPC.GetActorRef()
  If Self.GetStageDone(225)
    NPC.AddItem(FriedPickles as Form, 1, False)
  ElseIf Self.GetStageDone(230)
    NPC.AddItem(Kiffles as Form, 1, False)
  Else
    NPC.AddItem(Pierogis as Form, 1, False)
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
