ScriptName MQ_TutorialQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property Tutorial_LockpickingMSGBox Auto Const mandatory
Message Property Tutorial_IndustrialMSGBox Auto Const mandatory
Message Property Tutorial_ResearchMSGBox Auto Const mandatory
Message Property Tutorial_SpeechMSGBox Auto Const mandatory
Message Property Tutorial_InventoryDetail_MSGBox Auto Const mandatory
Message Property Tutorial_SkillsMenu_MSGBox Auto Const mandatory
Message Property Tutorial_SkillsMenu_MSGBox_PC Auto Const mandatory
Message Property Tutorial_ScannerDetail_MSGBox Auto Const mandatory
Message Property Tutorial_MissionMenu_MSGBox Auto Const mandatory
Message Property Tutorial_ShipMenu_MSGBox Auto Const mandatory
Message Property Tutorial_CrewMenu_MSGBox Auto Const mandatory
Message Property Tutorial_StarMap_MSGBox Auto Const mandatory
Message Property Tutorial_StarMap_MSGBox_PC Auto Const mandatory
Message Property MQ104APowerTutorial02MSG Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Int Property StarMapPreReqStage = 510 Auto Const
Int Property StarMapPostStage = 605 Auto Const
Int Property CompanionEMWeapon = 20 Auto Const
ReferenceAlias Property Companion Auto Const mandatory
ReferenceAlias Property EliteCrew Auto Const mandatory
Keyword Property WeaponTypeEM Auto Const mandatory
conditionform Property UC04_WeaponIsTypeEM Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property ShipLowHealthStage = 30 Auto Const
Int Property ShipDamagedSystemStage = 40 Auto Const
ActorValue Property Health Auto Const mandatory
Message Property Tutorial_ShipBuilderUpgrade_MSGBox Auto Const mandatory
Message Property Tutorial_ShipBuilderModify_MSGBox Auto Const mandatory
Message Property Tutorial_ShipBuilderModify_MSGBox_PC Auto Const mandatory
Message Property Tutorial_SocialSkills Auto Const mandatory
Message Property Tutorial_SocialSkills_PC Auto Const mandatory
Perk Property Skill_Instigation Auto Const mandatory
Perk Property Skill_Intimidation Auto Const mandatory
Perk Property Skill_Manipulation Auto Const mandatory
Perk Property Skill_Diplomacy Auto Const mandatory
Int Property ScannerTutorialStage = 60 Auto Const
Int Property MissionsTutorialStage = 70 Auto Const
Message Property Tutorial_StarbornPower01 Auto Const mandatory
Message Property Tutorial_StarbornPower02 Auto Const mandatory
Message Property Tutorial_StarbornPower03 Auto Const mandatory
Message Property Tutorial_StarbornPower04 Auto Const mandatory
Keyword Property Artifact_Power Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
Message Property Tutorial_UnregisteredShip Auto Const mandatory
Message Property Tutorial_FailedJump01 Auto Const mandatory
Message Property Tutorial_FailedJump02 Auto Const mandatory
Message Property Tutorial_FailedJump03 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer()
  Self.RegisterForMenuOpenCloseEvent("SecurityMenu")
  Self.RegisterForMenuOpenCloseEvent("IndustrialCraftingMenu")
  Self.RegisterForMenuOpenCloseEvent("ResearchMenu")
  Self.RegisterForMenuOpenCloseEvent("InventoryMenu")
  Self.RegisterForMenuOpenCloseEvent("SkillsMenu")
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu")
  Self.RegisterForMenuOpenCloseEvent("BSMissionMenu")
  Self.RegisterForMenuOpenCloseEvent("SpaceshipInfoMenu")
  Self.RegisterForMenuOpenCloseEvent("SpaceshipEditorMenu")
  Self.RegisterForMenuOpenCloseEvent("ShipCrewMenu")
  Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
  Self.RegisterForTutorialEvent("Dialogue_PersuasionStart")
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemEquipped")
  Self.RegisterForRemoteEvent(Companion as ScriptObject, "OnAliasChanged")
  Self.RegisterForRemoteEvent(EliteCrew as ScriptObject, "OnAliasChanged")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnAliasChanged")
  Self.ShipLowHealth()
  Self.RegisterForRemoteEvent(PlayerShip.GetShipRef() as ScriptObject, "OnShipSystemDamaged")
  Self.RegisterForTutorialEvent("ShipbuilderUpgradeModeEntered")
  Self.RegisterForTutorialEvent("ShipbuilderModifyModeEntered")
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerFailedPlotRoute")
EndEvent

