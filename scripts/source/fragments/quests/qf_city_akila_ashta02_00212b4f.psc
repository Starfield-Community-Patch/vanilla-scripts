ScriptName Fragments:Quests:QF_City_Akila_Ashta02_00212B4F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Davis Auto Const mandatory
ReferenceAlias Property Alias_Keoni Auto Const mandatory
ReferenceAlias Property Alias_Bailey Auto Const mandatory
ReferenceAlias Property Alias_PlayerStartMarker Auto Const mandatory
ReferenceAlias Property Alias_Creature01 Auto Const mandatory
ReferenceAlias Property Alias_Creature02 Auto Const mandatory
ReferenceAlias Property Alias_Creature03 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_DeadRobot Auto Const mandatory
Quest Property City_Akila_Ashta01 Auto Const mandatory
Quest Property City_Akila_Ashta03 Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
ReferenceAlias Property Alias_AmbushTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_Akila_Ashta01.Stop()
  Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_Keoni.GetActorRef()
  aTarg.Enable(False)
  If Self.GetStageDone(0)
    Alias_Keoni.GetReference().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  EndIf
  DialogueFCAkilaCity.SetStage(2015)
  Self.SetStage(5)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Keoni.GetActorReference().EvaluatePackage(False)
  Alias_Davis.GetActorReference().EvaluatePackage(False)
  Alias_Bailey.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  city_akila_ashta02_script kmyQuest = __temp as city_akila_ashta02_script
  Self.SetObjectiveDisplayed(10, True, False)
  kmyQuest.Wait24()
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(15, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(15, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_Davis.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(35, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Alias_Davis.GetActorReference().EvaluatePackage(False)
  Alias_DeadRobot.GetRef().Enable(False)
  Alias_DeadRobot.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Davis.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Davis.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetStage(80)
EndFunction

Function Fragment_Stage_0080_Item_00()
  (Alias_AmbushTrigger.GetRef() as defaultrefambushtrigger2).TriggerAmbush()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0081_Item_00()
  If Self.GetStageDone(82) && Self.GetStageDone(83)
    Self.SetStage(85)
  EndIf
EndFunction

Function Fragment_Stage_0082_Item_00()
  If Self.GetStageDone(81) && Self.GetStageDone(83)
    Self.SetStage(85)
  EndIf
EndFunction

Function Fragment_Stage_0083_Item_00()
  If Self.GetStageDone(81) && Self.GetStageDone(82)
    Self.SetStage(85)
  EndIf
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(85, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(85, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0121_Item_00()
  Self.SetStage(120)
  Game.GetPlayer().AddItem(Credits as Form, 275, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  City_Akila_Ashta03.SetStage(5)
  City_Akila_Ashta03.SetActive(True)
  Self.Stop()
EndFunction
