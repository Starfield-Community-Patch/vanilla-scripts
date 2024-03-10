ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Suspic_00112864 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property IsaacStrum Auto Const
ReferenceAlias Property LouisKing Auto Const
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property KarsonEndler Auto Const
MiscObject Property Credits Auto Const
Scene Property LoopingThievesScene Auto Const
Scene Property Post20ThiefLoopScene Auto Const
GlobalVariable Property City_NA_Z_SuspiciousGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  IsaacStrum.GetActorRef().Enable(False)
  LouisKing.GetActorRef().Enable(False)
  KarsonEndler.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  IsaacStrum.GetActorRef().Enable(False)
  LouisKing.GetActorRef().Enable(False)
  KarsonEndler.GetActorRef().Enable(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(25, True, False)
  LoopingThievesScene.Stop()
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Post20ThiefLoopScene.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(35, True, False)
  IsaacStrum.GetActorRef().SetEssential(False)
  LouisKing.GetActorRef().SetEssential(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayedAtTop(35)
  IsaacStrum.GetActorRef().SetEssential(False)
  LouisKing.GetActorRef().SetEssential(False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveFailed(35, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  IsaacStrum.GetActorRef().AddToFaction(PlayerEnemyFaction)
  LouisKing.GetActorRef().AddToFaction(PlayerEnemyFaction)
  IsaacStrum.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  LouisKing.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(40, False, False)
  Self.SetObjectiveDisplayed(50, False, False)
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Self.SetStage(55)
EndFunction

Function Fragment_Stage_0055_Item_00()
  KarsonEndler.GetActorRef().EvaluatePackage(False)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0057_Item_00()
  IsaacStrum.GetActorRef().EvaluatePackage(False)
  LouisKing.GetActorRef().EvaluatePackage(False)
  Post20ThiefLoopScene.Stop()
  IsaacStrum.GetActorRef().SetEssential(True)
  LouisKing.GetActorRef().SetEssential(True)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveFailed(35, True)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, City_NA_Z_SuspiciousGlobal.GetValueInt(), False)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveFailed(35, True)
  Self.SetObjectiveDisplayed(60, True, False)
  IsaacStrum.GetActorRef().EvaluatePackage(False)
  LouisKing.GetActorRef().EvaluatePackage(False)
  Self.SetStage(70)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  IsaacStrum.GetActorRef().Disable(False)
  LouisKing.GetActorRef().Disable(False)
  KarsonEndler.GetActorRef().Disable(False)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  KarsonEndler.GetActorRef().Disable(False)
  Self.Stop()
EndFunction
