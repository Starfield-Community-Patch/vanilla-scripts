ScriptName Fragments:Quests:QF_MQ401d_0017B94D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
Scene Property MQ401c_001_IntroScene Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact01 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifaceDataSlate Auto Const mandatory
ReferenceAlias Property Alias_Zealot02 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact06 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Zealot01 Auto Const mandatory
ReferenceAlias Property Alias_Zealot03 Auto Const mandatory
ReferenceAlias Property Alias_Zealot04 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact07 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact08 Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Self.SetObjectiveDisplayed(10, True, False)
  MQ401_SkipMQ.SetValueInt(1)
  (MQ401 as mq401questscript).CleanUpNormalMainQuest()
  kmyQuest.EnableQuestActors()
  If MQ402.IsRunning() == False
    MQ402.Start()
  EndIf
  (MQ402 as mq402script).AddLodgeArtifacts(AndrejaREF)
  (AndrejaREF.GetBaseObject() as ActorBase).SetEssential(False)
  Alias_Armillary.GetRef().DisableNoWait(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
  MQ401c_001_IntroScene.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor PlayerREF = Game.GetPlayer()
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  Actor Zealot01REF = Alias_Zealot01.GetActorRef()
  Actor Zealot02REF = Alias_Zealot02.GetActorRef()
  Actor Zealot03REF = Alias_Zealot03.GetActorRef()
  Actor Zealot04REF = Alias_Zealot04.GetActorRef()
  AndrejaREF.AddtoFaction(PlayerEnemyFaction)
  AndrejaREF.SetValue(Aggression, 1.0)
  AndrejaREF.StartCombat(PlayerREF as ObjectReference, False)
  Zealot01REF.AddtoFaction(PlayerEnemyFaction)
  Zealot01REF.SetValue(Aggression, 1.0)
  Zealot01REF.StartCombat(PlayerREF as ObjectReference, False)
  Zealot02REF.AddtoFaction(PlayerEnemyFaction)
  Zealot02REF.SetValue(Aggression, 1.0)
  Zealot02REF.StartCombat(PlayerREF as ObjectReference, False)
  Zealot03REF.AddtoFaction(PlayerEnemyFaction)
  Zealot03REF.SetValue(Aggression, 1.0)
  Zealot03REF.StartCombat(PlayerREF as ObjectReference, False)
  Zealot04REF.AddtoFaction(PlayerEnemyFaction)
  Zealot04REF.SetValue(Aggression, 1.0)
  Zealot04REF.StartCombat(PlayerREF as ObjectReference, False)
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0
    PlayerREF.additem(LodgeKey as Form, 1, True)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.setstage(110)
  If Self.GetStageDone(130) && Self.GetStageDone(140) && Self.GetStageDone(150) && Self.GetStageDone(160)
    Self.setstage(200)
  EndIf
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.setstage(110)
  If Self.GetStageDone(120) && Self.GetStageDone(140) && Self.GetStageDone(150) && Self.GetStageDone(160)
    Self.setstage(200)
  EndIf
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.setstage(110)
  If Self.GetStageDone(130) && Self.GetStageDone(120) && Self.GetStageDone(150) && Self.GetStageDone(160)
    Self.setstage(200)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.setstage(110)
  If Self.GetStageDone(130) && Self.GetStageDone(140) && Self.GetStageDone(120) && Self.GetStageDone(160)
    Self.setstage(200)
  EndIf
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.setstage(110)
  If Self.GetStageDone(130) && Self.GetStageDone(140) && Self.GetStageDone(150) && Self.GetStageDone(120)
    Self.setstage(200)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  MQ402.setstage(100)
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0220_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0240_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(280) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0280_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(210) && Self.GetStageDone(290)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0290_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(210) && Self.GetStageDone(280)
    Self.setstage(1000)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.additem(Alias_ArtifaceDataSlate.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact01.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact02.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact03.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact04.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact05.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact06.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact07.GetRef() as Form, 1, False)
  PlayerREF.additem(Alias_LodgeArtifact08.GetRef() as Form, 1, False)
  Self.setstage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.AddtoFaction(ConstellationFaction)
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0
    PlayerREF.additem(LodgeKey as Form, 1, True)
  EndIf
  PlayerREF.AddtoFaction(EyeBoardingFaction)
  Self.CompleteAllObjectives()
EndFunction
