ScriptName Fragments:Quests:QF_SE_Player_FAB15_00057FE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_FAB15_100_MantisRecognized Auto Const mandatory
ReferenceAlias Property Alias_Spacer01 Auto Const mandatory
ReferenceAlias Property Alias_Spacer02 Auto Const mandatory
ReferenceAlias Property Alias_Spacer03 Auto Const mandatory
ReferenceAlias Property Alias_Merchant Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(5.0)
  SE_FAB15_100_MantisRecognized.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  spaceshipreference srTarg = Alias_Spacer01.GetRef() as spaceshipreference
  srTarg.AddToFaction(CaptiveFaction)
  srTarg.StopCombat()
  srTarg = Alias_Spacer02.GetRef() as spaceshipreference
  srTarg.AddToFaction(CaptiveFaction)
  srTarg.StopCombat()
  srTarg = Alias_Spacer03.GetRef() as spaceshipreference
  srTarg.AddToFaction(CaptiveFaction)
  srTarg.StopCombat()
  srTarg = Alias_Merchant.GetRef() as spaceshipreference
  srTarg.AddToFaction(CaptiveFaction)
  srTarg.StopCombat()
  srTarg.SetEssential(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference srTarg = Alias_Spacer01.GetRef() as spaceshipreference
  srTarg.DisableWithGravJumpNoWait()
  Utility.Wait(1.0)
  srTarg = Alias_Spacer02.GetRef() as spaceshipreference
  srTarg.DisableWithGravJumpNoWait()
  Utility.Wait(1.0)
  srTarg = Alias_Spacer03.GetRef() as spaceshipreference
  srTarg.DisableWithGravJumpNoWait()
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference srTarg = Alias_Merchant.GetRef() as spaceshipreference
  srTarg.DisableWithGravJumpNoWait()
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 300, False)
EndFunction
