ScriptName Fragments:Quests:QF_UC07_00215E93 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property UC03_RedDevilsHQKey Auto Const mandatory
ObjectReference Property UC07_DebugMarker01 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property RDHQShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Scene Property UC07_110_HadrianSpotsPlayer Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_KaiserIsARobot Auto Const mandatory
ReferenceAlias Property Alias_Kaiser Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Scene Property UC07_420_Kaiser_BiologicalContamination Auto Const mandatory
Scene Property UC07_440_Kaiser_PowerRequired Auto Const mandatory
MiscObject Property Mfg_Positron_Battery Auto Const mandatory
Message Property UC07_DEBUG_KaiserPoweringUp Auto Const mandatory
Message Property UC07_DEBUG_BeaconSound Auto Const mandatory
Scene Property UC07_550_Kaiser_ProceedToOverlook Auto Const mandatory
ReferenceAlias Property Alias_Unit99 Auto Const mandatory
Scene Property UC07_610_Ecliptic_Release99 Auto Const mandatory
RefCollectionAlias Property Alias_Ecliptic Auto Const mandatory
Scene Property UC07_700_Kaiser_Unit99Eulogy Auto Const mandatory
ObjectReference Property UC_Jakob_PostquestSandboxMarker Auto Const mandatory
ObjectReference Property UC07_JakobTeleportMarker Auto Const mandatory
GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const mandatory
ReferenceAlias Property Alias_Jakob Auto Const mandatory
ObjectReference Property UC07_DebugMarker02 Auto Const mandatory
Book Property UC07_KaiserSchematics Auto Const mandatory
ReferenceAlias Property Alias_KaiserSchematics Auto Const mandatory
GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const mandatory
ObjectReference Property UC07_HadrianTeleportMarker Auto Const mandatory
RefCollectionAlias Property Alias_HeatLeeches Auto Const mandatory
ObjectReference Property UC07_DebugMarker03 Auto Const mandatory
ObjectReference Property UC07_DebugMarker_KaiserTeleport_Stage7 Auto Const mandatory
ObjectReference Property UC07_DebugMarker05 Auto Const mandatory
ObjectReference Property UC07_DebugMarker06 Auto Const mandatory
ObjectReference Property UC07_DebugMarker_KaiserTeleport_Stage8 Auto Const mandatory
LeveledItem Property TestVSWeapons Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ObjectReference Property UC07_Kaiser_Scene850Marker Auto Const mandatory
ObjectReference Property UC07_Hadrian_Scene850Marker Auto Const mandatory
ObjectReference Property UC07_Jakob_Scene850Marker Auto Const mandatory
ReferenceAlias Property Alias_KaiserCaptiveAlias Auto Const mandatory
Scene Property UC07_850_KaiserHadrianJakob_Reunite Auto Const mandatory
Quest Property UC08 Auto Const mandatory
GlobalVariable Property UC07_GelFee_SpeechDiscount Auto Const mandatory
GlobalVariable Property UC07_GelFee Auto Const mandatory
GlobalVariable Property UC07_GelFee_FreestarDiscount Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Message Property UC07_BatterySchematicLearned Auto Const mandatory
GlobalVariable Property UC07_LearnedPositronBatteryRecipe Auto Const mandatory
Scene Property UC07_604_EclipticScene Auto Const mandatory
ReferenceAlias Property Alias_CageDoor Auto Const mandatory
Faction Property UC07_EclipticEnemyFaction Auto Const mandatory
Scene Property UC07_701_Kaiser_ProceedToUnit99 Auto Const mandatory
Scene Property UC07_815_Kaiser_PlayerSatInPilotsSeatScene Auto Const mandatory
Location Property LC042BattleofNiiraLocation Auto Const mandatory
ReferenceAlias Property Alias_QuestPositronBattery Auto Const mandatory
GlobalVariable Property UC07_GelFee_AzamiDiscount Auto Const mandatory
Quest Property UC07_HadrianVVRevealQuest Auto Const mandatory
Quest Property Dialogue1OfAKindUC07 Auto Const mandatory
ReferenceAlias Property Alias_EclipticEnemyAlias Auto Const mandatory
Scene Property UC07_620_Ecliptic_Release99Hostile Auto Const mandatory
Scene Property UC07_820_Kaiser_ArrivedAtRDHQ Auto Const mandatory
RefCollectionAlias Property Alias_QuestBatteryMaterials Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HadriansPast_Clone Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HadrianBuiltKaiser Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
GlobalVariable Property UC05_FreestarObserversAccepted Auto Const mandatory
MiscObject Property UC07_Microcell_ConductorArray Auto Const mandatory
MiscObject Property UC07_Microcell_PowerSource Auto Const mandatory
MiscObject Property UC07_Microcell_Shielding Auto Const mandatory
ReferenceAlias Property Alias_Wallsafe Auto Const mandatory
ReferenceAlias Property Alias_FieldNotes Auto Const mandatory
GlobalVariable Property UC07_Niira_PreventCageRelease Auto Const mandatory
ReferenceAlias Property Alias_EmergencyBeacon Auto Const mandatory
Scene Property UC07_440a_Kaiser_HeatleechesEliminated Auto Const mandatory
ReferenceAlias Property Alias_TriggerStage825 Auto Const mandatory
ReferenceAlias Property Alias_MicroCell Auto Const mandatory
ReferenceAlias Property Alias_RHQMapMarker Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const mandatory
ActorValue Property Perception Auto Const mandatory
ReferenceAlias Property Alias_EclipticSceneTarget Auto Const mandatory
Quest Property UC05 Auto Const mandatory
Quest Property UC06 Auto Const mandatory
Keyword Property ActorSocialImmune Auto Const mandatory
Faction Property UC07_EclipticFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_EclipticBoss Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19)
  Game.GetPlayer().Moveto(UC07_DebugMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Dialogue1OfAKindUC07.SetStage(50)
  Dialogue1OfAKindUC07.SetStage(100)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Dialogue1OfAKindUC07.SetStage(50)
  Dialogue1OfAKindUC07.SetStage(100)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(410)
  Self.SetStage(415)
  Self.SetStage(420)
  Self.SetStage(430)
  Self.SetStage(440)
  Self.SetStage(450)
  Dialogue1OfAKindUC07.SetStage(50)
  Dialogue1OfAKindUC07.SetStage(100)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  Alias_HeatLeeches.DisableAll(False)
  PlayREF.Moveto(UC07_DebugMarker02, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(410)
  Self.SetStage(415)
  Self.SetStage(420)
  Self.SetStage(430)
  Self.SetStage(440)
  Self.SetStage(450)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker03, 0.0, 0.0, 0.0, True, False)
  Alias_HeatLeeches.DisableAll(False)
  PlayREF.AddItem(Mfg_Positron_Battery as Form, 1, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(430)
  Self.SetStage(440)
  Self.SetStage(450)
  Self.SetStage(500)
  Self.SetStage(550)
  Alias_KaiserCaptiveAlias.Clear()
  Actor KaiREF = Alias_Kaiser.GetActorRef()
  KaiREF.Moveto(UC07_DebugMarker_KaiserTeleport_Stage7, 0.0, 0.0, 0.0, True, False)
  KaiREF.EvaluatePackage(False)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker05, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveCompleted(500, True)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(430)
  Self.SetStage(440)
  Self.SetStage(450)
  Self.SetStage(500)
  Self.SetStage(550)
  Self.SetStage(560)
  Self.SetStage(600)
  Alias_KaiserCaptiveAlias.Clear()
  Actor KaiREF = Alias_Kaiser.GetActorRef()
  KaiREF.Moveto(UC07_DebugMarker_KaiserTeleport_Stage8, 0.0, 0.0, 0.0, True, False)
  UC07_550_Kaiser_ProceedToOverlook.Stop()
  KaiREF.EvaluatePackage(False)
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker06, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveCompleted(500, True)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(19)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(800)
  DialogueRedDevilsHQ.SetStage(20)
  Alias_KaiserCaptiveAlias.Clear()
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True)
  PlayREF.Moveto(UC07_DebugMarker01, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveCompleted(300, True)
  Utility.Wait(1.0)
  Self.SetStage(820)
  Alias_Kaiser.GetActorRef().AllowPCDialogue(True)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  uc07questscript kmyQuest = __temp as uc07questscript
  Int I = 0
  Int iLength = kmyQuest.RecipePieces.Length
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  While I < iLength
    PlayREF.AddItem(kmyQuest.RecipePieces[I].ComponentObject as Form, kmyQuest.RecipePieces[I].AmountRequired, False)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_0019_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, True)
  Frontier_ModularREF.Moveto(RDHQShipLandingMarker, 0.0, 0.0, 0.0, True, False)
  Frontier_ModularREF.setlinkedref(RDHQShipLandingMarker, SpaceshipEnabledLandingLink, True)
  Frontier_ModularREF.Enable(False)
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference)
  UC04_JakobSandboxing_PostUC03.SetValue(1.0)
  Alias_Jakob.GetRef().Moveto(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False)
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0)
  Actor HadREF = Alias_Hadrian.GetActorRef()
  HadREF.Enable(False)
  HadREF.Moveto(UC07_HadrianTeleportMarker, 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, True)
  DialogueRedDevilsHQ.SetStage(7)
  Alias_RHQMapMarker.GetRef().Enable(False)
  Alias_RHQMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
  UC05.SetStage(1000)
  UC06.SetStage(1000)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  uc07questscript kmyQuest = __temp as uc07questscript
  Alias_Ecliptic.ResetAll()
  kmyQuest.DistributeBatteryComponents()
  UC07_HadrianVVRevealQuest.Start()
  DialogueRedDevilsHQ.SetStage(10)
  If UC05_FreestarObserversAccepted.GetValue() >= 1.0
    DialogueRedDevilsHQ.SetStage(12)
  EndIf
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0110_Item_00()
  UC07_110_HadrianSpotsPlayer.Start()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Actor PlayREF = Game.GetPlayer()
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0221_Item_00()
  If UC_PlayerKnows_KaiserIsARobot.GetValue() < 1.0
    Self.SetStage(222)
  EndIf
