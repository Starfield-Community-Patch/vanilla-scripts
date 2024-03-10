ScriptName Fragments:Quests:QF_City_ER_Ghost_0016D4D1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property ER_DEBUG_Ghost_Enemies Auto Const mandatory
ObjectReference Property DR007MapMarkerHeadingRef Auto Const mandatory
ObjectReference Property City_ER_Ghost_DebugMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
Quest Property City_ER_Exorcism Auto Const mandatory
ReferenceAlias Property Alias_DR007DebugMarker01 Auto Const mandatory
Book Property ER_Ghost_TrackerSlate Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
ReferenceAlias Property Alias_Sloan Auto Const mandatory
ReferenceAlias Property Alias_Nevan Auto Const mandatory
ReferenceAlias Property Alias_Petra Auto Const mandatory
ObjectReference Property ER_Ghost_Scene300_Marker_Petra Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  DialogueEleosRetreat.SetStage(25)
  DialogueEleosRetreat.SetStage(40)
  DialogueEleosRetreat.SetStage(50)
  DialogueEleosRetreat_OpeningScene.Stop()
  Game.GetPlayer().Moveto(Alias_DR007DebugMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  DialogueEleosRetreat.SetStage(25)
  DialogueEleosRetreat.SetStage(40)
  DialogueEleosRetreat.SetStage(50)
  DialogueEleosRetreat_OpeningScene.Stop()
  Game.GetPlayer().Moveto(Alias_DR007DebugMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddItem(Alias_Slate.GetRef() as Form, 1, False)
  Self.SetStage(300)
  Game.GetPlayer().Moveto(City_ER_Ghost_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(ER_Ghost_TrackerSlate as Form, 1, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If !Self.GetStageDone(300)
    Self.SetObjectiveCompleted(100, True)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  uc09questscript kmyQuest = __temp as uc09questscript
  kmyQuest.GetNPCsInPlace()
  Alias_Petra.GetRef().Moveto(ER_Ghost_Scene300_Marker_Petra, 0.0, 0.0, 0.0, True, False)
  Alias_Sloan.GetRef().Moveto(ER_Ghost_Scene300_Marker_Petra, 0.0, 0.0, 0.0, True, False)
  Alias_Nevan.GetRef().Moveto(ER_Ghost_Scene300_Marker_Petra, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(305, True, False)
  Game.GetPlayer().RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_ER_Exorcism.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
