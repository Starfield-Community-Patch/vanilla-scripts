ScriptName Fragments:Quests:QF_City_AkilaLife01_0011463F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnnieWilcox Auto Const mandatory
ReferenceAlias Property Alias_EmilyCartwright Auto Const mandatory
Scene Property City_AkilaLife01_050_KidTalk Auto Const mandatory
ObjectReference Property AkilaLife01_StartMarker Auto Const mandatory
Keyword Property AkilaLife01_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Thief Auto Const mandatory
ReferenceAlias Property Alias_Security Auto Const mandatory
Scene Property City_AkilaLife01_200b_SecurityShowsUp Auto Const mandatory
Scene Property City_AkilaLife01_175_GuardBarks Auto Const mandatory
ReferenceAlias Property Alias_EmmaWilcox Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(AkilaLife01_StartMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  ObjectReference oTarg = Alias_AnnieWilcox.GetActorRef() as ObjectReference
  oTarg.MoveTo(oTarg.GetLinkedRef(AkilaLife01_Keyword), 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_EmilyCartwright.GetActorRef() as ObjectReference
  oTarg.MoveTo(oTarg.GetLinkedRef(AkilaLife01_Keyword), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  City_AkilaLife01_050_KidTalk.Start()
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor ThiefRef = Alias_Thief.GetActorRef()
  ThiefRef.Enable(False)
  ThiefRef.EvaluatePackage(False)
  ThiefRef.AllowBleedoutDialogue(True)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Utility.wait(0.300000012)
  Alias_Thief.GetActorReference().StopCombat()
EndFunction

Function Fragment_Stage_0175_Item_00()
  City_AkilaLife01_200b_SecurityShowsUp.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Security.GetActorRef().Enable(False)
  Alias_Security.GetActorRef().EvaluatePackage(False)
  City_AkilaLife01_175_GuardBarks.Start()
  Alias_AnnieWilcox.GetRef().MoveTo(Alias_EmmaWilcox.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_Thief.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.CompleteAllObjectives()
  Alias_Thief.GetActorRef().Disable(False)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
