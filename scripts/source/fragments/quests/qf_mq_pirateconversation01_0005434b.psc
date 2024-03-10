ScriptName Fragments:Quests:QF_MQ_PirateConversation01_0005434B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ_PirateConversation01Scene Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene01A Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene01B Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  MQ_PirateConversation01Scene.Start()
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.Stop()
EndFunction
