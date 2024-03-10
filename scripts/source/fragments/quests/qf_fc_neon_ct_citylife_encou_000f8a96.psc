ScriptName Fragments:Quests:QF_FC_Neon_CT_CityLife_Encou_000F8A96 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
Scene Property LifeScene Auto Const
ActorValue Property StateAV Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(StateAV, 1.0)
  Alias_Actor02.GetRef().SetValue(StateAV, 1.0)
  Alias_Actor01.GetActorRef().EvaluatePackage(False)
  Alias_Actor02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False)
  Alias_Actor02.GetRef().Disable(False)
  Self.Stop()
EndFunction
