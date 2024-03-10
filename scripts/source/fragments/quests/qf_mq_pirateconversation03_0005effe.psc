ScriptName Fragments:Quests:QF_MQ_PirateConversation03_0005EFFE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ_PirateConversation03Scene Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene03A Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene03B Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  MQ_PirateConversation03Scene.Start()
EndFunction

Function Fragment_Stage_0255_Item_00()
  Utility.Wait(1.0)
  Self.Stop()
EndFunction
