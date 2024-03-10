ScriptName Fragments:Quests:QF_BE_Objective_00098B4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BEObjective_OnceOnly_Global Auto Const mandatory
GlobalVariable Property BEObjective_OnceOnly_DoneGlobal Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ActorValue Property BE_SpaceshipTakenOver Auto Const mandatory
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
Message Property Tutorial_NewHomeShip Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0025_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayedAtTop(20)
  defaultcounteraliascolincondeatha allCrewCol = Alias_AllCrew as defaultcounteraliascolincondeatha
  If allCrewCol.GetCount() <= allCrewCol.TargetRemainingCount
    Self.SetStage(25)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ_TutorialQuest.SetStage(300)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveSkipped(40)
  Self.CompleteQuest()
  Self.Stop()
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.SetObjectiveSkipped(20)
  Self.SetObjectiveSkipped(30)
  Self.SetObjectiveCompleted(40, True)
  Self.CompleteQuest()
  Self.Stop()
EndFunction
