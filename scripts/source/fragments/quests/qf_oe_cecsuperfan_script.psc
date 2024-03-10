ScriptName Fragments:Quests:QF_OE_CECSuperfan_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_Superfan Auto Const mandatory
Scene Property Scene_PlayerWins Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Wounded Auto Const mandatory
Scene Property Scene_PlayerLoses Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Wounded_Interior Auto Const mandatory
GlobalVariable Property gLockLevel Auto Const mandatory
Scene Property Scene_Cheater Auto Const mandatory
Faction Property OE_AustinF_CECSuperfan_EnemyFaction Auto Const
GlobalVariable Property OE_AustinF_CECSuperfanDone Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ObjectReference InteriorMarker = Alias_ShipA_InteriorMarker.GetRef()
  ObjectReference WoundedFurniture = Alias_Furniture_Wounded_Interior.GetRef()
  WoundedFurniture.MoveTo(InteriorMarker, 0.0, 0.0, 0.0, True, False)
  Alias_Superfan.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  OE_AustinF_CECSuperfanDone.SetValueInt(1)
  ObjectReference FurnitureREF = Alias_Furniture_Wounded_Interior.GetRef()
  ObjectReference InteriorMarker = Alias_ShipA_InteriorMarker.GetRef()
  If Self.GetStageDone(50)
    Alias_Superfan.GetActorRef().EvaluatePackage(False)
    If FurnitureREF != None && InteriorMarker != None
      FurnitureREF.MoveTo(InteriorMarker, 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False)
  If Self.GetStageDone(200)
    Self.SetStage(400)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Superfan.GetActorRef().EvaluatePackage(False)
  Alias_Superfan.GetActorRef().AddToFaction(OE_AustinF_CECSuperfan_EnemyFaction)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Superfan = Alias_Superfan.GetActorRef()
  ObjectReference Marker = Alias_Furniture_Wounded.GetRef()
  Superfan.SetValue(Game.GetAggressionAV(), 0.0)
  Superfan.StopCombat()
  Marker.MoveTo(Superfan as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Marker.Enable(False)
  Superfan.EvaluatePackage(False)
  Superfan.RemoveFromFaction(PlayerEnemyFaction)
  Scene_PlayerWins.Start()
  If Superfan.IsInCombat()
    Superfan.StopCombat()
  EndIf
EndFunction

Function Fragment_Stage_0310_Item_00()
  Actor Superfan = Alias_Superfan.GetActorRef()
  ObjectReference Marker = Alias_Furniture_Wounded.GetRef()
  Superfan.SetValue(Game.GetAggressionAV(), 0.0)
  If Superfan.IsInCombat()
    Superfan.StopCombat()
  EndIf
  If Self.GetStageDone(110) || Self.GetStageDone(170)
    Self.SetStage(999)
  Else
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Actor Superfan = Alias_Superfan.GetActorRef()
  Scene_PlayerLoses.Start()
  Superfan.RemoveFromFaction(PlayerEnemyFaction)
  Superfan.SetValue(Game.GetAggressionAV(), 0.0)
  Superfan.EvaluatePackage(False)
  Superfan.StopCombat()
  Utility.Wait(3.0)
  If Superfan.IsInCombat()
    Superfan.StopCombat()
    Superfan.EvaluatePackage(False)
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  Actor Superfan = Alias_Superfan.GetActorRef()
  GlobalVariable newLockLevel = None
  If Self.GetStageDone(500)
    kmyQuest.ToggleShipDoors(newLockLevel, None, False, True)
  Else
    kmyQuest.ToggleShipDoors(gLockLevel, None, False, True)
  EndIf
  Superfan.StopCombat()
  Superfan.RemoveFromFaction(PlayerEnemyFaction)
  Superfan.EvaluatePackage(False)
  Superfan.SetValue(Game.GetAggressionAV(), 0.0)
  If Superfan.IsInCombat()
    Superfan.StopCombat()
  EndIf
EndFunction
