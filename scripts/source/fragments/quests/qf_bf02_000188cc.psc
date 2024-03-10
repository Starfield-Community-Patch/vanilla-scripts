ScriptName Fragments:Quests:QF_BF02_000188CC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BF02ContainerSceneIntro Auto Const mandatory
Message Property BF02_Stage10Temp_Message Auto Const mandatory
ObjectReference Property BF02PlayerSceneStartMarker Auto Const mandatory
Scene Property BF02ContainerSceneFollowUp Auto Const mandatory
ReferenceAlias Property Alias_BF02MathisAlias Auto Const mandatory
Message Property BF02_Stage130Temp_Message Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0080_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(BF02PlayerSceneStartMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  BF02_Stage10Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  BF02ContainerSceneIntro.Start()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  BF02ContainerSceneFollowUp.Start()
EndFunction

Function Fragment_Stage_0090_Item_00()
  Alias_BF02MathisAlias.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Alias_BF02MathisAlias.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
  BF02_Stage130Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.SetStage(255)
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
