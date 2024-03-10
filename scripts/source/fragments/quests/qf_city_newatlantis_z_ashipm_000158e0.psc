ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_AShipm_000158E0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Package Auto Const mandatory
ReferenceAlias Property Alias_SalinasDoor Auto Const mandatory
ReferenceAlias Property Alias_Salinas Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_Package.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Package.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Salinas.GetActorRef().EvaluatePackage(False)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