EndFunction

Function Fragment_Stage_0223_Item_00()
  UC_PlayerKnows_KaiserIsARobot.SetValue(1.0)
  UC_PlayerKnows_HadrianBuiltKaiser.SetValue(1.0)
EndFunction

Function Fragment_Stage_0225_Item_00()
  UC_PlayerKnows_HadriansPast_Clone.SetValue(1.0)
EndFunction

Function Fragment_Stage_0226_Item_00()
  Self.SetStage(225)
EndFunction

Function Fragment_Stage_0227_Item_00()
  UC_PlayerKnows_HadriansPast_Clone.SetValue(1.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Actor KaiserREF = Alias_Kaiser.GetActorRef()
  KaiserREF.AddKeyword(ActorSocialImmune)
  KaiserREF.IgnoreFriendlyHits(True)
  KaiserREF.AllowPCDialogue(False)
  KaiserREF.SetGhost(True)
  KaiserREF.Enable(False)
  Alias_EmergencyBeacon.GetRef().Enable(False)
  ObjectReference CageREF = Alias_CageDoor.GetRef()
  CageREF.SetOpen(False)
  CageREF.Lock(True, False, True)
  Actor Unit99REF = Alias_Unit99.GetActorRef()
  Unit99REF.SetRestrained(True)
  Unit99REF.Enable(False)
  Alias_HeatLeeches.EnableAll(False)
  Alias_HeatLeeches.SetValue(Health, 1.0)
  Alias_Wallsafe.GetRef().AddItem(Alias_FieldNotes.GetRef() as Form, 1, False)
  UC07_LearnedPositronBatteryRecipe.SetValue(1.0)
  Utility.Wait(3.0)
  Self.SetStage(302)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(305, True, False)
  Self.SetObjectiveDisplayed(306, True, False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Float newValue = UC07_GelFee.GetValue() - UC07_GelFee_SpeechDiscount.GetValue()
  If UC07_GelFee.GetValue() - newValue < 1.0
    UC07_GelFee.SetValue(1.0)
  Else
    UC07_GelFee.SetValue(newValue)
  EndIf
  Self.UpdateCurrentInstanceGlobal(UC07_GelFee)
EndFunction

Function Fragment_Stage_0315_Item_00()
  Float newValue = UC07_GelFee.GetValue() - UC07_GelFee_FreestarDiscount.GetValue()
  If UC07_GelFee.GetValue() - newValue < 1.0
    UC07_GelFee.SetValue(1.0)
  Else
    UC07_GelFee.SetValue(newValue)
  EndIf
  Self.UpdateCurrentInstanceGlobal(UC07_GelFee)
EndFunction

Function Fragment_Stage_0317_Item_00()
  Float newValue = UC07_GelFee.GetValue() - UC07_GelFee_AzamiDiscount.GetValue()
  If UC07_GelFee.GetValue() - newValue < 1.0
    UC07_GelFee.SetValue(1.0)
  Else
    UC07_GelFee.SetValue(newValue)
  EndIf
  Self.UpdateCurrentInstanceGlobal(UC07_GelFee)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, UC07_GelFee.GetValueInt(), False, None)
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(305, True)
  Self.SetObjectiveCompleted(306, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0407_Item_00()
  Self.SetStage(420)
  If !Self.GetStageDone(440)
    UC07_420_Kaiser_BiologicalContamination.Start()
  EndIf
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveSkipped(305)
  Self.SetObjectiveSkipped(306)
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(410, True, False)
EndFunction

Function Fragment_Stage_0415_Item_00()
  Alias_EmergencyBeacon.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveDisplayed(420, False, False)
  Self.SetObjectiveDisplayed(430, True, False)
EndFunction

Function Fragment_Stage_0440_Item_00()
  Alias_Kaiser.GetActorRef().AllowPCDialogue(True)
  Self.SetObjectiveCompleted(410, True)
  Self.SetObjectiveCompleted(430, True)
  Self.SetObjectiveDisplayed(420, True, False)
  UC07_420_Kaiser_BiologicalContamination.Stop()
  UC07_440a_Kaiser_HeatleechesEliminated.Start()
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Game.GetPlayer().GetItemCount(Mfg_Positron_Battery as Form) < 1
    Self.SetObjectiveCompleted(420, True)
    Self.SetObjectiveCompleted(430, True)
    Self.SetObjectiveDisplayed(450, True, False)
  Else
    Self.SetObjectiveSkipped(420)
    Self.SetStage(500)
  EndIf
EndFunction

Function Fragment_Stage_0460_Item_00()
  Self.SetObjectiveCompleted(450, True)
  Self.SetObjectiveDisplayedAtTop(460)
  Self.SetObjectiveDisplayed(461, True, False)
EndFunction

Function Fragment_Stage_0470_Item_00()
  Self.SetObjectiveCompleted(461, True)
  Self.SetStage(480)
EndFunction

Function Fragment_Stage_0480_Item_00()
  Actor PlayACT = Game.GetPlayer()
  If !Self.GetStageDone(500)
    If PlayACT.GetItemCount(UC07_Microcell_ConductorArray as Form) >= 1 && PlayACT.GetItemCount(UC07_Microcell_PowerSource as Form) >= 1 && PlayACT.GetItemCount(UC07_Microcell_Shielding as Form) >= 1
      Self.SetStage(485)
    Else
      If PlayACT.GetItemCount(UC07_Microcell_ConductorArray as Form) < 1
        Self.SetObjectiveDisplayed(481, True, False)
      EndIf
      If PlayACT.GetItemCount(UC07_Microcell_PowerSource as Form) < 1
        Self.SetObjectiveDisplayed(482, True, False)
      EndIf
      If PlayACT.GetItemCount(UC07_Microcell_Shielding as Form) < 1
        Self.SetObjectiveDisplayed(483, True, False)
      EndIf
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0481_Item_00()
  If !Self.GetStageDone(500)
    Self.SetObjectiveCompleted(481, True)
    If Self.GetStageDone(482) && Self.GetStageDone(483)
      Self.SetStage(485)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0482_Item_00()
  If !Self.GetStageDone(500)
    Self.SetObjectiveCompleted(482, True)
    If Self.GetStageDone(481) && Self.GetStageDone(483)
      Self.SetStage(485)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0483_Item_00()
  If !Self.GetStageDone(500)
    Self.SetObjectiveCompleted(483, True)
    If Self.GetStageDone(482) && Self.GetStageDone(481)
      Self.SetStage(485)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0485_Item_00()
  Self.SetObjectiveDisplayed(485, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(450, True)
  If Self.GetStageDone(495)
    Self.SetObjectiveDisplayed(460, False, False)
    Self.SetObjectiveCompleted(485, True)
  Else
    Self.SetObjectiveCompleted(460, True)
    Self.SetObjectiveDisplayed(485, False, False)
  EndIf
  If Self.isObjectiveDisplayed(461)
    Self.SetObjectiveDisplayed(461, False, False)
  EndIf
  If Self.isObjectiveDisplayed(481)
    Self.SetObjectiveDisplayed(481, False, False)
  EndIf
  If Self.isObjectiveDisplayed(482)
    Self.SetObjectiveDisplayed(482, False, False)
  EndIf
  If Self.isObjectiveDisplayed(483)
    Self.SetObjectiveDisplayed(483, False, False)
  EndIf
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Game.GetPlayer().RemoveItem(Alias_MicroCell.GetRef() as Form, 1, False, None)
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(510, True, False)
  Actor KaiserREF = Alias_Kaiser.GetActorRef()
  KaiserREF.RemoveKeyword(ActorSocialImmune)
  KaiserREF.SetNoBleedoutRecovery(False)
  KaiserREF.AllowBleedoutDialogue(False)
  KaiserREF.SetGhost(False)
  KaiserREF.RestoreValue(Health, 1000000.0)
  KaiserREF.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Alias_KaiserCaptiveAlias.Clear()
  Alias_Kaiser.GetActorRef().SetGhost(False)
  UC07_550_Kaiser_ProceedToOverlook.Start()
  Self.SetObjectiveCompleted(510, True)
  Self.SetObjectiveDisplayed(550, True, False)
EndFunction

Function Fragment_Stage_0551_Item_00()
  Self.SetStage(550)
EndFunction

Function Fragment_Stage_0557_Item_00()
  Alias_Kaiser.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0560_Item_00()
  Self.SetObjectiveCompleted(550, True)
  Self.SetObjectiveDisplayed(560, True, False)
  Alias_Kaiser.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0563_Item_00()
  Self.SetStage(545)
EndFunction

Function Fragment_Stage_0598_Item_00()
  If !Self.GetStageDone(610) && !Self.GetStageDone(650)
    If Self.GetStageDone(599)
      Self.SetObjectiveDisplayed(598, True, False)
      If !Self.GetStageDone(615)
        Self.SetObjectiveDisplayed(597, True, False)
      EndIf
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0599_Item_00()
  If !Self.GetStageDone(610) && !Self.GetStageDone(650)
    Self.SetObjectiveCompleted(560, True)
    Self.SetObjectiveDisplayed(600, True, False)
    If Self.GetStageDone(598)
      Self.SetObjectiveDisplayed(598, True, False)
      If !Self.GetStageDone(615)
        Self.SetObjectiveDisplayed(597, True, False)
      EndIf
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(598, False, False)
  Self.SetObjectiveDisplayed(597, False, False)
  Actor KaiACT = Alias_Kaiser.GetActorRef()
  KaiACT.SetValue(Perception, 3.0)
  Alias_EclipticEnemyAlias.ForceRefTo(KaiACT as ObjectReference)
  KaiACT.EvaluatePackage(False)
  If !Self.GetStageDone(610) || UC07_Niira_PreventCageRelease.GetValue() > 0.0
    If !Self.GetStageDone(650)
      Self.SetObjectiveCompleted(560, True)
      Self.SetObjectiveDisplayed(600, True, False)
      If Self.GetStageDone(598)
        Self.SetObjectiveDisplayed(598, True, False)
      EndIf
    Else
      Alias_Unit99.GetActorRef().AddToFaction(UC07_EclipticFaction)
      Self.SetObjectiveCompleted(599, True)
      Self.SetStage(660)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0604_Item_00()
  If !Self.GetStageDone(610) && !Self.GetStageDone(700)
    UC07_604_EclipticScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0610_Item_00()
  Quest __temp = Self as Quest
  uc07questscript kmyQuest = __temp as uc07questscript
  If UC07_Niira_PreventCageRelease.GetValue() < 1.0
    Self.SetObjectiveFailed(598, True)
    Self.SetObjectiveFailed(597, True)
  Else
    Self.SetObjectiveDisplayed(598, False, False)
  EndIf
  Self.SetStage(605)
  ObjectReference CageREF = Alias_CageDoor.GetRef()
  If !Self.GetStageDone(620) && !Self.GetStageDone(700) && CageREF.GetOpenState() == 3
    If kmyQuest.CheckForLivingSceneTarget(Alias_Ecliptic)
      UC07_610_Ecliptic_Release99.Start()
      Utility.Wait(6.0)
      If UC07_Niira_PreventCageRelease.GetValue() < 1.0
        CageREF.Unlock(False)
        CageREF.SetOpen(True)
      EndIf
    EndIf
  EndIf
  Self.SetStage(625)
EndFunction

Function Fragment_Stage_0615_Item_00()
  If Self.GetStageDone(598) && !Self.GetStageDone(610) && !Self.GetStageDone(700)
    Self.SetObjectiveCompleted(597, True)
  EndIf
EndFunction

Function Fragment_Stage_0620_Item_00()
  Quest __temp = Self as Quest
  uc07questscript kmyQuest = __temp as uc07questscript
  Self.SetStage(605)
  If Self.isObjectiveDisplayed(599)
    Self.SetObjectiveDisplayed(599, False, False)
  EndIf
  If Self.isObjectiveDisplayed(597)
    Self.SetObjectiveFailed(597, True)
  EndIf
  If !Self.GetStageDone(610)
    If kmyQuest.CheckForLivingSceneTarget(Alias_Ecliptic)
      UC07_604_EclipticScene.Stop()
      UC07_620_Ecliptic_Release99Hostile.Start()
    EndIf
    Self.SetStage(630)
  EndIf
  If !Self.GetStageDone(710)
    Self.SetStage(660)
  EndIf
EndFunction

Function Fragment_Stage_0625_Item_00()
  If UC07_Niira_PreventCageRelease.GetValue() < 1.0
    Actor Unit99REF = Alias_Unit99.GetActorRef()
    Unit99REF.SetRestrained(False)
    Unit99REF.AddToFaction(PlayerEnemyFaction)
    Self.SetStage(660)
  EndIf
EndFunction

Function Fragment_Stage_0630_Item_00()
  Dialogue1OfAKindUC07.SetStage(200)
  Self.SetStage(660)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If Self.GetStageDone(560)
    If !Self.GetStageDone(700)
      If !Self.GetStageDone(600) && (!Self.GetStageDone(610) || UC07_Niira_PreventCageRelease.GetValue() > 0.0)
        If !Self.IsObjectiveCompleted(597)
          Self.SetObjectiveDisplayed(597, False, False)
        EndIf
        Self.SetObjectiveCompleted(598, True)
        Self.SetObjectiveDisplayed(599, True, False)
      ElseIf Self.GetStageDone(700)
        Self.SetStage(705)
      Else
        Self.SetStage(660)
      EndIf
    Else
      Self.SetObjectiveDisplayed(599, False, False)
      Self.SetStage(705)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0660_Item_00()
  UC07_701_Kaiser_ProceedToUnit99.Stop()
  If Self.GetStageDone(560)
    If !Self.IsObjectiveCompleted(550)
      Self.SetObjectiveDisplayed(550, False, False)
    EndIf
    If !Self.IsObjectiveCompleted(560)
      Self.SetObjectiveDisplayed(560, False, False)
    EndIf
    If !Self.GetStageDone(710)
      Self.SetObjectiveDisplayed(660, True, False)
      Dialogue1OfAKindUC07.SetStage(190)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  UC07_701_Kaiser_ProceedToUnit99.Stop()
  UC07_610_Ecliptic_Release99.Stop()
  Self.SetObjectiveCompleted(660, True)
  If Self.GetStageDone(550) && Self.GetStageDone(560)
    If Self.GetStageDone(610)
      If Self.GetStageDone(650)
        Self.SetStage(705)
      EndIf
    Else
      Self.SetObjectiveDisplayed(600, False, False)
      Self.SetStage(705)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0701_Item_00()
  Self.SetObjectiveCompleted(560, True)
  Self.SetObjectiveCompleted(599, True)
  Self.SetObjectiveDisplayed(700, True, False)
  UC07_701_Kaiser_ProceedToUnit99.Start()
EndFunction

Function Fragment_Stage_0705_Item_00()
  If Self.GetStageDone(550)
    If Self.GetStageDone(600)
      Self.SetObjectiveDisplayed(700, True, False)
      UC07_700_Kaiser_Unit99Eulogy.Start()
    Else
      Self.SetStage(710)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0707_Item_00()
  If !Alias_Unit99.GetActorRef().IsDead()
    WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Alias_Kaiser.GetRef(), None, None)
  EndIf
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(710, True, False)
  Alias_Kaiser.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0715_Item_00()
  If UC07_550_Kaiser_ProceedToOverlook.IsPlaying()
    UC07_550_Kaiser_ProceedToOverlook.Stop()
  EndIf
  Alias_Kaiser.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(510, True)
  If Self.isObjectiveDisplayed(560)
    Self.SetObjectiveCompleted(560, True)
  EndIf
  Self.SetObjectiveCompleted(710, True)
  Self.SetObjectiveDisplayed(800, True, False)
  DialogueRedDevilsHQ.SetStage(20)
  Alias_Kaiser.GetActorRef().SetValue(Perception, 5.0)
EndFunction

Function Fragment_Stage_0810_Item_00()
  If !Self.GetStageDone(820)
    Alias_Kaiser.GetRef().Disable(False)
  EndIf
EndFunction

Function Fragment_Stage_0815_Item_00()
  If Alias_PlayerShip.GetRef().GetCurrentLocation() == LC042BattleofNiiraLocation
    UC07_815_Kaiser_PlayerSatInPilotsSeatScene.Start()
  EndIf
EndFunction

Function Fragment_Stage_0817_Item_00()
  Actor Unit99 = Alias_Unit99.GetActorRef()
  If !Unit99.IsDead()
    Unit99.Disable(False)
    ObjectReference CageDoorRef = Alias_CageDoor.GetRef()
    CageDoorRef.Unlock(False)
    If CageDoorRef.GetOpenState() == 3
      CageDoorRef.SetOpen(True)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0820_Item_00()
  UC07_820_Kaiser_ArrivedAtRDHQ.Start()
  Actor KaiREF = Alias_Kaiser.GetActorRef()
  KaiREF.Moveto(UC07_Kaiser_Scene850Marker, 0.0, 0.0, 0.0, True, False)
  KaiREF.Enable(False)
  Alias_TriggerStage825.GetRef().Enable(False)
  Alias_Hadrian.GetRef().Moveto(UC07_Jakob_Scene850Marker, 0.0, 0.0, 0.0, True, False)
  Alias_Jakob.GetRef().Moveto(UC07_Hadrian_Scene850Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0825_Item_00()
  Alias_Kaiser.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  UC07_850_KaiserHadrianJakob_Reunite.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  UC08.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
