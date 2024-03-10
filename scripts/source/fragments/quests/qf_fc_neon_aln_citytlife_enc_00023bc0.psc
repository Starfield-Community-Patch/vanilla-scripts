ScriptName Fragments:Quests:QF_FC_Neon_ALN_CitytLife_Enc_00023BC0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
Scene Property LifeScene Auto Const
ActorValue Property FC_Neon_ALN_CityLife_State Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0)
  Alias_Actor02.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0)
  Alias_Actor01.GetActorRef().EvaluatePackage(False)
  Alias_Actor02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False)
  Alias_Actor02.GetRef().Disable(False)
  Self.Stop()
EndFunction
