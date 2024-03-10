ScriptName Fragments:Quests:QF_RQ_OE_TransportPerson_0_0002E9F0_1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_QuestGiver Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_transportperson_01_script kmyQuest = __temp as rq_transportperson_01_script
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.AddPassenger(Alias_QuestGiver)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  rq_transportperson_01_script kmyQuest = __temp as rq_transportperson_01_script
  kmyQuest.AgreeToTransportPassenger()
EndFunction

Function Fragment_Stage_0285_Item_00()
  Quest __temp = Self as Quest
  rq_transportperson_01_script kmyQuest = __temp as rq_transportperson_01_script
  If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveFailed(100, True)
  EndIf
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest
  rq_transportperson_01_script kmyQuest = __temp as rq_transportperson_01_script
  Self.SetObjectiveCompleted(100, True)
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  kmyQuest.SetDialogueAV_Hello_DepartingShip()
EndFunction

Function Fragment_Stage_0920_Item_00()
  Quest __temp = Self as Quest
  rq_transportperson_01_script kmyQuest = __temp as rq_transportperson_01_script
  Self.SetStage(990)
EndFunction
