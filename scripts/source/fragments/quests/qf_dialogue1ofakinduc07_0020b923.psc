ScriptName Fragments:Quests:QF_Dialogue1OfAKindUC07_0020B923 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Unit99 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property UC07_EclipticEnemyFaction Auto Const mandatory
GlobalVariable Property PlayerKnows_Freestar1stCavalry Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0190_Item_00()
  Actor Unit99REF = Alias_Unit99.GetActorRef()
  Unit99REF.SetValue(Aggression, 2.0)
  Unit99REF.SetRestrained(False)
  Unit99REF.AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Unit99REF = Alias_Unit99.GetActorRef()
  Unit99REF.RemoveFromFaction(EclipticFaction)
  Unit99REF.AddToFaction(UC07_EclipticEnemyFaction)
  Self.SetStage(190)
EndFunction
