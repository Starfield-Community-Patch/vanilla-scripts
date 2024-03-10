ScriptName Fragments:Quests:QF_City_NA_Viewport01_002926D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Maguffin Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Door Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
ReferenceAlias Property Alias_Keycard01 Auto Const mandatory
Quest Property City_NA_GuardPointer_Viewport Auto Const mandatory
ReferenceAlias Property Alias_EminMacar Auto Const mandatory
ReferenceAlias Property Alias_Keycard02 Auto Const mandatory
Faction Property UCSecurityFaction Auto Const mandatory
Potion Property SupernovaDrink Auto Const mandatory
ObjectReference Property vendorContainerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1500_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Door.GetReference().lock(True, False, True)
  Alias_Door.GetReference().SetOpen(False)
  Alias_EminMacar.GetReference().Enable(False)
  Alias_Keycard02.getref().SetFactionOwner(UCSecurityFaction, False)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.IsObjectivedisplayed(20)
    Self.SetObjectiveCompleted(20, True)
  EndIf
  Self.SetObjectiveDisplayed(50, True, False)
  City_NA_GuardPointer_Viewport.SetStage(200)
  Alias_EminMacar.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_EminMacar.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Door.GetReference().lock(False, False, True)
  Alias_Door.GetReference().SetOpen(True)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().Additem(Alias_Keycard01.GetReference() as Form, 1, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Maguffin.GetReference() as Form, 1, False, None)
  Self.CompleteAllObjectives()
  Alias_EminMacar.GetReference().Disable(False)
  vendorContainerRef.Additem(SupernovaDrink as Form, 5, False)
  If MQ105.GetStageDone(2000)
    Self.SetStage(1500)
  EndIf
EndFunction

Function Fragment_Stage_2000_Item_00()
  City_NA_Viewport02.Start()
  Self.Stop()
EndFunction
