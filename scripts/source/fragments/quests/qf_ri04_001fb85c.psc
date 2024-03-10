ScriptName Fragments:Quests:QF_RI04_001FB85C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nyx Auto Const mandatory
ReferenceAlias Property Alias_NyxFurniture Auto Const mandatory
ReferenceAlias Property Alias_NyxMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_DaltonQS Auto Const mandatory
ReferenceAlias Property Alias_NyxProgram Auto Const mandatory
ReferenceAlias Property Alias_Dalton Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_MadameSauvageQS Auto Const mandatory
ReferenceAlias Property Alias_NyxApartmentQS Auto Const mandatory
ReferenceAlias Property Alias_RyujinTowerQS Auto Const mandatory
MiscObject Property RI04_NyxProgram Auto Const mandatory
MiscObject Property RI04_EncryptedFiles Auto Const mandatory
Scene Property RI04_0000_Masako_DaltonIntercomScene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_NyxEncryptedData Auto Const mandatory
GlobalVariable Property RI04_RyujinTowerBodyCount Auto Const mandatory
GlobalVariable Property RI_TotalBodyCount Auto Const mandatory
GlobalVariable Property RI04_RyujinTowerArrestsCount Auto Const mandatory
GlobalVariable Property RI_TotalArrestCount Auto Const mandatory
Scene Property RI04_0400_Companion_InfiltrationCompleteScene Auto Const mandatory
Weapon Property Disruptor Auto Const mandatory
ReferenceAlias Property Alias_MasakoQS Auto Const mandatory
ReferenceAlias Property Alias_UlaruQS Auto Const mandatory
ReferenceAlias Property Alias_CamdenQS Auto Const mandatory
Quest Property RI05 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Ammo Property AmmoNeuralDisrupter Auto Const mandatory
ReferenceAlias Property Alias_NovablastDisrupter Auto Const mandatory
ReferenceAlias Property Alias_NyxMonitor01 Auto Const mandatory
ReferenceAlias Property Alias_NyxMonitor02 Auto Const mandatory
ReferenceAlias Property Alias_NyxMonitor03 Auto Const mandatory
ReferenceAlias Property Alias_NyxLapTopEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_VentEntrance Auto Const mandatory
ReferenceAlias Property Alias_VentFinalExit Auto Const mandatory
ReferenceAlias Property Alias_CraneButton Auto Const mandatory
ReferenceAlias Property Alias_NyxBackpack Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
GlobalVariable Property RI04_Track_PlayerStoleCamdenChoInfo Auto Const mandatory
ReferenceAlias Property Alias_DRONESanitationBot Auto Const mandatory
ReferenceAlias Property Alias_DRONESecurityBot Auto Const mandatory
Faction Property LC044RyujinGuardCrimeFaction Auto Const mandatory
ReferenceAlias Property Alias_NyxExteriorApartmentDoor Auto Const mandatory
GlobalVariable Property RI04_TowerGuardsEnteredCombat Auto Const mandatory
GlobalVariable Property SE_Player_ZW13_Timestamp Auto Const mandatory
Float Property cooldownDays Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(1000)
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  RI01_JobAdRadio.Stop()
  Self.SetStage(100)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_MasakoQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(100)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_DaltonQS.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  RI_Support.SetStage(1110)
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(200)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_MadameSauvageQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01_JobAdRadio.Stop()
  Self.SetStage(360)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_RyujinTowerQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  RI01_JobAdRadio.Stop()
  LC044.SetStage(10)
  Self.SetStage(400)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_UlaruQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False)
  LC044RyujinGuardCrimeFaction.ModCrimeGold(100, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  RI01_JobAdRadio.Stop()
  LC044.SetStage(10)
  Self.SetStage(400)
  Self.SetStage(500)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_CamdenQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False)
  LC044RyujinGuardCrimeFaction.ModCrimeGold(100, False)
EndFunction

