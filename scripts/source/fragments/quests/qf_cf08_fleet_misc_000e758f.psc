ScriptName Fragments:Quests:QF_CF08_Fleet_Misc_000E758F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property CF08_010_KeyScenes_Pre01 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_D Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_C Auto Const mandatory
Scene Property CF08_010_KeyScenes_Pre02 Auto Const mandatory
Scene Property CF08_000_KeyScenes_Start Auto Const mandatory
ReferenceAlias Property Alias_Reaver Auto Const mandatory
Scene Property CF08_010_KeyScenes_Pre03 Auto Const mandatory
Scene Property CF08_010_KeyScenes_Pre04 Auto Const mandatory
ReferenceAlias Property Alias_OperationsMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01_MarkerA Auto Const mandatory
ReferenceAlias Property Alias_OperationsMarker03 Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post01 Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Estelle Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Mathis Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Huan Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Adler Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_E Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_F Auto Const mandatory
ReferenceAlias[] Property CF08_Misc Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post04 Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post05 Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01_DockingNPC02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01_DockingNPC01 Auto Const mandatory
ReferenceAlias[] Property CF08_Captains Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post06 Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Naeva Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
ReferenceAlias Property Alias_Key_MiscEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_MathisReplacement Auto Const mandatory
Scene Property CREW_EliteCrew_MathisCastillo_RecruitScene Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCA Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_SpacePirate_02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCC Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCD Auto Const mandatory
ActorBase Property LvlCrimsonFleet_Male Auto Const mandatory
ActorBase Property LvlCrimsonFleet_Female Auto Const mandatory
ActorBase Property CF_TheKey_Fleet_NoSpacesuit Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerD Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerC Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerA Auto Const mandatory
ActorBase Property CF_TheKey_GenericFleet_CaptainPatrol_Operations04 Auto Const mandatory
ReferenceAlias Property Alias_Operations_Actor05 Auto Const mandatory
ReferenceAlias Property Alias_Operations_Actor06 Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCB Auto Const mandatory
ReferenceAlias Property Alias_MathisSitMarker Auto Const mandatory
ReferenceAlias Property Alias_NaevaSitMarker Auto Const mandatory
Weapon Property Tombstone Auto Const mandatory
ObjectReference Property CFPost_Fleet_Mathis_Forcegreet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)
  DialogueCFTheKey.SetStage(300)
  LC088_Vigilance.SetStage(1100)
  Self.SetStage(100)
  Game.GetPlayer().MoveTo(Alias_Key_Scene01_DockingNPC02.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(2)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Actor FleetRef = Alias_Key_Scene01NPC_C.GetActorRef()
  If FleetRef.IsDead()
    Alias_Key_Scene01NPC_C.ForceRefTo(FleetRef.PlaceAtMe(CF_TheKey_Fleet_NoSpacesuit as Form, 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_01()
  Actor FleetRef = Alias_Key_Scene02_NPCC.GetActorRef()
  FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerC.GetRef(), 0.0, 0.0, 0.0, True, False)
  If FleetRef.IsDead()
    Alias_Key_Scene02_NPCC.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Female as Form, 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_02()
  Actor FleetRef = Alias_Key_Scene02_NPCD.GetActorRef()
  FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerD.GetRef(), 0.0, 0.0, 0.0, True, False)
  If FleetRef.IsDead()
    Alias_Key_Scene02_NPCD.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Male as Form, 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_03()
  Actor FleetRef = Alias_Key_Scene01NPC_D.GetActorRef()
  If FleetRef.IsDead()
    Alias_Key_Scene01NPC_D.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Male as Form, 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function Fragment_Stage_0004_Item_04()
  Actor FleetRef = Alias_Key_Scene02_NPCA.GetActorRef()
  FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerA.GetRef(), 0.0, 0.0, 0.0, True, False)
  If FleetRef.IsDead()
    Alias_Key_Scene02_NPCA.ForceRefTo(FleetRef.PlaceAtMe(CF_TheKey_GenericFleet_CaptainPatrol_Operations04 as Form, 1, False, False, True, None, None, True))
  EndIf
EndFunction

