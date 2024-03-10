ScriptName Fragments:Quests:QF_OE_MP_OldXenoweapon_00050CA4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AcelesCreature Auto Const mandatory
ReferenceAlias Property Alias_BonusTerrormorphCreature Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCreature Auto Const mandatory
ReferenceAlias Property Alias_AmbushSpawnMarker Auto Const mandatory
ReferenceAlias Property Alias_NPCSearchingFloorFurniture Auto Const mandatory
ReferenceAlias Property Alias_AmbushDecoySpawnMarkerA Auto Const mandatory
ReferenceAlias Property Alias_AmbushDecoySpawnMarkerB Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(55)
EndFunction

Function Fragment_Stage_0055_Item_00()
  Actor Terrormorph = Alias_BonusTerrormorphCreature.GetActorRef()
  ObjectReference Marker = Alias_AmbushSpawnMarker.GetRef()
  If Terrormorph as Bool && Marker as Bool
    Terrormorph.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
    Terrormorph.Enable(False)
    Terrormorph.Kill(None)
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.GetStageDone(220)
    Self.SetStage(400)
  ElseIf Self.GetStageDone(210)
    Self.SetStage(405)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(100, True)
  If Utility.RandomInt(1, 2) == 1
    Self.SetStage(450)
  EndIf
  If Self.GetStageDone(420) && Self.GetStageDone(430)
    Self.SetStage(600)
  Else
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(200, True)
  If Utility.RandomInt(1, 2) == 1
    Self.SetStage(450)
  EndIf
  If Self.GetStageDone(410) && Self.GetStageDone(430)
    Self.SetStage(600)
  ElseIf !Self.GetStageDone(410) && !Self.GetStageDone(430)
    If Utility.RandomInt(0, 1) == 0
      Self.SetStage(410)
    Else
      Self.SetStage(430)
    EndIf
  ElseIf Self.GetStageDone(410)
    Self.SetStage(430)
  Else
    Self.SetStage(410)
  EndIf
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(300, True)
  If Utility.RandomInt(1, 2) == 1
    Self.SetStage(450)
  EndIf
  If Self.GetStageDone(410) && Self.GetStageDone(420)
    Self.SetStage(600)
  ElseIf !Self.GetStageDone(410) && !Self.GetStageDone(420)
    If Utility.RandomInt(0, 1) == 0
      Self.SetStage(410)
    Else
      Self.SetStage(420)
    EndIf
  ElseIf Self.GetStageDone(410)
    Self.SetStage(420)
  Else
    Self.SetStage(410)
  EndIf
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor Terrormorph = Alias_TerrormorphCreature.GetActorRef()
  ObjectReference AmbushFurniture = Alias_AmbushSpawnMarker.GetRef()
  Self.SetObjectiveDisplayed(450, True, False)
  If Terrormorph as Bool && AmbushFurniture as Bool
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False)
    Terrormorph.Enable(False)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(900, True, False)
  If !Self.GetStageDone(450)
    If Utility.RandomInt(1, 3) == 1
      Self.SetStage(450)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  If Self.GetStageDone(205)
    If Utility.RandomInt(1, 5) == 1
      Self.SetStage(450)
    EndIf
  ElseIf Utility.RandomInt(1, 2) == 1
    Self.SetStage(450)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
  Self.SetObjectiveCompleted(450, True)
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
  Self.SetObjectiveCompleted(475, True)
EndFunction

Function Fragment_Stage_0820_Item_00()
  If Self.GetStageDone(450) || Self.GetStageDone(475)
    Self.SetStage(450)
    Self.SetStage(475)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  If !Self.GetStageDone(450) && Utility.RandomInt(1, 3) == 1
    Self.SetStage(450)
  EndIf
  If !Self.GetStageDone(475) && Utility.RandomInt(1, 3) == 1
    Self.SetStage(475)
  EndIf
  If !Self.GetStageDone(475) && !Self.GetStageDone(450)
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0860_Item_00()
  If !Self.GetStageDone(450) && Utility.RandomInt(1, 10) == 1
    Self.SetStage(450)
  EndIf
  If !Self.GetStageDone(475) && Utility.RandomInt(1, 10) == 1
    Self.SetStage(475)
  EndIf
  If !Self.GetStageDone(475) && !Self.GetStageDone(450)
    Self.SetStage(999)
  EndIf
EndFunction
