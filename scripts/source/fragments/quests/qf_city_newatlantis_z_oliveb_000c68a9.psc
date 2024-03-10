ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_OliveB_000C68A9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property City_NA_Z_OliveBranch_Seed Auto Const mandatory
ReferenceAlias Property Alias_Seeds Auto Const mandatory
Scene Property City_NewAtlantis_Z_OliveBranch_Guard Auto Const mandatory
ReferenceAlias Property Alias_SeedMarker Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ReferenceAlias Property Alias_GuardMarker Auto Const mandatory
ReferenceAlias Property Alias_Nilesh Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
Message Property City_Z_OliveBranch_NoActivate Auto Const mandatory
Scene Property City_NewAtlantis_Z_OliveBranch_GuardDistraction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Nilesh.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_Guard.GetActorRef().RemoveFromFaction(GuardFaction)
EndFunction

Function Fragment_Stage_0003_Item_00()
  City_NewAtlantis_Z_OliveBranch_GuardDistraction.Stop()
  Alias_Guard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Guard.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveSkipped(20)
  Self.SetObjectiveSkipped(25)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_SeedMarker.GetRef().EnableNoWait(False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  ObjectReference SeedRef = PlayerRef.PlaceAtMe(City_NA_Z_OliveBranch_Seed as Form, 1, False, False, True, None, None, True)
  Alias_Seeds.ForceRefTo(SeedRef)
  PlayerRef.AddItem(SeedRef as Form, 1, False)
  ObjectReference GuardRef = Alias_Guard.GetRef()
  ObjectReference GuardMarkerRef = Alias_GuardMarker.GetRef()
  If GuardRef.GetDistance(GuardMarkerRef) > 10.0
    GuardRef.MoveTo(GuardMarkerRef, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(25, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  City_Z_OliveBranch_NoActivate.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0020_Item_01()
  City_NewAtlantis_Z_OliveBranch_Guard.Start()
EndFunction

Function Fragment_Stage_0020_Item_02()
  If Game.GetPlayer().IsDetectedBy(Alias_Guard.GetActorRef())
    City_NewAtlantis_Z_OliveBranch_Guard.Start()
  Else
    Self.SetStage(30)
  EndIf
EndFunction

Function Fragment_Stage_0021_Item_00()
  Self.SetObjectiveSkipped(10)
  Self.SetObjectiveSkipped(25)
  Self.SetObjectiveCompleted(20, True)
  Game.GetPlayer().RemoveItem(City_NA_Z_OliveBranch_Seed as Form, 1, False, None)
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(25, True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_SeedMarker.GetRef().DisableNoWait(False)
  Game.GetPlayer().RemoveItem(City_NA_Z_OliveBranch_Seed as Form, 1, False, None)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveSkipped(20)
  If !Self.GetStageDone(25)
    Self.SetObjectiveSkipped(25)
  EndIf
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_SeedMarker.GetRef().DisableNoWait(False)
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Guard.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction
