ScriptName Fragments:Quests:QF_City_Akila_Ashta01_0021625F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PlayerStartMarker Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static01 Auto Const mandatory
ReferenceAlias Property Alias_Sensor01 Auto Const mandatory
ReferenceAlias Property Alias_Sensor02 Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static02 Auto Const mandatory
ReferenceAlias Property Alias_Sensor03 Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static03 Auto Const mandatory
ReferenceAlias Property Alias_Sensor04 Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static04 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator01 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator02 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator03 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator04 Auto Const mandatory
ReferenceAlias Property Alias_Keoni Auto Const mandatory
Quest Property City_Akila_Ashta02 Auto Const mandatory
ReferenceAlias Property Alias_TowerGuard Auto Const mandatory
Scene Property City_Akila01_Scene01_StartScene Auto Const mandatory
ObjectReference Property City_Akila01_KeoniStartMarker Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_Keoni.GetActorRef()
  aTarg.Enable(False)
  aTarg.MoveTo(City_Akila01_KeoniStartMarker, 0.0, 0.0, 0.0, True, False)
  DialogueFCAkilaCity.SetStage(2015)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetObjectiveDisplayed(8, True, False)
  City_Akila01_Scene01_StartScene.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(8, True)
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_Keoni.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(25, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveCompleted(20, True)
  EndIf
  If Self.IsObjectiveDisplayed(25)
    Self.SetObjectiveCompleted(25, True)
  EndIf
  Self.SetObjectiveDisplayed(30, True, False)
  Game.GetPlayer().AddItem(Alias_Sensor01.GetReference() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Sensor02.GetReference() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Sensor03.GetReference() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Sensor04.GetReference() as Form, 1, False)
  Alias_SensorActivator01.GetReference().Enable(False)
  Alias_SensorActivator02.GetReference().Enable(False)
  Alias_SensorActivator03.GetReference().Enable(False)
  Alias_SensorActivator04.GetReference().Enable(False)
  If Self.GetStageDone(20) == False
    Game.GetPlayer().MoveTo(Alias_Sensor_Static01.GetReference(), 0.0, 0.0, 0.0, True, False)
  EndIf
  Alias_Keoni.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0031_Item_00()
  Alias_Sensor_Static01.GetReference().Enable(False)
  Game.GetPlayer().RemoveItem(Alias_Sensor01.GetReference() as Form, 1, False, None)
  If Self.GetStageDone(34) && Self.GetStageDone(32) && Self.GetStageDone(33)
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0032_Item_00()
  Alias_Sensor_Static02.GetReference().Enable(False)
  Game.GetPlayer().RemoveItem(Alias_Sensor02.GetReference() as Form, 1, False, None)
  If Self.GetStageDone(31) && Self.GetStageDone(34) && Self.GetStageDone(33)
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0033_Item_00()
  Alias_Sensor_Static03.GetReference().Enable(False)
  Game.GetPlayer().RemoveItem(Alias_Sensor03.GetReference() as Form, 1, False, None)
  If Self.GetStageDone(31) && Self.GetStageDone(32) && Self.GetStageDone(34)
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0034_Item_00()
  Alias_Sensor_Static04.GetReference().Enable(False)
  Game.GetPlayer().RemoveItem(Alias_Sensor04.GetReference() as Form, 1, False, None)
  If Self.GetStageDone(31) && Self.GetStageDone(32) && Self.GetStageDone(33)
    Self.SetStage(40)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Self.SetObjectiveDisplayed(55, True, False)
  Alias_Keoni.GetActorReference().EvaluatePackage(False)
  Alias_TowerGuard.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0059_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetStage(65)
EndFunction

Function Fragment_Stage_0065_Item_00()
  If !Self.IsObjectiveDisplayed(55)
    Self.SetObjectiveCompleted(55, False)
  EndIf
  Alias_TowerGuard.GetActorReference().EvaluatePackage(False)
  Alias_Keoni.GetActorReference().EvaluatePackage(False)
  Utility.wait(5.0)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(55, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(70, True, False)
  Alias_Keoni.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  City_Akila_Ashta02.SetStage(10)
  City_Akila_Ashta02.SetActive(True)
  Self.Stop()
EndFunction
