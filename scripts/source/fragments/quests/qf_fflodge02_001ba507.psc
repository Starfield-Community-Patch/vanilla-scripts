ScriptName Fragments:Quests:QF_FFLodge02_001BA507 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
Scene Property FFLodge02_Scene01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_EnableMarker.GetReference().Enable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
