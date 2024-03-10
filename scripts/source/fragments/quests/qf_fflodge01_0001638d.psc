ScriptName Fragments:Quests:QF_FFLodge01_0001638D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FFLodge01_001_OutsideScene Auto Const mandatory
Scene Property FFLodge01_003_LodgeScene Auto Const mandatory
ObjectReference Property MQ104BStart001 Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Heller Auto Const mandatory
Scene Property FFLodge01_002_BarrettScene Auto Const mandatory
Message Property FFLodge01LodgeMSG Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
ObjectReference Property VecteraExteriorNPCEnableMarker Auto Const mandatory
ObjectReference Property VecteraInteriorNPCEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Lin Auto Const mandatory
ReferenceAlias Property Alias_DoorToSensorArray Auto Const mandatory
ObjectReference Property MQ104BHellerMoveToMarker Auto Const mandatory
ObjectReference Property MQ104B_BarrettMovetoMarker Auto Const mandatory
Message Property MQ104BVectera_MedBenchMSG02 Auto Const mandatory
ReferenceAlias Property Alias_MedBenchTrigger Auto Const mandatory
ReferenceAlias Property Alias_BotTrigger Auto Const mandatory
ReferenceAlias Property Alias_CommsComputer Auto Const mandatory
Message Property MQ104BVectera_RobotMSG02 Auto Const mandatory
Book Property MQ104BHellerBarrettSlate Auto Const mandatory
Book Property MQ104BPirateBarrettSlate Auto Const mandatory
Scene Property MQ104B_005_OutsideScene Auto Const mandatory
ReferenceAlias Property Alias_Matsura Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property MQ104B_015_LodgeScene Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B_LinHeller_BaseDialogue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_MatsuraBodyguards Auto Const mandatory
ReferenceAlias Property Alias_HellerWoundedMarker Auto Const mandatory
ObjectReference Property MQ104B_BarrettDungeonStart Auto Const mandatory
ReferenceAlias Property Alias_HellerCrashStartMarker Auto Const mandatory
ReferenceAlias Property Alias_BarrettDungeonDoor Auto Const mandatory
ObjectReference Property MQ104B_EnableExteriorPiratesMarker Auto Const mandatory
Perk Property OutpostEngineering Auto Const mandatory
Perk Property InformationSystems Auto Const mandatory
Perk Property TraitEmpath Auto Const mandatory
ReferenceAlias Property Alias_BrokenComputerTrigger Auto Const mandatory
ReferenceAlias Property Alias_FirstBarrettSlateQuestObject Auto Const mandatory
MiscObject Property Mfg_Power_Circuit Auto Const mandatory
Scene Property MQ104B_001_LinScene Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
Scene Property MQ104B_014_LodgeScene Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property MQ104B_Lodge_MarkerBarrett01 Auto Const mandatory
ObjectReference Property MQ104BLinTravelMarker Auto Const mandatory
ObjectReference Property VecteraExteriorNPCEnableMarker001 Auto Const mandatory
Scene Property MQ104B_006_BarrettScene Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Perk Property Medicine Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Scene Property MQ104B_006d_MatsuraDeadScene Auto Const mandatory
ReferenceAlias Property Alias_VecteraMapMarker Auto Const mandatory
Quest Property LinEliteCrewQuest Auto Const
Quest Property HellerEliteCrewQuest Auto Const
ReferenceAlias Property Alias_SecondBarrettSlateQuestObject Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
wwiseevent Property OBJ_MQ104B_Computer_Repair Auto Const mandatory
wwiseevent Property OBJ_MQ104B_Power_Circuit Auto Const mandatory
ObjectReference Property MQ104B_BarrettCell_EnableMaker Auto Const mandatory
MiscObject Property Power_Cell Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ102.SetStage(1150)
  MQ101.SetStage(1810)
  Game.GetPlayer().moveto(MQ104BStart001, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(Credits as Form, 1000, False)
  Game.GetPlayer().AddPerk(OutpostEngineering, False)
  Game.GetPlayer().AddPerk(InformationSystems, False)
  Game.GetPlayer().AddPerk(TraitEmpath, False)
  Game.GetPlayer().AddPerk(Medicine, False)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker, 0.0, 0.0, 0.0, True, False)
  Alias_DoorToSensorArray.GetRef().Disable(False)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  Game.GetPlayer().moveto(Alias_HellerCrashStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(Credits as Form, 1000, False)
  Self.SetStage(5)
  Self.SetStage(110)
  Self.SetStage(115)
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  MQ102.CompleteQuest()
  Game.GetPlayer().moveto(MQ104B_BarrettDungeonStart, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().additem(Credits as Form, 1000, False)
  Game.GetPlayer().AddPerk(Medicine, False)
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False)
  Self.SetStage(5)
  Self.SetStage(130)
  Self.SetStage(132)
  MQ104B_BarrettCell_EnableMaker.Disable(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_VecteraMapMarker.GetRef().Enable(False)
  VecteraExteriorNPCEnableMarker001.Disable(False)
  VecteraInteriorNPCEnableMarker.Disable(False)
  Alias_Heller.GetActorRef().moveto(Alias_HellerWoundedMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Barrett.GetActorRef().moveto(MQ104B_BarrettMovetoMarker, 0.0, 0.0, 0.0, True, False)
  Alias_BarrettDungeonDoor.GetRef().Lock(False, False, True)
  Alias_CommsComputer.GetRef().Enable(False)
  Alias_CommsComputer.GetRef().BlockActivation(True, True)
  Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(5)
  MQ104B_LinHeller_BaseDialogue.Start()
  MQ104B_BarrettCell_EnableMaker.Disable(False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  MQ104B_001_LinScene.Start()
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Self.SetObjectiveDisplayedAtTop(30)
  Alias_BrokenComputerTrigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.RemoveItem(Power_Cell as Form, 3, False, None)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(40, True, False)
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef()
  Alias_BrokenComputerTrigger.GetRef().Disable(False)
  CommsComputerREF.BlockActivation(False, False)
  CommsComputerREF.PlayAnimation("Play01")
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveDisplayed(35, True, False)
  Alias_MedBenchTrigger.GetRef().Enable(False)
  Alias_BotTrigger.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(40, True, False)
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef()
  Alias_BrokenComputerTrigger.GetRef().Disable(False)
  CommsComputerREF.BlockActivation(False, False)
  CommsComputerREF.PlayAnimation("Play01")
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_BrokenComputerTrigger.GetRef().Disable(False)
  Game.GetPlayer().addaliaseditem(MQ104BHellerBarrettSlate as Form, Alias_FirstBarrettSlateQuestObject as Alias, 1, True)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().additem(Power_Cell as Form, 1, False)
  If Self.GetStageDone(80) && Self.GetStageDone(70)
    Self.SetStage(90)
  EndIf
EndFunction

Function Fragment_Stage_0070_Item_00()
  MQ104BVectera_MedBenchMSG02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Game.GetPlayer().additem(Power_Cell as Form, 1, False)
  If Self.GetStageDone(60) && Self.GetStageDone(80)
    Self.SetStage(90)
  EndIf
  Alias_MedBenchTrigger.GetRef().Disable(False)
  OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

Function Fragment_Stage_0080_Item_00()
  MQ104BVectera_RobotMSG02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Game.GetPlayer().additem(Power_Cell as Form, 1, False)
  If Self.GetStageDone(60) && Self.GetStageDone(70)
    Self.SetStage(90)
  EndIf
  Alias_BotTrigger.GetRef().Disable(False)
  OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(35, True)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(40, True, False)
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef()
  Alias_BrokenComputerTrigger.GetRef().Disable(False)
  CommsComputerREF.BlockActivation(False, False)
  CommsComputerREF.PlayAnimation("Play01")
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(60, True, False)
  Actor PlayerREF = Game.GetPlayer()
  If PlayerREF.GetItemCount(MQ104BHellerBarrettSlate as Form) == 0
    PlayerREF.additem(MQ104BHellerBarrettSlate as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(65, True, False)
  Self.SetObjectiveDisplayed(67, True, False)
  LinEliteCrewQuest.SetStage(1)
EndFunction

Function Fragment_Stage_0112_Item_00()
  Self.SetObjectiveCompleted(67, True)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(65, True)
  Self.SetObjectiveDisplayed(70, True, False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(92, True)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Game.GetPlayer().addaliaseditem(MQ104BPirateBarrettSlate as Form, Alias_SecondBarrettSlateQuestObject as Alias, 1, True)
  Self.SetObjectiveCompleted(70, True)
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(85, True, False)
  Self.SetObjectiveDisplayed(92, True, False)
  HellerEliteCrewQuest.SetStage(1)
  Alias_Heller.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0131_Item_00()
  Self.SetObjectiveCompleted(85, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetObjectiveCompleted(85, True)
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0140_Item_00()
  MQ104B_005_OutsideScene.Start()
EndFunction

Function Fragment_Stage_0150_Item_00()
  MQ104B_005_OutsideScene.Stop()
  MQ104B_006_BarrettScene.Start()
EndFunction

Function Fragment_Stage_0240_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Actor MatsuraREF = Alias_Matsura.GetActorRef()
  MatsuraREF.AddtoFaction(PlayerEnemyFaction)
  Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction)
  MatsuraREF.StartCombat(Game.GetPlayer() as ObjectReference, False)
  Self.SetObjectiveDisplayed(105, True, False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(105, True)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, True, False)
  If Self.GetStageDone(260) == False
    MQ104B_EnableExteriorPiratesMarker.Disable(False)
  EndIf
  (SQ_Followers as sq_followersscript).SetRoleActive(Alias_Barrett.GetActorRef(), True, True, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(110, True)
  Self.SetObjectiveDisplayed(115, True, False)
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  (SQ_Followers as sq_followersscript).SetRoleInActive(BarrettREF, True, False, True)
  BarrettREF.moveto(MQ104B_Lodge_MarkerBarrett01, 0.0, 0.0, 0.0, True, False)
  BarrettREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  MQ104B_014_LodgeScene.Start()
  Self.SetObjectiveCompleted(115, True)
  Self.SetObjectiveDisplayed(120, True, False)
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveCompleted(120, True)
  Self.SetObjectiveDisplayed(130, True, False)
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0407_Item_00()
  Alias_Barrett.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(BarrettREF, True)
  (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0)
  BarrettREF.EvaluatePackage(False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef()
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(BarrettREF, True)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  If MQ103.GetStageDone(2000) && MQ104A.GetStageDone(1000)
    MQ105.SetStage(10)
  EndIf
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor MatsuraREF = Alias_Matsura.GetActorRef()
  MatsuraREF.AddtoFaction(PlayerEnemyFaction)
  Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction)
EndFunction
