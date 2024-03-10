ScriptName Fragments:Quests:QF_RIR01_002C572B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RIR01_DataDisk Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
ReferenceAlias Property Alias_DataDisk Auto Const mandatory
ReferenceAlias Property Alias_ImogeneSalzo Auto Const mandatory
Quest Property RI01 Auto Const mandatory
ReferenceAlias Property Alias_ImogeneStartMarker Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_NeonCeltCorpTerminal Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  RI01.Start()
  RI01.SetObjectiveCompleted(100, True)
  RI01_JobAdRadio.Stop()
  RI01.SetStage(1300)
  LC044.SetStage(350)
  LC044.SetStage(400)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  Self.SetStage(100)
  LC044.SetStage(350)
  LC044.SetStage(400)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  Self.SetStage(100)
  Self.SetStage(200)
  LC044.SetStage(350)
  LC044.SetStage(400)
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  Self.SetStage(100)
  Self.SetStage(110)
  Self.SetStage(120)
  Self.SetStage(130)
  Self.SetStage(200)
  Self.SetStage(300)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference TerminalRef = Alias_NeonCeltCorpTerminal.GetRef()
  TerminalRef.Lock(True, False, True)
  TerminalRef.SetLockLevel(25)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  RI01.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddItem(Alias_DataDisk.GetRef() as Form, 1, False)
  PlayerRef.AddItem(Digipick as Form, 2, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  RIR02.SetStage(10)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(RIR01_DataDisk as Form, 99, False, None)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
