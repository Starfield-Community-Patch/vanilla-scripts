ScriptName Fragments:Quests:QF_OE_MP_HuntedHomesteaders_000F3D39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property REPlayerAlly Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
RefCollectionAlias Property Alias_Homesteaders Auto Const mandatory
ReferenceAlias Property Alias_Leader Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(25)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_Leader.GetActorRef().EvaluatePackage(False)
  Alias_Homesteaders.EnableAll(False)
  Alias_Homesteaders.EvaluateAll()
  Alias_PredatorGroup.EnableAll(False)
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference LeaderRef = Alias_Leader.GetRef()
  ObjectReference ContainerRef = Alias_RewardContainer.GetRef()
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  Int LockLevel = 0
  If PlayerLevel > 100
    LockLevel = 100
  ElseIf PlayerLevel > 75
    LockLevel = 75
  ElseIf PlayerLevel > 50
    LockLevel = 50
  Else
    LockLevel = 25
  EndIf
  ContainerRef.Lock(True, True, True)
  ContainerRef.SetLockLevel(LockLevel)
  LeaderRef.AddKeyIfNeeded(ContainerRef)
  Alias_Homesteaders.EvaluateAll()
  Alias_Leader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0075_Item_00()
  Int SceneTheme = Utility.RandomInt(0, 2)
  If SceneTheme == 1
    Self.SetStage(110)
  ElseIf SceneTheme == 2
    Self.SetStage(120)
  Else
    Self.SetStage(100)
  EndIf
  Alias_Homesteaders.EvaluateAll()
  Alias_Leader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !Self.GetStageDone(25)
    Self.SetStage(25)
  EndIf
  If !Self.GetStageDone(50)
    Self.SetStage(50)
  EndIf
  If !Self.GetStageDone(75)
    Self.SetStage(75)
  EndIf
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Homesteaders.EvaluateAll()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  oe_huntedhomesteaders_questscript kmyQuest = __temp as oe_huntedhomesteaders_questscript
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_Leader.TryToAddToFaction(REPlayerAlly)
  Alias_Homesteaders.AddToFaction(REPlayerAlly)
  Alias_Homesteaders.EvaluateAll()
  Alias_Leader.GetActorRef().EvaluatePackage(False)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest
  oe_huntedhomesteaders_questscript kmyQuest = __temp as oe_huntedhomesteaders_questscript
  kmyQuest.StartWaitTimer()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_PredatorGroup.SetValue(Game.GetAggressionAV(), 1.0)
  Alias_PredatorGroup.EvaluateAll()
  Alias_Homesteaders.EvaluateAll()
  Alias_Leader.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0810_Item_00()
  If !Self.GetStageDone(990)
    If !Self.GetStageDone(200)
      Self.SetStage(999)
    EndIf
    If Self.IsObjectiveDisplayed(900)
      Self.SetStage(940)
    EndIf
    If Self.GetStageDone(820)
      Self.SetStage(999)
    EndIf
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0820_Item_00()
  If !Self.GetStageDone(990)
    If !Self.GetStageDone(200)
      Self.SetStage(999)
    ElseIf Self.IsObjectiveDisplayed(900)
      Self.SetStage(940)
    ElseIf Self.GetStageDone(810)
      If Self.GetStageDone(700)
        Self.SetStage(940)
      Else
        Self.SetObjectiveDisplayed(400, True, False)
        Self.SetObjectiveSkipped(300)
      EndIf
    EndIf
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0825_Item_00()
  If !Self.GetStageDone(810)
    Alias_Leader.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(810)
    If Self.GetStageDone(820)
      Self.SetStage(940)
    Else
      Self.SetObjectiveDisplayed(910, True, False)
      Alias_Homesteaders.EvaluateAll()
    EndIf
  Else
    Self.SetObjectiveDisplayed(900, True, False)
    Alias_Leader.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0910_Item_00()
  If Self.GetStageDone(810)
    If Self.GetStageDone(820)
      Self.SetStage(940)
    Else
      Self.SetStage(930)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0920_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  ObjectReference ContainerRef = Alias_RewardContainer.GetRef()
  ContainerRef.Lock(True, False, True)
  ContainerRef.SetLockLevel(25)
  PlayerRef.AddKeyIfNeeded(ContainerRef)
  Self.SetStage(950)
  Self.SetStage(930)
EndFunction

Function Fragment_Stage_0930_Item_00()
  Self.SetStage(940)
EndFunction

Function Fragment_Stage_0940_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
