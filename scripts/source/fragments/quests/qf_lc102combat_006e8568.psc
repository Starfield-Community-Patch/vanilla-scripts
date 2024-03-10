ScriptName Fragments:Quests:QF_LC102Combat_006E8568 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_LifeSupportMachine01_FXEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine02_FXEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine03_FXEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_LockdownEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const mandatory
ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  lc102combatquestscript kmyQuest = __temp as lc102combatquestscript
  kmyQuest.SetTargetQuestStage()
EndFunction
