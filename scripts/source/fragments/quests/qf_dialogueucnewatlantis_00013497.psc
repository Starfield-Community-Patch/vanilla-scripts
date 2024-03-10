ScriptName Fragments:Quests:QF_DialogueUCNewAtlantis_00013497 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RAD03 Auto Const mandatory
ReferenceAlias Property Alias_ZoeKaminski Auto Const mandatory
Quest Property DialogueUCFactionNewAtlantis Auto Const
ObjectReference Property PlayerHouseDoor Auto Const
ObjectReference Property PenthouseDoor Auto Const
ReferenceAlias Property PlayerPenthouseDoor Auto Const
ReferenceAlias Property Alias_ZoraSangweni Auto Const
GlobalVariable Property PlayerHouse_NA_WellCost Auto Const mandatory
GlobalVariable Property PlayerHouse_NA_HomeCost Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Key Property CityNewAtlantisWellApartmentKey Auto Const mandatory
Quest Property UC_NA_Home_Penthouse_Misc Auto Const mandatory
Quest Property UC_NA_Home_Well_Misc Auto Const mandatory
Key Property CityNewAtlantisPenthouseKey Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
ReferenceAlias Property Alias_WellApartmentActivator Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0034_Item_00()
  Game.GetPlayer().MoveTo(Alias_ZoeKaminski.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0341_Item_00()
  RAD03.Start()
EndFunction

Function Fragment_Stage_0360_Item_00()
  If DialogueUCFactionNewAtlantis.GetStageDone(525) == True
    DialogueUCFactionNewAtlantis.SetStage(700)
  EndIf
EndFunction

Function Fragment_Stage_0363_Item_00()
  Self.SetStage(360)
EndFunction

Function Fragment_Stage_0364_Item_00()
  PlayerHouseSystem.PurchaseHouse(PlayerHouse_NA_WellCost, CityNewAtlantisWellApartmentKey)
  Alias_WellApartmentActivator.GetRef().Enable(False)
  UC_NA_Home_Well_Misc.Start()
EndFunction

Function Fragment_Stage_0365_Item_00()
  PlayerHouseSystem.PurchaseHouse(None, CityNewAtlantisPenthouseKey)
  DialogueUCFactionNewAtlantis.SetStage(700)
  If Self.GetStageDone(360) == False
    Self.SetStage(360)
    Self.SetStage(362)
  EndIf
  UC_NA_Home_Penthouse_Misc.Start()
EndFunction

Function Fragment_Stage_0366_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, PlayerHouse_NA_HomeCost.GetValue() as Int, False, None)
EndFunction
