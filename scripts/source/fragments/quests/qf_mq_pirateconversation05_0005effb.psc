ScriptName Fragments:Quests:QF_MQ_PirateConversation05_0005EFFB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ_PirateConversation05Scene Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene05A Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene05B Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene05C Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  MQ_PirateConversation05Scene.Start()
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.Stop()
EndFunction
