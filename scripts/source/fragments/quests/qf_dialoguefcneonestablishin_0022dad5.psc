ScriptName Fragments:Quests:QF_DialogueFCNeonEstablishin_0022DAD5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueFCNeonEstablishingScene_Main Auto Const mandatory
ReferenceAlias Property Alias_NeonGuard_F02 Auto Const mandatory
ReferenceAlias Property Alias_NeonGuard_M01 Auto Const mandatory
ReferenceAlias Property Alias_Neshar Auto Const mandatory
GlobalVariable Property NeonESSceneStatus Auto Const mandatory
Quest Property City_Neon_Drug01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  DialogueFCNeonEstablishingScene_Main.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_NeonGuard_F02.GetActorRef().EvaluatePackage(False)
  Alias_NeonGuard_M01.GetActorRef().EvaluatePackage(False)
  Alias_Neshar.GetActorRef().EvaluatePackage(False)
  City_Neon_Drug01.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Neshar.GetActorRef().Disable(True)
  NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() + 1.0)
  If NeonESSceneStatus.GetValue() >= 3.0
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_NeonGuard_F02.GetActorRef().Disable(True)
  NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() + 1.0)
  If NeonESSceneStatus.GetValue() >= 3.0
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_NeonGuard_M01.GetActorRef().Disable(True)
  NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() + 1.0)
  If NeonESSceneStatus.GetValue() >= 3.0
    Self.SetStage(1000)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
