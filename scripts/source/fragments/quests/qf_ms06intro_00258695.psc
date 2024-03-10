ScriptName Fragments:Quests:QF_MS06Intro_00258695 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS06 Auto Const mandatory
Scene Property MS06Intro_Jiro_BeaconMessage_Scene Auto Const
GlobalVariable Property MS06ECSConstantHailed Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantShip Auto Const mandatory
Message Property MS06_UnidentifiedShipNameMSG Auto Const mandatory
Message Property MS06_ParadisoOrbitNameMSG Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_ECSConstantShip.GetRef().SetOverrideName(MS06_UnidentifiedShipNameMSG)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MS06Intro_Jiro_BeaconMessage_Scene.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  MS06.Start()
  If Self.GetStageDone(400)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  MS06ECSConstantHailed.SetValue(1.0)
  MS06.SetStage(300)
  If Self.GetStageDone(200)
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
