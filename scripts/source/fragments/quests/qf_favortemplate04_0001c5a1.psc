ScriptName Fragments:Quests:QF_FavorTemplate04_0001C5A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AmbushEncounter Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Scene Property FavorTemplate04_002_Ambush Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False
    Self.SetObjectiveDisplayed(10, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True
    Self.SetObjectiveCompleted(10, True)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
  Alias_AmbushEncounter.EnableAll(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  FavorTemplate04_002_Ambush.Start()
  If Self.GetStageDone(10) == True
    Self.SetObjectiveDisplayed(20, False, False)
    Self.SetObjectiveDisplayed(30, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_AmbushEncounter.SetValue(Aggression, 2.0)
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(160)
EndFunction

Function Fragment_Stage_0160_Item_00()
  If Self.GetStageDone(10) == True
    Self.SetObjectiveCompleted(30, True)
    Self.SetObjectiveDisplayed(20, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_AmbushEncounter.SetValue(Aggression, 2.0)
EndFunction
