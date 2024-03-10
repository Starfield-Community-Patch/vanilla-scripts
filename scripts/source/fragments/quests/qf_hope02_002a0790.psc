ScriptName Fragments:Quests:QF_Hope02_002A0790 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AdellaFaheem Auto Const mandatory
ReferenceAlias Property Alias_Ernesto Auto Const mandatory
Book Property Hope02_FaheemSlate Auto Const mandatory
ReferenceAlias Property Alias_FaheemSlate Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property Hope02_050_AdellaBark Auto Const mandatory
GlobalVariable Property Hope02_Foreknowledge_KilledErnesto Auto Const mandatory
ActorValue Property Hope02_Foreknowledge_KilledErnestoAV Auto Const mandatory
Scene Property Hope02_SalShout Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_AdellaFaheem.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Hope02_050_AdellaBark.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Game.GetPlayer().AddAliasedItem(Hope02_FaheemSlate as Form, Alias_FaheemSlate as Alias, 1, True)
  Alias_Ernesto.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Actor aTarg = Alias_Ernesto.GetActorRef()
  Actor aPlayer = Game.GetPlayer()
  aTarg.StartCombat(aPlayer as ObjectReference, False)
  aTarg.AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Game.GetPlayer().SetValue(Hope02_Foreknowledge_KilledErnestoAV, 1.0)
  Hope02_SalShout.Start()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.CompleteAllObjectives()
  Self.SetObjectiveCompleted(300, True)
  Alias_AdellaFaheem.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_Ernesto.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.CompleteAllObjectives()
  Alias_AdellaFaheem.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_AdellaFaheem.GetRef().Disable(False)
  Alias_Ernesto.GetRef().Disable(False)
  Self.Stop()
EndFunction
