ScriptName Fragments:Quests:QF_LC102LifeSupportSequence_000A3E00 Extends Quest Const hidden

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

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest
  lc102lifesupportsequencequestscript kmyQuest = __temp as lc102lifesupportsequencequestscript
  kmyQuest.RegisterForLifeSupportMachineActivations()
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.Stop()
EndFunction
