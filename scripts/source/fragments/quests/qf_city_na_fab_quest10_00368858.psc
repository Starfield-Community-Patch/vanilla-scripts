ScriptName Fragments:Quests:QF_City_NA_FAB_Quest10_00368858 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
ActorValue Property CityLife_FAB_State Auto Const mandatory
Scene Property LifeScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(CityLife_FAB_State, 1.0)
  Alias_Actor02.GetRef().SetValue(CityLife_FAB_State, 1.0)
  Alias_Actor01.GetActorRef().EvaluatePackage(False)
  Alias_Actor02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False)
  Alias_Actor02.GetRef().Disable(False)
  Self.Stop()
EndFunction
