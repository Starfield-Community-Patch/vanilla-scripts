ScriptName Fragments:Quests:QF_FFKeyZ02_001B6246 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MedicalSupplies_Container Auto Const mandatory
ReferenceAlias Property Alias_SupplyStorageKey Auto Const mandatory
MiscObject Property FFKeyZ02_MedicalSupplies Auto Const mandatory
ReferenceAlias Property Alias_SaminaStartMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_GennadyStartMarker Auto Const mandatory
ReferenceAlias Property Alias_SuppliesStartMarker Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ReferenceAlias Property Alias_CFSD01Evidence Auto Const mandatory
ReferenceAlias Property Alias_TheClinicMapMarker Auto Const mandatory
ActorBase Property Gennady Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1)
  Game.GetPlayer().MoveTo(Alias_SaminaStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1)
  DialogueCFTheKey.SetStage(800)
  Game.GetPlayer().MoveTo(Alias_GennadyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(1)
  DialogueCFTheKey.SetStage(800)
  Game.GetPlayer().MoveTo(Alias_SuppliesStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0003_Item_00()
  CF_Main.SetStage(1)
  DialogueCFTheKey.SetStage(800)
  Game.GetPlayer().MoveTo(Alias_SaminaStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveFailed(100, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_TheClinicMapMarker.GetRef().AddToMapScanned(False)
  Alias_TheClinicMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
  Alias_MedicalSupplies_Container.GetRef().Lock(True, False, True)
  Alias_CFSD01Evidence.TryToEnable()
  Gennady.SetEssential(False)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Game.GetPlayer().AddItem(Alias_SupplyStorageKey.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  If !Self.GetStageDone(155)
    Game.GetPlayer().AddItem(Alias_SupplyStorageKey.GetRef() as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(100)
    Self.SetObjectiveDisplayed(100, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(200)
    Self.SetObjectiveCompleted(200, True)
  EndIf
  Self.SetObjectiveSkipped(50)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(FFKeyZ02_MedicalSupplies as Form, 1, False, None)
  Utility.Wait(5.0)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.Stop()
EndFunction
