ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Reliab_0011378F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property ResearchNotes Auto Const
ReferenceAlias Property AlexiLebedev Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(10)
  Self.SetObjectiveDisplayed(10, False, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  AlexiLebedev.GetActorRef().RemoveItem(ResearchNotes.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(ResearchNotes.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveCompleted(20, True)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().RemoveItem(ResearchNotes.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
