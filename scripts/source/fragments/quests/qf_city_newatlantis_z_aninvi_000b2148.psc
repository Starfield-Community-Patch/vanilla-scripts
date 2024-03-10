ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_AnInvi_000B2148 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Marcus Auto Const mandatory
ReferenceAlias Property Alias_Slate1 Auto Const mandatory
ReferenceAlias Property Alias_Slate2 Auto Const mandatory
ReferenceAlias Property Alias_Slate3 Auto Const mandatory
ReferenceAlias Property Alias_Tony Auto Const mandatory
ReferenceAlias Property Alias_Johann Auto Const mandatory
ReferenceAlias Property Alias_Evie Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().moveto(Alias_Marcus.GetActorRef() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate1.GetRef() as Form, 1, False, None)
  Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate2.GetRef() as Form, 1, False, None)
  Alias_Marcus.GetActorRef().RemoveItem(Alias_Slate3.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(Alias_Slate1.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Slate2.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Slate3.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Game.GetPlayer().RemoveItem(Alias_Slate1.GetRef() as Form, 1, False, None)
  Alias_Tony.GetActorRef().AddItem(Alias_Slate1.GetRef() as Form, 1, False)
  If Self.GetStageDone(30) == True && Self.GetStageDone(40) == True
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Game.GetPlayer().RemoveItem(Alias_Slate2.GetRef() as Form, 1, False, None)
  Alias_Evie.GetActorRef().AddItem(Alias_Slate2.GetRef() as Form, 1, False)
  If Self.GetStageDone(20) == True && Self.GetStageDone(40) == True
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Game.GetPlayer().RemoveItem(Alias_Slate3.GetRef() as Form, 1, False, None)
  Alias_Johann.GetActorRef().AddItem(Alias_Slate3.GetRef() as Form, 1, False)
  If Self.GetStageDone(20) == True && Self.GetStageDone(30) == True
    Self.SetStage(50)
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.Stop()
EndFunction
