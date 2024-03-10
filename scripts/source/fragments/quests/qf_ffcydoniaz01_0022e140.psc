ScriptName Fragments:Quests:QF_FFCydoniaZ01_0022E140 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship Auto Const mandatory
ReferenceAlias Property Alias_Denis Auto Const mandatory
Scene Property FFCydoniaZ01_0201_Companion_Leech Auto Const mandatory
ActorValue Property FFCydoniaZ01_Foreknowledge_AV Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
RefCollectionAlias Property Alias_RefsToEnable Auto Const mandatory
ReferenceAlias Property Alias_DeadLeech Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_MapMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Denis.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  ObjectReference myLeech = Alias_DeadLeech.GetRef()
  myLeech.Enable(False)
  (myLeech as Actor).Kill(None)
  Alias_Ship.GetRef().Enable(False)
  Alias_RefsToEnable.EnableAll(False)
  Alias_MapMarker.GetRef().Enable(False)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0201_Item_00()
  FFCydoniaZ01_0201_Companion_Leech.Start()
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0251_Item_00()
  Self.SetObjectiveCompleted(200, True)
  If Self.GetStageDone(252)
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0252_Item_00()
  Self.SetObjectiveCompleted(250, True)
  If Self.GetStageDone(251)
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().SetValue(FFCydoniaZ01_Foreknowledge_AV, 1.0)
  Self.Stop()
EndFunction
