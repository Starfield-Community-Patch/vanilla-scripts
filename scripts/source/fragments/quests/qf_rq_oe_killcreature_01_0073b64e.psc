ScriptName Fragments:Quests:QF_RQ_OE_KillCreature_01_0073B64E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Victim Auto Const mandatory
ReferenceAlias Property Alias_Item Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
Potion Property Aid_MedPack Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  Self.SetObjectiveDisplayed(100, True, False)
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  If !Self.IsObjectiveDisplayed(100)
    Self.SetStage(990)
  Else
    Self.SetObjectiveCompleted(100, True)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest
  rqscript kmyQuest = __temp as rqscript
  Self.SetObjectiveCompleted(200, True)
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.SetStage(990)
EndFunction
