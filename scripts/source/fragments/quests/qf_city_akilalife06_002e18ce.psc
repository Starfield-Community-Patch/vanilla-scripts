ScriptName Fragments:Quests:QF_City_AkilaLife06_002E18CE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property AkilaLife06_SecretMessage Auto Const mandatory
ReferenceAlias Property Alias_Message Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Game.GetPlayer().AddAliasedItem(AkilaLife06_SecretMessage as Form, Alias_Message as Alias, 1, False)
EndFunction

Function Fragment_Stage_0175_Item_00()
  Game.GetPlayer().RemoveItem(AkilaLife06_SecretMessage as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
