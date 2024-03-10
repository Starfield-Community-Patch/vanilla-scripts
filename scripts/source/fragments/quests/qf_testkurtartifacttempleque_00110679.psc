ScriptName Fragments:Quests:QF_TestKurtArtifactTempleQue_00110679 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.setobjectivedisplayed(10, True, False)
  Alias_AnomalyMapMarker.GetRef().SetRequiresScanning(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.setobjectivecompleted(10, True)
  Self.setobjectivedisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.setobjectivecompleted(20, True)
  Self.setobjectivedisplayed(30, True, False)
  Game.GetPlayer().WaitFor3DLoad()
  Utility.Wait(0.25)
  MQ_TempleTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.setobjectivecompleted(30, True)
  Self.setobjectivedisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.CompleteAllObjectives()
EndFunction
