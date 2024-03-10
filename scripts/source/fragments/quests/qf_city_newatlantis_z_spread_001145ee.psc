ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Spread_001145EE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property pCity_NA_Z_SpreadTheNewsDataSlate Auto Const mandatory
ReferenceAlias Property Tommy Auto Const
ReferenceAlias Property NewsSlate Auto Const
ReferenceAlias Property NewsSlateReview Auto Const
ReferenceAlias Property NewsSlateSanctum Auto Const
ReferenceAlias Property George Auto Const
ReferenceAlias Property Catherine Auto Const
ReferenceAlias Property Royce Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Tommy.GetActorRef().RemoveItem(NewsSlate.GetRef() as Form, 1, False, None)
  Tommy.GetActorRef().RemoveItem(NewsSlateReview.GetRef() as Form, 1, False, None)
  Tommy.GetActorRef().RemoveItem(NewsSlateSanctum.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(NewsSlate.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(NewsSlateReview.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(NewsSlateSanctum.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Game.GetPlayer().RemoveItem(NewsSlate.GetRef() as Form, 1, False, None)
  George.GetActorRef().AddItem(NewsSlate.GetRef() as Form, 1, False)
  If Self.GetStageDone(30) == True && Self.GetStageDone(40) == True
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Game.GetPlayer().RemoveItem(NewsSlateReview.GetRef() as Form, 1, False, None)
  Royce.GetActorRef().AddItem(NewsSlateReview.GetRef() as Form, 1, False)
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Game.GetPlayer().RemoveItem(NewsSlateSanctum.GetRef() as Form, 1, False, None)
  Catherine.GetActorRef().AddItem(NewsSlateSanctum.GetRef() as Form, 1, False)
  If Self.GetStageDone(20) == True && Self.GetStageDone(30) == True
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
