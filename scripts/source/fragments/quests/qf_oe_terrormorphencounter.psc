ScriptName Fragments:Quests:QF_OE_TerrormorphEncounter Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_SpawnFurniture Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCorpse Auto Const mandatory
ReferenceAlias Property Alias_VanguardCommander Auto Const mandatory
ReferenceAlias Property Alias_Aceles Auto Const mandatory
ReferenceAlias Property Alias_VanguardAcelesHandler Auto Const mandatory
ReferenceAlias Property Alias_VanguardInjured Auto Const mandatory
ReferenceAlias Property Alias_VanguardVendor Auto Const mandatory
ReferenceAlias Property Alias_MarkerAmbush Auto Const mandatory
Scene Property Scene_InjuredVanguardDies Auto Const mandatory
Scene Property Scene_CommanderArrived Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(75)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor Vanguard = Alias_VanguardCommander.GetActorRef()
  Actor Aceles = Alias_Aceles.GetActorRef()
  Actor Terrormorph = Alias_Terrormorph.GetActorRef()
  Alias_RewardContainer.GetRef().Lock(True, False, True)
  Terrormorph.EvaluatePackage(False)
  If Vanguard != None
    Vanguard.EvaluatePackage(False)
  EndIf
  If Aceles != None
    Aceles.EvaluatePackage(False)
  EndIf
  If Alias_VanguardCommander.GetRef() == None
    Self.SetStage(999)
  EndIf
  Self.SetStage(75)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_VanguardInjured.GetActorRef().EvaluatePackage(False)
  Self.SetStage(210)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0120_Item_00()
  If Game.GetPlayer().GetItemCount(Aid_MedPack as Form) >= 1
    Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None)
  EndIf
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Actor InjuredVanguard = None
  InjuredVanguard = Alias_VanguardInjured.GetActorReference()
  If InjuredVanguard
    Scene_InjuredVanguardDies.Start()
    InjuredVanguard.Kill(None)
    InjuredVanguard.EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Vanguard00 = Alias_VanguardCommander.GetActorRef()
  Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef()
  Actor Vanguard02 = Alias_VanguardVendor.GetActorRef()
  Actor Vanguard03 = Alias_VanguardInjured.GetActorRef()
  Actor Aceles = Alias_Aceles.GetActorRef()
  Self.SetObjectiveCompleted(150, True)
  Aceles.EvaluatePackage(False)
  Vanguard00.EvaluatePackage(False)
  Vanguard01.EvaluatePackage(False)
  Vanguard02.EvaluatePackage(False)
  Vanguard03.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False)
  Alias_VanguardInjured.GetActorRef().EvaluatePackage(False)
  Alias_VanguardVendor.GetActorRef().EvaluatePackage(False)
  Alias_VanguardAcelesHandler.GetActorRef().EvaluatePackage(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Self.SetStage(220)
EndFunction

Function Fragment_Stage_0290_Item_00()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False)
  Alias_VanguardCommander.GetActorRef().SetProtected(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayed(500, True, False)
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0600_Item_01()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Self.SetStage(250)
EndFunction

Function Fragment_Stage_0600_Item_02()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False)
  Alias_Aceles.GetActorRef().EvaluatePackage(False)
  Float WaitTime = Utility.RandomFloat(4.5, 15.5)
  Utility.Wait(WaitTime)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0610_Item_00()
  If Self.GetStageDone(400)
    Scene_CommanderArrived.Start()
  EndIf
EndFunction

