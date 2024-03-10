ScriptName Fragments:Quests:QF_City_Akila_Jansen_001A8B64 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Akila_Jansen_MilenaSpace Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_MarkoJensan Auto Const mandatory
ReferenceAlias Property Alias_SimoneJansen Auto Const mandatory
Keyword Property AnimArchetypeFriendly Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(25, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  City_Akila_Jansen_MilenaSpace.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Alias_MarkoJensan.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
  Alias_SimoneJansen.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(500)
  Game.GetPlayer().RemoveItem(Credits as Form, 1000, False, None)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
