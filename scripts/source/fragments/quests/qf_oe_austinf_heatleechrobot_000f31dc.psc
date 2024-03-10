ScriptName Fragments:Quests:QF_OE_AustinF_HeatLeechRobot_000F31DC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HeatLeech_A1 Auto Const mandatory
ReferenceAlias Property Alias_HeatLeech_A3 Auto Const mandatory
ReferenceAlias Property Alias_HeatLeech_B1 Auto Const mandatory
ReferenceAlias Property Alias_HeatLeech_B3 Auto Const mandatory
ReferenceAlias Property Alias_Robot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Robot.GetActorRef().SetUnconscious(True)
  Alias_HeatLeech_A1.GetActorRef().Disable(False)
  Alias_HeatLeech_A3.GetActorRef().Disable(False)
  Alias_HeatLeech_B1.GetActorRef().Disable(False)
  Alias_HeatLeech_B3.GetActorRef().Disable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Robot.GetActorRef().SetUnconscious(True)
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Utility.RandomInt(0, 100) < Game.GetPlayer().GetLevel()
    Alias_HeatLeech_A1.GetActorRef().Enable(False)
  EndIf
  If Utility.RandomInt(0, 100) < Game.GetPlayer().GetLevel()
    Alias_HeatLeech_B1.GetActorRef().Enable(False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Robot.GetActorRef().SetUnconscious(False)
  Alias_Robot.GetActorRef().EvaluatePackage(False)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Utility.RandomInt(0, 100) < Game.GetPlayer().GetLevel()
    Alias_HeatLeech_A3.GetActorRef().Enable(False)
  EndIf
  Alias_HeatLeech_B3.GetActorRef().Enable(False)
EndFunction
