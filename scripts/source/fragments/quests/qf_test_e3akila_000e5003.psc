ScriptName Fragments:Quests:QF_TEST_E3Akila_000E5003 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property TEST_E3_AkilaCityConvoScene Auto Const mandatory
ReferenceAlias Property Alias_RangerMarker Auto Const mandatory
ReferenceAlias Property Alias_GuardMarker Auto Const mandatory
ReferenceAlias Property Alias_Ranger Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ReferenceAlias Property Alias_RockEntrance Auto Const mandatory
ReferenceAlias Property Alias_Mary Auto Const mandatory
ReferenceAlias Property Alias_Helga Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_RangerMarker.GetRef().EnableNoWait(False)
  Alias_GuardMarker.GetRef().EnableNoWait(False)
  Alias_Helga.GetRef().DisableNoWait(False)
  Alias_Mary.GetRef().DisableNoWait(False)
  Alias_Ranger.GetRef().MoveTo(Alias_RangerMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Guard.GetRef().MoveTo(Alias_GuardMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(Alias_RockEntrance.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  TEST_E3_AkilaCityConvoScene.Start()
EndFunction
