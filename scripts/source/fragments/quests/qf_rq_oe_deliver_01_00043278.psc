ScriptName Fragments:Quests:QF_RQ_OE_Deliver_01_00043278 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Item Auto Const mandatory
ReferenceAlias Property Alias_Recipient Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  rq_deliverscript kmyQuest = __temp as rq_deliverscript
  Self.SetObjectiveDisplayed(400, True, False)
  Alias_Recipient.TryToEnable()
EndFunction

Function Fragment_Stage_0485_Item_00()
  Quest __temp = Self as Quest
  rq_deliverscript kmyQuest = __temp as rq_deliverscript
  Self.FailAllObjectives()
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Item.GetReference() as Form, 1, False, None)
  Actor recipient = Alias_Recipient.GetActorRef()
  recipient.ChangeAnimArchetype(AnimArchetypeDepressed)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Alias_Recipient.TryToDisable()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(990)
EndFunction
