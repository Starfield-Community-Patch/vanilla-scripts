ScriptName UC03_SupportQuest_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 200 Auto Const
{ Stage to set once the player has visited another location }
Location Property LC028RedDevilMinesLocation Auto Const mandatory
{ Location obejct for the Deep Mines }
GlobalVariable Property UC03_PlayerKilledSpacerBoss Auto Const mandatory
{ Global used to track if the player has killed the spacer boss here }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If !Self.GetOwningQuest().GetStageDone(StageToSet) && UC03_PlayerKilledSpacerBoss.GetValue() >= 1.0 && akNewLoc != LC028RedDevilMinesLocation
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
