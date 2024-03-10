ScriptName Fragments:Quests:QF_RQ_OE_TransportPerson_02_0031C086 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Actors Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript
  kmyQuest.SetDialogueAV_Hello_None()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.AddPassengers(Alias_Actors)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript
  kmyQuest.AgreeToTransportPassenger()
EndFunction

Function Fragment_Stage_0285_Item_00()
  Quest __temp = Self as Quest
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript
  If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveFailed(100, True)
  EndIf
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript
  Self.SetObjectiveCompleted(100, True)
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  kmyQuest.SetDialogueAV_Hello_DepartingShip()
EndFunction

Function Fragment_Stage_0920_Item_00()
  Quest __temp = Self as Quest
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript
  Self.SetStage(990)
  kmyQuest.SetDialogueAV_Hello_Calm_Success()
EndFunction