Function Fragment_Stage_0620_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  PlayerLevel = Math.Max(PlayerLevel as Float, 1.0) as Int
  PlayerLevel = Math.Min(PlayerLevel as Float, 100.0) as Int
  If Utility.RandomInt(0, PlayerLevel) > 50
    Self.SetStage(630)
  EndIf
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetStage(790)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Actor SpawnedTerrormorph = None
  Actor Commander = None
  Actor Aceles = None
  SpawnedTerrormorph = Alias_Terrormorph.GetActorReference()
  Commander = Alias_VanguardCommander.GetActorRef()
  Aceles = Alias_Aceles.GetActorRef()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(700, True, False)
  SpawnedTerrormorph.Enable(False)
  SpawnedTerrormorph.EvaluatePackage(False)
  Commander.EvaluatePackage(False)
  Aceles.EvaluatePackage(False)
  If !Self.GetStageDone(110)
    Self.SetStage(130)
  EndIf
EndFunction

Function Fragment_Stage_0710_Item_00()
  Actor SpawnedTerrormorph = None
  SpawnedTerrormorph = Alias_Terrormorph.GetActorReference()
  SpawnedTerrormorph.Enable(False)
  SpawnedTerrormorph.EvaluatePackage(False)
  If !Self.GetStageDone(110)
    Self.SetStage(130)
  EndIf
EndFunction

Function Fragment_Stage_0790_Item_00()
  If !Self.GetStageDone(700)
    Self.SetStage(700)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.GetStageDone(810) || !Self.GetStageDone(811) || !Self.GetStageDone(812) || !Self.GetStageDone(813)
    Self.SetStage(900)
  Else
    Self.SetStage(990)
  EndIf
EndFunction

Function Fragment_Stage_0810_Item_00()
  If !Self.GetStageDone(820) && Alias_Aceles.GetActorRef() != None
    Alias_Aceles.GetActorRef().EvaluatePackage(False)
  EndIf
  If Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveFailed(150, True)
  EndIf
  If !Self.GetStageDone(790)
    Self.SetStage(710)
    Self.SetStage(980)
  EndIf
  If Self.GetStageDone(811) && Self.GetStageDone(812) && Self.GetStageDone(813)
    Self.SetStage(985)
    Self.SetStage(700)
  EndIf
EndFunction

Function Fragment_Stage_0811_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(812) && Self.GetStageDone(813)
    Self.SetStage(985)
  EndIf
EndFunction

Function Fragment_Stage_0812_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(811) && Self.GetStageDone(813)
    Self.SetStage(985)
  EndIf
EndFunction

Function Fragment_Stage_0813_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(811) && Self.GetStageDone(812)
    Self.SetStage(985)
  EndIf
EndFunction

Function Fragment_Stage_0820_Item_00()
  If !Self.GetStageDone(810)
    If Alias_VanguardCommander.GetActorRef() != None
      Alias_VanguardCommander.GetActorRef().EvaluatePackage(False)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetStage(790)
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(811) && Self.GetStageDone(812) && Self.GetStageDone(813)
    Self.SetStage(990)
  Else
    Self.SetObjectiveDisplayed(900, True, False)
  EndIf
  Actor Vanguard00 = Alias_VanguardCommander.GetActorRef()
  Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef()
  Actor Vanguard02 = Alias_VanguardVendor.GetActorRef()
  Actor Vanguard03 = Alias_VanguardInjured.GetActorRef()
  Vanguard00.EvaluatePackage(False)
  Vanguard01.EvaluatePackage(False)
  Vanguard02.EvaluatePackage(False)
  Vanguard03.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.FailAllObjectives()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0985_Item_00()
  Self.FailAllObjectives()
  Self.SetStage(999)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Actor Vanguard00 = Alias_VanguardCommander.GetActorRef()
  Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef()
  Actor Vanguard02 = Alias_VanguardVendor.GetActorRef()
  Actor Vanguard03 = Alias_VanguardInjured.GetActorRef()
  Actor Aceles = Alias_Aceles.GetActorRef()
  Aceles.EvaluatePackage(False)
  Vanguard00.EvaluatePackage(False)
  Vanguard01.EvaluatePackage(False)
  Vanguard02.EvaluatePackage(False)
  Vanguard03.EvaluatePackage(False)
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(990)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop()
EndFunction
