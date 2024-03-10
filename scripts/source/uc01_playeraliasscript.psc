ScriptName UC01_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SitRegistrationStage = 500 Auto Const
{ Once this stage is set, register the player for OnSit events }
ReferenceAlias Property PilotsExamChair Auto Const mandatory
{ The seat we're looking for to launch the player into space }
GlobalVariable Property UC01_ShipSim_PlayerEverPassedSequence Auto Const mandatory
{ Global used to track if the player has successfully completed the Ship Sim sequence }
Location Property LC037VanguardCourseLocation Auto Const mandatory
{ Location to check for to complete the experience for the player }
Int Property StagetoSet = 600 Auto Const
{ Once the player's completed the sim sequence, set this stage }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC037VanguardCourseLocation && UC01_ShipSim_PlayerEverPassedSequence.GetValue() >= 1.0 && !Self.GetOwningQuest().GetStageDone(StagetoSet)
    Self.GetOwningQuest().SetStage(StagetoSet)
  EndIf
EndEvent