Function Fragment_Stage_0005_Item_00()
  CF08_000_KeyScenes_Start.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  CF08_000_KeyScenes_Start.Stop()
  CF08_010_KeyScenes_Pre01.Start()
  DialogueUCVigilance.SetStage(4)
  Alias_CaptainSit_Mathis.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_Mathis.GetRef().MoveTo(Alias_CaptainSit_Mathis.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_02()
  Alias_Mathis.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  CF08_010_KeyScenes_Pre01.Stop()
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_Key_Scene02_NPCC.GetActorRef().EvaluatePackage(False)
  Alias_Key_Scene02_NPCB.GetActorRef().EvaluatePackage(False)
  Alias_Key_Scene02_NPCD.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  CF08_010_KeyScenes_Pre02.Start()
  Alias_OperationsMarker02.GetRef().DisableNoWait(False)
  Alias_OperationsMarker03.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  CF08_010_KeyScenes_Pre03.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  CF08_010_KeyScenes_Pre04.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Key_MiscEnableMarker.GetRef().EnableNoWait(False)
  Alias_Key_Scene01_MarkerA.GetRef().EnableNoWait(False)
  Alias_Key_Scene01NPC_E.GetRef().EnableNoWait(False)
  Alias_Key_Scene01NPC_F.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  CF08_010_KeyScenes_Pre01.Stop()
  CF08_010_KeyScenes_Pre02.Stop()
  CF08_010_KeyScenes_Pre03.Stop()
  CF08_010_KeyScenes_Pre04.Stop()
  CF08_110_KeyScenes_Post01.Start()
  Alias_Operations_Actor05.GetRef().DisableNoWait(False)
  Alias_Operations_Actor06.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0115_Item_00()
  CF08_110_KeyScenes_Post01.Stop()
  CF08_110_KeyScenes_Post02.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Actor AdlerRef = Alias_Adler.GetActorRef()
  AdlerRef.EnableNoWait(False)
  AdlerRef.MoveTo(Alias_CaptainSit_Adler.GetRef(), 0.0, 0.0, 0.0, True, False)
  AdlerRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0120_Item_01()
  Actor EstelleRef = Alias_Estelle.GetActorRef()
  EstelleRef.EnableNoWait(False)
  EstelleRef.MoveTo(Alias_CaptainSit_Estelle.GetRef(), 0.0, 0.0, 0.0, True, False)
  EstelleRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0120_Item_02()
  Actor HuanRef = Alias_Huan.GetActorRef()
  HuanRef.EnableNoWait(False)
  HuanRef.MoveTo(Alias_CaptainSit_Huan.GetRef(), 0.0, 0.0, 0.0, True, False)
  HuanRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0120_Item_03()
  Actor MathisRef = Alias_Mathis.GetActorRef()
  MathisRef.EnableNoWait(False)
  MathisRef.MoveTo(Alias_CaptainSit_Mathis.GetRef(), 0.0, 0.0, 0.0, True, False)
  MathisRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0120_Item_04()
  Actor RokovRef = Alias_Rokov.GetActorRef()
  RokovRef.EnableNoWait(False)
  RokovRef.MoveTo(Alias_CaptainSit_Rokov.GetRef(), 0.0, 0.0, 0.0, True, False)
  RokovRef.SetCrimeFaction(CrimeFactionCrimsonFleet)
EndFunction

Function Fragment_Stage_0120_Item_05()
  Alias_MathisReplacement.GetRef().EnableNoWait(False)
  Self.SetStage(125)
EndFunction

Function Fragment_Stage_0120_Item_06()
  Alias_Mathis.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_Key_Scene02_NPCC.GetActorRef().EquipItem(Tombstone as Form, True, False)
  CF08_110_KeyScenes_Post01.Stop()
  CF08_110_KeyScenes_Post02.Stop()
  CF08_110_KeyScenes_Post04.Start()
  Alias_Key_Scene01_DockingNPC01.Clear()
  Alias_Key_Scene01_DockingNPC02.Clear()
  Alias_Key_Scene01NPC_C.GetRef().DisableNoWait(False)
  Alias_Key_Scene01NPC_E.GetRef().DisableNoWait(False)
  Alias_Key_Scene01NPC_F.GetRef().DisableNoWait(False)
  ObjectReference MathisMarker = Alias_MathisSitMarker.GetRef()
  ObjectReference NaevaMarker = Alias_NaevaSitMarker.GetRef()
  ObjectReference Mathis = Alias_Mathis.GetRef()
  Actor Naeva = Alias_Naeva.GetActorRef()
  If !Mathis.IsDisabled()
    MathisMarker.EnableNoWait(False)
    Mathis.MoveTo(MathisMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  If Naeva.IsDisabled()
    Naeva.EnableNoWait(False)
  EndIf
  Naeva.SnapIntoInteraction(NaevaMarker)
EndFunction

Function Fragment_Stage_0140_Item_00()
  CF08_110_KeyScenes_Post05.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  CF08_110_KeyScenes_Post06.Start()
EndFunction

Function Fragment_Stage_0450_Item_00()
  CFPost_Fleet_Mathis_Forcegreet.DisableNoWait(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Huan.Clear()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_OperationsMarker02.GetRef().EnableNoWait(False)
  Alias_Operations_Actor05.GetRef().EnableNoWait(False)
  Alias_Operations_Actor06.GetRef().EnableNoWait(False)
  Int I = 0
  While I < CF08_Misc.Length
    CF08_Misc[I].GetRef().DisableNoWait(False)
    I += 1
  EndWhile
  Alias_CaptainSit_Mathis.GetRef().DisableNoWait(False)
  Self.Stop()
EndFunction
