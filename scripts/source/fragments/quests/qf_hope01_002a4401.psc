ScriptName Fragments:Quests:QF_Hope01_002A4401 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MrSood Auto Const mandatory
Message Property TestHope01_200 Auto Const mandatory
ReferenceAlias Property Alias_MrSoodPackage Auto Const mandatory
MiscObject Property Hope01SoodPackage Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Message Property HelpSmuggling Auto Const mandatory
ReferenceAlias Property Alias_Chest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_MrSood.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
  Game.GetPlayer().AddAliasedItem(Hope01SoodPackage as Form, Alias_MrSoodPackage as Alias, 1, True)
  HelpSmuggling.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(Alias_MrSoodPackage.GetRef() as Form, 1, False, None)
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False)
  Self.SetObjectiveCompleted(200, True)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Game.GetPlayer().RemoveItem(Alias_MrSoodPackage.GetRef() as Form, 1, False, None)
  Alias_playerShip.GetRef().RemoveItem(Alias_MrSoodPackage.GetRef() as Form, 1, False, None)
  Alias_MrSood.GetRef().Disable(False)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_8900_Item_00()
  Alias_Chest.GetRef().AddItem(Alias_MrSoodPackage.GetRef() as Form, 1, False)
  Self.FailAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
