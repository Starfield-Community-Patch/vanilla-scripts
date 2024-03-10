ScriptName Fragments:Quests:QF_OE_PredatorsVsGuard_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship Auto Const mandatory
ReferenceAlias Property Alias_Ship_Door Auto Const mandatory
MiscObject Property Credits Auto Const
Potion Property Aid_MedPack Auto Const mandatory
Potion Property MedPack Auto Const mandatory
ReferenceAlias Property Alias_NPC Auto Const mandatory
ReferenceAlias Property Alias_Ambush_HardSpawn Auto Const mandatory
RefCollectionAlias Property Alias_Ambush_RegularSpawn Auto Const mandatory
RefCollectionAlias Property Alias_Ambush_EasySpawn Auto Const mandatory
RefCollectionAlias Property Alias_Ambush_Bonus Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
GlobalVariable Property SQ_WoundedState_0_Unset Auto Const mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
GlobalVariable Property SQ_WoundedState_2_Healed Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const mandatory
ActorValue Property SQ_WoundedState Auto Const mandatory
ActorValue Property RQ_AV_Hello Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Ambush_EasySpawn.DisableAll(False)
  Alias_Ambush_RegularSpawn.DisableAll(False)
  Alias_Ambush_Bonus.DisableAll(False)
  Alias_Ambush_HardSpawn.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0060_Item_00()
  ObjectReference Marker = Alias_WoundedMarker.GetRef()
  Actor NPC = Alias_NPC.GetActorRef()
  NPC.SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue())
  NPC.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
  NPC.EvaluatePackage(False)
  NPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1.0)
  NPC.SetProtected(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Alias_NPC.GetActorRef().SetProtected(False)
EndFunction

Function Fragment_Stage_0185_Item_00()
  Game.GetPlayer().RemoveItem(MedPack as Form, 1, False, None)
  Self.SetStage(180)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor aNPC = Alias_NPC.GetActorRef()
  Self.SetStage(210)
  aNPC.EvaluatePackage(False)
  aNPC.SetProtected(True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  (Alias_NPC as defaultcaptivewoundedalias).HealActor(True)
  Alias_NPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Int EncounterPoints = 3
  If Self.GetStageDone(160)
    If !Self.GetStageDone(200)
      EncounterPoints += 3
    Else
      EncounterPoints += 1
    EndIf
  Else
    EncounterPoints -= 1
  EndIf
  If Self.GetStageDone(170)
    EncounterPoints += 2
  Else
    EncounterPoints -= 1
  EndIf
  If Game.GetPlayer().GetLevel() > 100
    EncounterPoints += 6
  ElseIf Game.GetPlayer().GetLevel() > 75
    EncounterPoints += 3
  ElseIf Game.GetPlayer().GetLevel() > 50
    EncounterPoints += 2
  ElseIf Game.GetPlayer().GetLevel() > 25
    EncounterPoints += 1
  Else
    EncounterPoints -= 1
  EndIf
  If EncounterPoints > Utility.RandomInt(5, 10)
    Self.SetStage(270)
  ElseIf EncounterPoints > Utility.RandomInt(1, 10)
    Self.SetStage(265)
  Else
    Self.SetStage(260)
  EndIf
  If EncounterPoints > 5
    Self.SetStage(275)
  EndIf
EndFunction

Function Fragment_Stage_0260_Item_00()
  Alias_Ambush_EasySpawn.EnableAll(False)
EndFunction

Function Fragment_Stage_0265_Item_00()
  Alias_Ambush_RegularSpawn.EnableAll(False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Alias_Ambush_HardSpawn.GetRef().Enable(False)
  Self.SetStage(260)
EndFunction

Function Fragment_Stage_0275_Item_00()
  Alias_Ambush_Bonus.EnableAll(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(350)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Actor aNPC = Alias_NPC.GetActorRef()
  aNPC.EvaluatePackage(False)
  aNPC.SetProtected(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0505_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False)
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0515_Item_00()
  Self.SetStage(505)
EndFunction

Function Fragment_Stage_0525_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  If !Self.GetStageDone(600)
    kmyQuest.LaunchShip(0, None, False)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(995)
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.GetStageDone(600)
    Self.SetStage(810)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetStage(820)
EndFunction

Function Fragment_Stage_0950_Item_00()
  If Self.GetStageDone(300)
    Self.SetStage(990)
  Else
    Self.SetStage(995)
  EndIf
EndFunction

Function Fragment_Stage_0990_Item_00()
  Bool NPCisAlive = !Self.GetStageDone(600)
  Bool PlayerNeedsReward = !Self.GetStageDone(800)
  If PlayerNeedsReward && NPCisAlive
    Self.SetStage(800)
  EndIf
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  SQ_Followers.SetRoleInActive(Alias_NPC.GetActorRef(), True, False, True)
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  oe_austinf_pvg_script kmyQuest = __temp as oe_austinf_pvg_script
EndFunction
