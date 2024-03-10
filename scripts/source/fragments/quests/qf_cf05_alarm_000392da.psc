ScriptName Fragments:Quests:QF_CF05_Alarm_000392DA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property LC043SYFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory
Quest Property CF05 Auto Const mandatory
ObjectReference Property CF05_CommandBayDoorREF Auto Const mandatory
ReferenceAlias Property Alias_CF05_GabrielVogel Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_CF05_EngineerMedina Auto Const mandatory
Quest Property LC043 Auto Const mandatory
ReferenceAlias Property Alias_CF05_CargoDoorLock Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0060_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveFromFaction(LC043SY01Faction)
  Alias_CF05_CargoDoorLock.GetRef().Lock(False, False, True)
  LC043.SetStage(150)
EndFunction

Function Fragment_Stage_0060_Item_01()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveFromFaction(LC043SY02Faction)
  CF05_CommandBayDoorREF.Lock(False, False, True)
  If CF05.GetStageDone(1029)
    Alias_CF05_EngineerMedina.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  EndIf
  LC043.SetStage(250)
EndFunction

Function Fragment_Stage_0060_Item_02()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.RemoveFromFaction(LC043SY03Faction)
  Alias_CF05_GabrielVogel.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
  LC043.SetStage(350)
EndFunction

Function Fragment_Stage_0060_Item_03()
  CF05.SetStage(60)
  CF05.SetObjectiveSkipped(810)
  If !CF05.GetStageDone(1200)
    CF05.SetObjectiveDisplayed(1000, True, False)
  EndIf
  CF05.SetObjectiveSkipped(1014)
  CF05.SetObjectiveSkipped(1016)
  CF05.SetObjectiveSkipped(1020)
  CF05.SetObjectiveSkipped(1030)
  CF05.SetObjectiveSkipped(1040)
  CF05.SetObjectiveSkipped(1041)
  CF05.SetObjectiveSkipped(1050)
  CF05.SetObjectiveSkipped(1060)
  CF05.SetObjectiveSkipped(1700)
  CF05.SetObjectiveSkipped(1710)
EndFunction
