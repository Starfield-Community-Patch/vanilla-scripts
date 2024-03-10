ScriptName Fragments:Quests:QF_City_Akila_Ashta03_00212B4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AlphaAshta Auto Const mandatory
ReferenceAlias Property Alias_Davis Auto Const mandatory
Scene Property DavisPatrolScene1 Auto Const
Scene Property DavisPatrolScene2 Auto Const
ReferenceAlias Property Alias_Keoni Auto Const mandatory
ReferenceAlias Property Alias_PlayerStartMarker Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
ActorValue Property Ashta03_Foreknowledge_DavisDiesAV Auto Const mandatory
ActorValue Property Ashta03_Foreknowledge_CompletedQuestAV Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
Message Property City_Akila_Ashta_03_BuildRewardMsg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_Keoni.GetReference().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Alias_Keoni.GetActorReference().EvaluatePackage(False)
  Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_Keoni.GetActorRef()
  aTarg.Enable(False)
  DialogueFCAkilaCity.SetStage(2015)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest
  city_akila_ashta02_script kmyQuest = __temp as city_akila_ashta02_script
  Self.SetObjectiveDisplayed(5, True, False)
  kmyQuest.Wait24()
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetObjectiveCompleted(5, True)
  Self.SetObjectiveDisplayed(7, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(7, True)
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveCompleted(20, True)
  Else
    Self.SetObjectiveCompleted(10, True)
  EndIf
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_Davis.GetActorReference().EvaluatePackage(False)
  DavisPatrolScene1.Start()
EndFunction

Function Fragment_Stage_0031_Item_00()
  Alias_Davis.GetActorReference().EvaluatePackage(False)
  DavisPatrolScene2.Start()
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_Davis.GetActorRef().SetEssential(True)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Game.ShakeCamera(None, 0.850000024, 2.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetObjectiveDisplayed(110, True, False)
  Alias_AlphaAshta.GetReference().Enable(False)
  Alias_AlphaAshta.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  If !Self.GetStageDone(35)
    Alias_Davis.GetActorRef().SetEssential(False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveFailed(110, True)
  Game.GetPlayer().SetValue(Ashta03_Foreknowledge_DavisDiesAV, 1.0)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  If Self.GetStageDone(110)
    Self.SetObjectiveDisplayed(160, True, False)
  Else
    Alias_Davis.GetActorRef().SetEssential(True)
    Self.SetObjectiveCompleted(110, True)
    Self.SetObjectiveDisplayed(150, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(160, True, False)
  Alias_Davis.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_Keoni.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  City_Akila_Ashta_03_BuildRewardMsg.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Game.GetPlayer().SetValue(Ashta03_Foreknowledge_CompletedQuestAV, 1.0)
  Self.Stop()
EndFunction
