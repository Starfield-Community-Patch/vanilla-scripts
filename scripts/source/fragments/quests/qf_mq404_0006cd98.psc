ScriptName Fragments:Quests:QF_MQ404_0006CD98 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ201 Auto Const mandatory
Quest Property MQ201B Auto Const mandatory
ReferenceAlias Property Alias_ArmillaryMount Auto Const mandatory
GlobalVariable Property MQ_EmissaryRandom Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
Scene Property MQ404_002_HunterScene Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Quest Property MQ206B Auto Const mandatory
ReferenceAlias Property Alias_TheScow Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
Static Property XMarkerHeading Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
Message Property MQ204ArmillaryBuildMSG_NGPlus Auto Const mandatory
Message Property MQ204ArmillaryBuildMSG Auto Const mandatory
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property Alias_HomeShipArmillaryScreenTrigger Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory
EffectShader Property Starborn_EntryShader Auto Const mandatory
ObjectReference Property MQ202TurretEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If MQ201.IsRunning()
    MQ201.SetStage(2000)
  EndIf
  If MQ201B.IsRunning()
    MQ201B.SetStage(2000)
  EndIf
  Self.SetObjectiveDisplayed(10, True, False)
  ArmillaryMountSwapEnableMarker.Disable(False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest
  mq404script kmyQuest = __temp as mq404script
  Actor PlayerREF = Game.GetPlayer()
  ObjectReference ArmillaryMountREF = Alias_ArmillaryMount.GetRef()
  ObjectReference ArmillaryREF = Alias_Armillary.GetRef()
  (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF)
  ArmillaryMountREF.BlockActivation(True, True)
  ArmillaryREF.DisableNoWait(False)
  kmyQuest.WaitForWorkshopMenuClose()
  MQAlllowArmillaryGravDrive.SetValueInt(1)
  Alias_HomeShipArmillaryScreenTrigger.GetRef().Enable(False)
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
  MQ204ArmillaryBuildMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0120_Item_01()
  Self.SetStage(130)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Actor PlayerREF = Game.GetPlayer()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  ObjectReference HunterMarker = PlayerREF.PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, None, None, True)
  HunterMarker.MoveToNearestNavmeshLocation()
  HunterREF.moveto(HunterMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
  Starborn_EntryShader.Play(HunterREF as ObjectReference, -1.0)
  Utility.Wait(1.0)
  MQ404_002_HunterScene.Start()
  Utility.Wait(1.0)
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.StopDialogueCamera(False, False)
  MQ404_002_HunterScene.Stop()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Actor HunterREF = Alias_Hunter.GetActorRef()
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
  Starborn_DeathShader.Play(HunterREF as ObjectReference, -1.0)
  AbStarbornDeath.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference)
  Utility.Wait(3.0)
  HunterREF.moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False)
  AbStarbornTeleport.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference)
  Alias_TheScow.GetShipRef().DisableNoWait(False)
  MQ202TurretEnableMarker.DisableNoWait(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives()
  MQ206B.SetStage(100)
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  MQ_EmissaryRandom.SetValueInt(1)
  MQ_EmissaryRevealed.SetValueInt(1)
EndFunction
