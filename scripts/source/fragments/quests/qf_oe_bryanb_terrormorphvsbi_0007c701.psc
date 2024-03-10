ScriptName Fragments:Quests:QF_OE_BryanB_TerrormorphVSBi_0007C701 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TravelToMarker Auto Const mandatory
LocationAlias Property Alias_LocationToTravelTo Auto Const mandatory
GlobalVariable Property OE_KreetTerrormorphDone Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  OE_KreetTerrormorphDone.SetValue(1.0)
EndFunction
