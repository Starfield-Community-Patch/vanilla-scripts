ScriptName Fragments:Quests:QF_UCR03_SpaceEncounter_0017D3D6 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR03 Auto Const mandatory
RefCollectionAlias Property Alias_PatrolMarkers Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ucr03questscript UCR03Obj = UCR03 as ucr03questscript
  UCR03Obj.GeneralMarker.ForceRefTo(Alias_GeneralMarker.GetRef())
  UCR03.SetStage(210)
  Self.Stop()
  Self.Reset()
EndFunction
