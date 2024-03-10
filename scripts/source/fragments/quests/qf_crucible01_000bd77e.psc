ScriptName Fragments:Quests:QF_Crucible01_000BD77E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property Crucible01_050_HolmesBark Auto Const mandatory
ObjectReference Property CrucibleMarker_CommonArea Auto Const mandatory
ReferenceAlias Property Alias_HH_Holmes Auto Const mandatory
ObjectReference Property Crucible01_InitialHolmesMarker Auto Const mandatory
Quest Property MS02 Auto Const mandatory
ActorValue Property Crucible01_ForeknowledgeAV Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_ExplosiveBarrels Auto Const mandatory
ReferenceAlias Property Alias_HH_Holmes_Name Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(CrucibleMarker_CommonArea, 0.0, 0.0, 0.0, True, False)
  MS02.SetStage(400)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_HH_Holmes.GetActorRef()
  aTarg.MoveTo(Crucible01_InitialHolmesMarker, 0.0, 0.0, 0.0, True, False)
  aTarg.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False)
  Crucible01_050_HolmesBark.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Actor aTarg = Alias_HH_Holmes.GetActorRef()
  aTarg.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  If Self.GetStageDone(120)
    Self.SetStage(150)
  EndIf
EndFunction

Function Fragment_Stage_0120_Item_00()
  If Self.GetStageDone(110)
    Self.SetStage(150)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Game.GetPlayer().SetValue(Crucible01_ForeknowledgeAV, 1.0)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_HH_Holmes_Name.ForceRefTo(Alias_HH_Holmes.GetRef())
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
  Actor aTarg = Alias_HH_Holmes.GetActorRef()
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False)
  aTarg.SetEssential(False)
  aTarg.AddToFaction(PlayerEnemyFaction)
  aTarg.EvaluatePackage(False)
  (Alias_ExplosiveBarrels.GetAt(0) as testexplodingbarrel).Explode()
  (Alias_ExplosiveBarrels.GetAt(1) as testexplodingbarrel).Explode()
  Alias_ExplosiveBarrels.GetAt(0).DamageObject(100.0)
  Alias_ExplosiveBarrels.GetAt(1).DamageObject(100.0)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(200)
  Self.CompleteAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
