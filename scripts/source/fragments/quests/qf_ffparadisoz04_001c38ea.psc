ScriptName Fragments:Quests:QF_FFParadisoZ04_001C38EA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guest Auto Const mandatory
Topic Property FFParadisoZ04_0250_Guest_Say_Surrender Auto Const mandatory
Scene Property FFParadisoZ04_0100_Guest_Greeting_Confront Auto Const mandatory
ReferenceAlias Property Alias_RoomKey Auto Const mandatory
Quest Property FFParadisoZ04Misc Auto Const mandatory
ReferenceAlias Property Alias_GuestMarker Auto Const mandatory
Faction Property ParadisoFaction Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
ReferenceAlias Property Alias_Security Auto Const mandatory
ActorValue Property FFParadisoZ04_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FFParadisoZ04Misc.SetStage(1000)
  Game.GetPlayer().AddItem(Alias_RoomKey.GetRef() as Form, 1, False)
  Self.SetObjectiveDisplayed(100, True, False)
  ObjectReference myGuest = Alias_Guest.GetRef()
  myGuest.MoveTo(Alias_GuestMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  myGuest.Enable(False)
  (myGuest as Actor).RemoveFromFaction(ParadisoFaction)
  (myGuest as Actor).RemoveFromFaction(CrimeFactionParadiso)
  (myGuest as Actor).SetNoBleedoutRecovery(True)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Guest.GetActorRef().EvaluatePackage(False)
  FFParadisoZ04_0100_Guest_Greeting_Confront.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor myGuest = Alias_Guest.GetActorRef()
  myGuest.StartCombat(Game.GetPlayer() as ObjectReference, True)
  myGuest.EvaluatePackage(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Actor myGuest = Alias_Guest.GetActorRef()
  myGuest.Say(FFParadisoZ04_0250_Guest_Say_Surrender, None, False, None)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor mySecurity = Alias_Security.GetActorRef()
  mySecurity.Enable(False)
  mySecurity.EvaluatePackage(False)
  Alias_Guest.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_Guest.GetRef().Disable(False)
  Alias_Security.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().SetValue(FFParadisoZ04_Foreknowledge_AV, 1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