Function ShipLowHealth()
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef()
  Float iLowHealth = PlayerShipREF.GetValue(Health) / 2.0
  Self.RegisterForActorValueLessThanEvent(PlayerShipREF as ObjectReference, Health, iLowHealth)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef()
  If (akObjRef as spaceshipreference == PlayerShipREF) && Self.GetStageDone(ShipLowHealthStage) == False
    Self.SetStage(ShipLowHealthStage)
    Self.UnRegisterForRemoteEvent(PlayerShip as ScriptObject, "OnAliasChanged")
  ElseIf (akObjRef as spaceshipreference != PlayerShipREF) && Self.GetStageDone(ShipLowHealthStage) == False
    Self.ShipLowHealth()
  EndIf
EndEvent

Event SpaceshipReference.OnShipSystemDamaged(spaceshipreference akSender, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef()
  If akSender == PlayerShipREF && Self.GetStageDone(ShipDamagedSystemStage) == False
    Self.UnRegisterForRemoteEvent(akSender as ScriptObject, "OnShipSystemDamaged")
    Self.SetStage(ShipDamagedSystemStage)
  ElseIf akSender != PlayerShipREF && Self.GetStageDone(ShipDamagedSystemStage) == False
    Self.UnRegisterForRemoteEvent(akSender as ScriptObject, "OnShipSystemDamaged")
    Self.RegisterForRemoteEvent(PlayerShipREF as ScriptObject, "OnShipSystemDamaged")
  EndIf
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  Actor PlayerREF = Game.GetPlayer()
  If asMenuName == "SecurityMenu"
    If abOpening
      Tutorial_LockpickingMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnRegisterForMenuOpenCloseEvent("SecurityMenu")
    EndIf
  ElseIf asMenuName == "IndustrialCraftingMenu"
    If abOpening
      Tutorial_IndustrialMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnRegisterForMenuOpenCloseEvent("IndustrialCraftingMenu")
    EndIf
  ElseIf asMenuName == "ResearchMenu"
    If abOpening
      Tutorial_ResearchMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnRegisterForMenuOpenCloseEvent("ResearchMenu")
    EndIf
  ElseIf asMenuName == "InventoryMenu"
    If abOpening
      Message.ClearHelpMessages()
      Self.UnRegisterForMenuOpenCloseEvent("InventoryMenu")
    EndIf
  ElseIf asMenuName == "SkillsMenu"
    If abOpening
      If Game.UsingGamepad()
        Tutorial_SkillsMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Else
        Tutorial_SkillsMenu_MSGBox_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      Self.UnRegisterForMenuOpenCloseEvent("SkillsMenu")
    EndIf
  ElseIf asMenuName == "MonocleMenu"
    If abOpening && Self.GetStageDone(ScannerTutorialStage) == False
      Self.SetStage(ScannerTutorialStage)
      Tutorial_ScannerDetail_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf asMenuName == "BSMissionMenu"
    If abOpening && Self.GetStageDone(MissionsTutorialStage) == False
      Message.ClearHelpMessages()
      Self.SetStage(MissionsTutorialStage)
      Tutorial_MissionMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnRegisterForMenuOpenCloseEvent("BSMissionMenu")
    Else
      Message.ClearHelpMessages()
      Self.UnRegisterForMenuOpenCloseEvent("BSMissionMenu")
    EndIf
  ElseIf asMenuName == "SpaceshipInfoMenu"
    If abOpening
      Tutorial_ShipMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnRegisterForMenuOpenCloseEvent("SpaceshipInfoMenu")
    EndIf
  ElseIf asMenuName == "ShipCrewMenu"
    If abOpening
      Tutorial_CrewMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnRegisterForMenuOpenCloseEvent("ShipCrewMenu")
    EndIf
  ElseIf asMenuName == "GalaxyStarMapMenu"
    If abOpening && MQ101.GetStageDone(StarMapPreReqStage) && MQ101.GetStageDone(StarMapPostStage) == False
      If Game.UsingGamepad()
        Tutorial_StarMap_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Else
        Tutorial_StarMap_MSGBox_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
    ElseIf !abOpening
      Message.ClearHelpMessages()
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
    EndIf
  ElseIf asMenuName == "SpaceshipEditorMenu"
    If abOpening
      spaceshipreference[] AllPlayerShips = Game.GetPlayerOwnedShips()
      Int iNumShips = AllPlayerShips.Length
      Bool bUnregisteredShip = False
      Int iCurrentIndex = 0
      While iCurrentIndex < iNumShips
        If AllPlayerShips[iCurrentIndex].GetValue(SpaceshipRegistration) == 0.0
          bUnregisteredShip = True
        EndIf
        iCurrentIndex += 1
      EndWhile
      If bUnregisteredShip
        Tutorial_UnregisteredShip.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.UnRegisterForMenuOpenCloseEvent("SpaceshipEditorMenu")
      EndIf
    EndIf
  EndIf
  If asMenuName == "DataMenu"
    If abOpening
      If Self.GetStageDone(100) && !Self.GetStageDone(130)
        Message.ClearHelpMessages()
        Tutorial_StarbornPower02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
        Self.SetStage(110)
      EndIf
    ElseIf !abOpening
      If Self.GetStageDone(100) && !Self.GetStageDone(130)
        Message.ClearHelpMessages()
        Tutorial_StarbornPower01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
      EndIf
      If Self.GetStageDone(130) && !Self.GetStageDone(140)
        If PlayerREF.GetEquippedSpell(2).HasKeyword(Artifact_Power)
          Message.ClearHelpMessages()
          Tutorial_StarbornPower04.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
          Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSpellCast")
        EndIf
      EndIf
    EndIf
  EndIf
  If asMenuName == "PowersMenu"
    If abOpening
      If !Self.GetStageDone(130)
        Message.ClearHelpMessages()
        Tutorial_StarbornPower03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
        Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemEquipped")
        Self.SetStage(120)
      EndIf
    ElseIf !abOpening
      If !Self.GetStageDone(130)
        Message.ClearHelpMessages()
        Tutorial_StarbornPower02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
      EndIf
    EndIf
  EndIf
  If asMenuName == "MonocleMenu"
    If PlayerREF.HasPerk(Skill_Diplomacy) || PlayerREF.HasPerk(Skill_Instigation) || PlayerREF.HasPerk(Skill_Intimidation) || PlayerREF.HasPerk(Skill_Manipulation)
      If abOpening
        Utility.Wait(0.100000001)
        If Game.UsingGamepad()
          Tutorial_SocialSkills.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Else
          Tutorial_SocialSkills_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        EndIf
        Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu")
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
  If asEventName == "Dialogue_PersuasionStart"
    Tutorial_SpeechMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.UnregisterForTutorialEvent("Dialogue_PersuasionStart")
  EndIf
  If asEventName == "ShipbuilderUpgradeModeEntered"
    Tutorial_ShipBuilderUpgrade_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.UnregisterForTutorialEvent("ShipbuilderUpgradeModeEntered")
  EndIf
  If asEventName == "ShipbuilderModifyModeEntered"
    If Game.UsingGamepad()
      Tutorial_ShipBuilderModify_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      Tutorial_ShipBuilderModify_MSGBox_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
    Self.UnregisterForTutorialEvent("ShipbuilderModifyModeEntered")
  EndIf
EndEvent

Event ObjectReference.OnSpellCast(ObjectReference akSender, Form akSpell)
  If akSpell.HasKeyword(Artifact_Power)
    Actor PlayerREF = Game.GetPlayer()
    Tutorial_StarbornPower04.UnshowAsHelpMessage()
    Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemEquipped")
    Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSpellCast")
    Self.UnRegisterForMenuOpenCloseEvent("PowersMenu")
    Self.UnRegisterForMenuOpenCloseEvent("DataMenu")
    Self.SetStage(140)
  EndIf
EndEvent

Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
  Self.ProcessCompanionEMWeaponTutorial(akSender)
  If akBaseObject.HasKeyword(Artifact_Power)
    Tutorial_StarbornPower03.UnshowAsHelpMessage()
    Self.SetStage(130)
  EndIf
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Companion || akSender == EliteCrew
    Self.ProcessCompanionEMWeaponTutorial(Game.GetPlayer())
  EndIf
  If akSender == PlayerShip
    Self.ShipLowHealth()
  EndIf
EndEvent

Function ProcessCompanionEMWeaponTutorial(Actor akTriggeringActor)
  If !Self.GetStageDone(CompanionEMWeapon) && akTriggeringActor == Game.GetPlayer() && UC04_WeaponIsTypeEM.IsTrue(None, None) && (Companion.GetRef() != None || EliteCrew.GetRef() != None)
    Self.UnRegisterForRemoteEvent(akTriggeringActor as ScriptObject, "OnItemEquipped")
    Self.UnRegisterForRemoteEvent(Companion as ScriptObject, "OnAliasChanged")
    Self.UnRegisterForRemoteEvent(EliteCrew as ScriptObject, "OnAliasChanged")
    Self.SetStage(CompanionEMWeapon)
  EndIf
EndFunction

Function StartPowerTutorial()
  Tutorial_StarbornPower01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
  Self.RegisterForMenuOpenCloseEvent("DataMenu")
  Self.RegisterForMenuOpenCloseEvent("PowersMenu")
EndFunction

Event Actor.OnPlayerFailedPlotRoute(Actor akSender, Int aeFailedPlotReason)
  Message.ClearHelpMessages()
  Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
  Self.RegisterForMenuOpenCloseEvent("BSMissionMenu")
  If aeFailedPlotReason == 1
    Tutorial_FailedJump01.ShowAsHelpMessage("None", 30.0, 0.0, 1, "", 0, None)
  ElseIf aeFailedPlotReason == 2
    Tutorial_FailedJump02.ShowAsHelpMessage("None", 30.0, 0.0, 1, "", 0, None)
  ElseIf aeFailedPlotReason == 3
    Tutorial_FailedJump03.ShowAsHelpMessage("None", 30.0, 0.0, 1, "", 0, None)
  EndIf
EndEvent
