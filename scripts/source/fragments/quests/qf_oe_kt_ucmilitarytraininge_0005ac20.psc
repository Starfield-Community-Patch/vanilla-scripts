ScriptName Fragments:Quests:QF_OE_KT_UCMilitaryTrainingE_0005AC20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_UCTrainingExercise_MoveTo Auto Const mandatory
Scene Property OE_KT_UCTrainingExercise_Scene01 Auto Const mandatory
RefCollectionAlias Property Alias_ModelA_Group Auto Const mandatory
RefCollectionAlias Property Alias_ModelS_Grouip Auto Const mandatory
Faction Property UnitedColoniesMarineFaction Auto Const mandatory
Scene Property OE_KT_UCTrainingExercise_Scene02 Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
Faction Property OE_GroupEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group02 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Perk Property OE_KT_ModDamageResistancePerk Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  OE_KT_UCTrainingExercise_Scene02.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  OE_KT_UCTrainingExercise_MoveTo.Stop()
  OE_KT_UCTrainingExercise_Scene01.Start()
  Actor[] ModelA = Alias_ModelA_Group.GetActorArray()
  Actor[] ModelS = Alias_ModelS_Grouip.GetActorArray()
  ObjectReference[] NPCs = Alias_NPC_Group00.GetArray()
  Int I = 0
  While I < ModelA.Length
    Alias_NPC_Group02.AddRef(ModelA[I] as ObjectReference)
    ModelA[I].AddPerk(OE_KT_ModDamageResistancePerk, False)
    I += 1
  EndWhile
  Int k = 0
  While k < ModelS.Length
    Alias_NPC_Group02.AddRef(ModelS[k] as ObjectReference)
    ModelS[k].AddPerk(OE_KT_ModDamageResistancePerk, False)
    k += 1
  EndWhile
  Int j = 0
  While j < NPCs.Length
    Alias_NPC_Group02.AddRef(NPCs[j])
    j += 1
  EndWhile
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ModelA_Group.RemoveFromFaction(UnitedColoniesMarineFaction)
  Alias_ModelA_Group.RemoveFromFaction(REPlayerFriend)
  Alias_ModelS_Grouip.RemoveFromFaction(UnitedColoniesMarineFaction)
  Alias_ModelS_Grouip.RemoveFromFaction(REPlayerFriend)
  Alias_ModelA_Group.AddtoFaction(OE_GroupEnemyFaction)
  Alias_ModelS_Grouip.AddtoFaction(OE_GroupEnemyFaction)
  Alias_ModelA_Group.SetValue(Aggression, 1.0)
  Alias_ModelS_Grouip.SetValue(Aggression, 1.0)
  Alias_ModelA_Group.StartCombatAll(Alias_NPC02.GetActorRef() as ObjectReference)
  Alias_ModelS_Grouip.StartCombatAll(Alias_NPC01.GetActorRef() as ObjectReference)
  Alias_NPC_Group00.EvaluateAll()
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(80)
EndFunction

Function Fragment_Stage_0064_Item_00()
  Self.SetStage(66)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetStage(50)
  Alias_ModelA_Group.AddtoFaction(PlayerEnemyFaction)
  Alias_ModelS_Grouip.AddtoFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_0066_Item_00()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  If !Self.GetStageDone(80)
    Alias_NPC_Group02.AddtoFaction(PlayerEnemyFaction)
    Alias_NPC_Group02.RemoveFromFaction(REPlayerFriend)
    Alias_NPC_Group02.SetValue(Aggression, 1.0)
    Alias_NPC_Group02.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Else
    Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
    Alias_NPC_Group00.SetValue(Aggression, 1.0)
    Alias_NPC_Group00.RemoveFromFaction(REPlayerFriend)
    Alias_NPC_Group00.StartCombatAll(Game.GetPlayer() as ObjectReference)
  EndIf
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetStage(80)
EndFunction

Function Fragment_Stage_0080_Item_00()
  OE_KT_UCTrainingExercise_Scene02.Start()
  ObjectReference[] Marines = Alias_NPC_Group00.GetArray()
  Int I = 0
  While I < Marines.Length
    (Marines[I] as Actor).RemoveFromFaction(REPlayerFriend)
    (Marines[I] as Actor).EvaluatePackage(False)
    Alias_NPC_Group02.AddRef(Marines[I])
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0090_Item_00()
  OE_KT_UCTrainingExercise_Scene02.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  OE_KT_UCTrainingExercise_MoveTo.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop()
EndFunction
