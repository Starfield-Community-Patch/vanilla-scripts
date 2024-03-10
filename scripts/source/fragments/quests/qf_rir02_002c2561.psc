ScriptName Fragments:Quests:QF_RIR02_002C2561 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RIR02_ConfidentialFiles Auto Const mandatory
ReferenceAlias Property Alias_ConfidentialFiles Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
ReferenceAlias Property Alias_ImogeneStartMarker Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RI01 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Keyword Property RIR03_QuestStartKeyword Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_AkilaCityLaredoFilingCabinetEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_AkilaCityLaredoContainer Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
LocationAlias Property Alias_AkilaCityLaredoLocation Auto Const mandatory
Keyword Property LocTypeRadiantsNotAllowed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RIR01.SetStage(300)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01.CompleteQuest()
  RI01_JobAdRadio.Stop()
  RIR01.CompleteQuest()
  Self.SetStage(100)
  LC044.SetStage(350)
  LC044.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  RIR01.Stop()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddItem(Alias_ConfidentialFiles.GetRef() as Form, 1, False)
  PlayerRef.AddItem(Digipick as Form, 2, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
  ObjectReference ContainerRef = Alias_AkilaCityLaredoContainer.GetRef()
  ContainerRef.Enable(False)
  ContainerRef.Lock(True, False, True)
  ContainerRef.SetLockLevel(25)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_AkilaCityLaredoContainer.GetRef().RemoveItem(Alias_ConfidentialFiles.GetRef() as Form, 1, False, None)
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Alias_AkilaCityLaredoContainer.GetRef().Disable(False)
  Alias_AkilaCityLaredoLocation.GetLocation().RemoveKeyword(LocTypeRadiantsNotAllowed)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
