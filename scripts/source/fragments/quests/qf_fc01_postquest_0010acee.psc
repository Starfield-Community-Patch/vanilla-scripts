ScriptName Fragments:Quests:QF_FC01_PostQuest_0010ACEE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityAkilaCityLocation Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_JedBullock Auto Const mandatory
ReferenceAlias Property Alias_Robber02 Auto Const mandatory
ReferenceAlias Property Alias_Robber03 Auto Const mandatory
ReferenceAlias Property Alias_Robber04 Auto Const mandatory
ReferenceAlias Property Alias_Robber05 Auto Const mandatory
ReferenceAlias Property Alias_Robber06 Auto Const mandatory
ReferenceAlias Property Alias_BankFrontDoor Auto Const mandatory
ReferenceAlias Property Alias_BankRearDoor Auto Const mandatory
Scene Property FC01_PostQuest_MarkoSimoneScene Auto Const mandatory
Scene Property FC01_PostQuest_ElizabethFrankScene Auto Const mandatory
LeveledItem Property LLI_NPC_Unique Auto Const mandatory
ReferenceAlias Property Alias_WilliamCrowley Auto Const mandatory
ReferenceAlias Property Alias_MarkoJansen Auto Const mandatory
ReferenceAlias Property Alias_ElizabethCardwell Auto Const mandatory
ObjectReference Property FC01_EnableMarker Auto Const mandatory
ObjectReference Property FC01_BankRobbersEnableMarker Auto Const mandatory
Quest Property FC_JobsDoneSlateHolderQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_BankFrontDoor.GetRef().Unlock(False)
  Alias_BankFrontDoor.GetRef().SetLockLevel(0)
  Alias_BankRearDoor.GetRef().Unlock(False)
  Alias_BankRearDoor.GetRef().SetLockLevel(0)
  Alias_JedBullock.GetActorRef().SetRestrained(True)
  Alias_Robber02.GetActorRef().SetRestrained(True)
  Alias_Robber03.GetActorRef().SetRestrained(True)
  Alias_Robber04.GetActorRef().SetRestrained(True)
  Alias_Robber05.GetActorRef().SetRestrained(True)
  Alias_Robber06.GetActorRef().SetRestrained(True)
EndFunction

Function Fragment_Stage_2000_Item_00()
  FC01_BankRobbersEnableMarker.Disable(False)
  FC01_EnableMarker.Disable(False)
  If Alias_WilliamCrowley.GetActorRef().IsDead()
    Alias_WilliamCrowley.GetReference().Disable(False)
  EndIf
  Alias_WilliamCrowley.GetActorRef().AddItem(LLI_NPC_Unique as Form, 2, False)
  Alias_MarkoJansen.GetActorRef().AddItem(LLI_NPC_Unique as Form, 2, False)
  Alias_ElizabethCardwell.GetActorRef().AddItem(LLI_NPC_Unique as Form, 2, False)
  FC_JobsDoneSlateHolderQuest.SetStage(2000)
  Self.Stop()
EndFunction
