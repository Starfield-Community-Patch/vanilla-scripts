ScriptName Fragments:Quests:QF_MQ_PirateConversation04_0005EFFC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ_PirateConversation04Scene Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene04A Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene04B Auto Const mandatory
ReferenceAlias Property Alias_MQ_PirateScene04C Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  MQ_PirateConversation04Scene.Start()
EndFunction

Function Fragment_Stage_0255_Item_00()
  Utility.Wait(1.0)
  Self.Stop()
EndFunction
