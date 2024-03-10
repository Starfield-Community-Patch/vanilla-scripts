ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_GemJea_000C55B0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guillaume Auto Const mandatory
ReferenceAlias Property Alias_George Auto Const mandatory
ReferenceAlias Property Alias_Gem Auto Const mandatory
ReferenceAlias Property Alias_Plate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_Guillaume.GetActorRef().RemoveItem(Alias_Plate.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Plate.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