Function Fragment_Stage_0006_Item_00()
  RI01_JobAdRadio.Stop()
  Self.SetStage(600)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_NyxApartmentQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False)
  Alias_NyxExteriorApartmentDoor.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0007_Item_00()
  RI01_JobAdRadio.Stop()
  Self.SetStage(900)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_NyxApartmentQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  Alias_NyxExteriorApartmentDoor.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(1000)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_DaltonQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  PlayerRef.AddAliasedItem(RI04_EncryptedFiles as Form, Alias_NyxEncryptedData as Alias, 1, True)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True)
  LC044.SetStage(1000)
  RI01_JobAdRadio.Stop()
  Self.SetStage(1300)
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerRef.MoveTo(Alias_DaltonQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  If Game.GetPlayer().GetDistance(Alias_Masako.GetRef()) < 100.0
    RI04_0000_Masako_DaltonIntercomScene.Start()
  EndIf
  RI04_RyujinTowerBodyCount.SetValue(RI_TotalBodyCount.GetValue())
  RI04_RyujinTowerArrestsCount.SetValue(RI_TotalArrestCount.GetValue())
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Alias_Nyx.GetRef().MoveTo(Alias_NyxFurniture.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_NyxBackpack.GetRef().Disable(False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False)
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False)
  Alias_NyxLapTopEnableMarker.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0330_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0335_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0340_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Game.GetPlayer().AddItem(Alias_NyxProgram.GetRef() as Form, 1, False)
  Self.SetStage(375)
EndFunction

Function Fragment_Stage_0375_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(375, True, False)
  LC044.SetStage(10)
  ObjectReference VentRef = Alias_VentEntrance.GetRef()
  VentRef.Lock(False, False, True)
  ObjectReference VentExitRef = Alias_VentFinalExit.GetRef()
  VentExitRef.Lock(False, False, True)
  Alias_CraneButton.GetRef().BlockActivation(False, False)
  Alias_DRONESanitationBot.GetActorRef().SetUnconscious(True)
  Alias_DRONESecurityBot.GetActorRef().SetUnconscious(True)
EndFunction

Function Fragment_Stage_0380_Item_00()
  Alias_CraneButton.GetRef().BlockActivation(True, True)
EndFunction

Function Fragment_Stage_0385_Item_00()
  Alias_CraneButton.GetRef().BlockActivation(False, False)
EndFunction

Function Fragment_Stage_0390_Item_00()
  LC044.SetStage(11)
  Self.SetStage(400)
  If Self.GetStageDone(350)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(375, True)
  Self.SetObjectiveDisplayedAtTop(400)
  Self.SetObjectiveDisplayed(405, True, False)
  If Game.GetPlayer().GetEquippedWeapon(0) == Disruptor
    Self.SetObjectiveCompleted(405, True)
  EndIf
EndFunction

Function Fragment_Stage_0405_Item_00()
  RI04_TowerGuardsEnteredCombat.SetValue(1.0)
EndFunction

Function Fragment_Stage_0406_Item_00()
  Self.SetObjectiveCompleted(405, True)
EndFunction

Function Fragment_Stage_0450_Item_00()
  LC044.SetStage(15)
EndFunction

Function Fragment_Stage_0460_Item_00()
  LC044.SetStage(13)
EndFunction

Function Fragment_Stage_0480_Item_00()
  LC044.SetStage(30)
EndFunction

Function Fragment_Stage_0499_Item_00()
  Self.SetObjectiveCompleted(400, True)
  If Self.GetStageDone(350)
    If Self.GetStageDone(550)
      Self.SetStage(575)
    EndIf
  Else
    Self.SetStage(575)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayedAtTop(500)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If Self.GetStageDone(499)
    Self.SetStage(575)
  EndIf
  RI04_Track_PlayerStoleCamdenChoInfo.SetValue(1.0)
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.SetObjectiveDisplayed(575, True, False)
EndFunction

Function Fragment_Stage_0590_Item_00()
  RI04_0400_Companion_InfiltrationCompleteScene.Start()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(575, True)
  Self.SetObjectiveDisplayed(600, True, False)
  If Self.IsObjectiveDisplayed(405)
    Self.SetObjectiveDisplayed(405, False, False)
  EndIf
  Alias_NyxLapTopEnableMarker.GetRef().Enable(False)
  Alias_Nyx.GetRef().MoveTo(Alias_NyxMoveToMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_NyxBackpack.GetRef().Enable(False)
  Alias_NyxExteriorApartmentDoor.GetRef().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0750_Item_00()
  Game.GetPlayer().RemoveItem(RI04_NyxProgram as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_0810_Item_00()
  Alias_NyxMonitor01.GetRef().PlayAnimation("Play01")
  Alias_NyxMonitor02.GetRef().PlayAnimation("Play01")
  Alias_NyxMonitor03.GetRef().PlayAnimation("Play01")
EndFunction

Function Fragment_Stage_0900_Item_00()
  Alias_NyxMonitor01.GetRef().PlayAnimation("Play02")
  Alias_NyxMonitor02.GetRef().PlayAnimation("Play02")
  Alias_NyxMonitor03.GetRef().PlayAnimation("Play02")
  Alias_Nyx.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0910_Item_00()
  Game.GetPlayer().AddAliasedItem(RI04_EncryptedFiles as Form, Alias_NyxEncryptedData as Alias, 1, True)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  RI05.SetStage(100)
  Float currentGameTime = Utility.GetCurrentGameTime()
  SE_Player_ZW13_Timestamp.SetValue(currentGameTime + cooldownDays)
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  LC044.SetStage(20)
  ObjectReference VentRef = Alias_VentEntrance.GetRef()
  VentRef.Lock(True, False, True)
  VentRef.SetLockLevel(254)
  ObjectReference VentExitRef = Alias_VentFinalExit.GetRef()
  VentExitRef.Lock(True, False, True)
  VentExitRef.SetLockLevel(254)
  Float fBodyCount = RI_TotalBodyCount.GetValue() - RI04_RyujinTowerBodyCount.GetValue()
  RI04_RyujinTowerBodyCount.SetValue(fBodyCount)
  Float fArrestCount = RI_TotalArrestCount.GetValue() - RI04_RyujinTowerArrestsCount.GetValue()
  RI04_RyujinTowerArrestsCount.SetValue(fArrestCount)
  Alias_Nyx.GetActorRef().EvaluatePackage(False)
  Alias_DRONESanitationBot.GetActorRef().SetUnconscious(False)
  Alias_DRONESecurityBot.GetActorRef().SetUnconscious(False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1110_Item_00()
  Game.GetPlayer().RemoveItem(RI04_EncryptedFiles as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
  Alias_Dalton.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1300, True, False)
  Alias_Dalton.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1310_Item_00()
  Alias_Dalton.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
  kmyQuest.AddFinalValues()
EndFunction
