ScriptName Fragments:Quests:QF_RAD05_002AD3D5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_target Auto Const mandatory
ReferenceAlias Property Alias_LandryHollifeld Auto Const mandatory
MiscObject Property pCredits Auto Const mandatory
GlobalVariable Property RAD05_NumTimesCompleted Auto Const mandatory
GlobalVariable Property RAD05_TargetVariant Auto Const mandatory
GlobalVariable Property RAD05_QuestVariant Auto Const mandatory
RefCollectionAlias Property Alias_Guards01_Dieter Auto Const mandatory
Quest Property RAD05_Space_PirateEnc Auto Const mandatory
ReferenceAlias Property Alias_Tar01_PirateShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PirateFaction Auto Const mandatory
ReferenceAlias Property Alias_FinalMapMarker Auto Const mandatory
ReferenceAlias Property Alias_01_Dieter Auto Const mandatory
Quest Property DialogueUCNewAtlantis_LandryHollifeld Auto Const
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Loc03_Friendly_Overlay Auto Const mandatory
ReferenceAlias Property Alias_SpaceMapMarker Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_RAD05_Solace Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor aLandry = Alias_LandryHollifeld.GetActorRef()
  Game.GetPlayer().MoveTo(aLandry as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  If RAD05_TargetVariant.GetValue() == 1.0
    Self.SetStage(145)
  EndIf
  If RAD05_QuestVariant.GetValue() == 2.0
    Actor aTarg = Alias_target.GetActorRef()
    Actor aPlayer = Game.GetPlayer()
    aTarg.SetValue(Game.GetAggressionAV(), 2.0)
    aTarg.RemoveFromAllFactions()
    aTarg.AddToFaction(PlayerEnemyFaction)
    aTarg.AddToFaction(PirateFaction)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  If RAD05_TargetVariant.GetValue() == 1.0
    Self.SetObjectiveDisplayed(145, True, False)
    Alias_SpaceMapMarker.GetRef().Enable(False)
  Else
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
  If RAD05_QuestVariant.GetValue() == 0.0
    Alias_01_Dieter.GetRef().MoveTo(Alias_FinalMapMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
  If RAD05_QuestVariant.GetValue() == 3.0 && RAD05_TargetVariant.GetValue() == 1.0
    Alias_Loc03_Friendly_Overlay.GetRef().Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_0145_Item_00()
  Int I = 0
EndFunction

Function Fragment_Stage_0150_Item_00()
  RAD05_Space_PirateEnc.Start()
  Utility.Wait(1.0)
  ObjectReference oPirate = Alias_Tar01_PirateShip.GetRef()
  Alias_target.ForceRefTo(oPirate)
  (oPirate as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(145, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Actor aTarg = Alias_target.GetActorRef()
  Actor aPlayer = Game.GetPlayer()
  aTarg.RemoveFromAllFactions()
  aTarg.SetValue(Aggression, 2.0)
  aTarg.AddToFaction(PlayerEnemyFaction)
  aTarg.StartCombat(aPlayer as ObjectReference, False)
  If RAD05_NumTimesCompleted.GetValue() == 0.0
    Alias_Guards01_Dieter.StartCombatAll(aPlayer as ObjectReference)
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Game.GetPlayer().AddItem(pCredits as Form, 100, False)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetStage(200)
  Game.GetPlayer().AddItem(LL_Weapon_Reward_RAD05_Solace as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Float fTemp = RAD05_NumTimesCompleted.GetValue()
  RAD05_NumTimesCompleted.SetValue(fTemp + 1.0)
  Float fRandom = Utility.RandomInt(1, 3) as Float
  RAD05_TargetVariant.SetValue(RAD05_NumTimesCompleted.GetValue())
  fRandom = Utility.RandomInt(1, 2) as Float
  RAD05_QuestVariant.SetValue(1.0)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.FailAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  If RAD05_NumTimesCompleted.GetValue() < 4.0
    (DialogueUCNewAtlantis_LandryHollifeld as landyscript).RestartRAD05()
  EndIf
EndFunction
