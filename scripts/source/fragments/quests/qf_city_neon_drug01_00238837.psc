ScriptName Fragments:Quests:QF_City_Neon_Drug01_00238837 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_C153Container Auto Const mandatory
RefCollectionAlias Property Alias_BadGuys Auto Const mandatory
ReferenceAlias Property Alias_Felix Auto Const mandatory
ReferenceAlias Property Alias_Yannick Auto Const mandatory
Quest Property City_Neon_Drug02 Auto Const mandatory
ReferenceAlias Property Alias_NesharStart Auto Const mandatory
ReferenceAlias Property Alias_Neshar Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_C203Container Auto Const mandatory
MiscObject Property Neon_Drug01_Package Auto Const mandatory
LeveledItem Property Drug02_AmpResearch Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
Scene Property Drug01_550_SyndicateGreeting Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property Neon_EvictedSleepcrate_Global Auto Const mandatory
Quest Property SleepcrateMinigameQuest Auto Const
ReferenceAlias Property Alias_XenofreshFisheriesDoor Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard00 Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard01 Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard_NoTrespass Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard_NoTrespass01 Auto Const mandatory
ReferenceAlias Property Alias_NesharsPackage Auto Const mandatory
ObjectReference Property Neon_Drug01_NesharCrateDoor Auto Const mandatory
ObjectReference Property Drug01_NesharDoorRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0420_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False)
  Game.GetPlayer().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(125)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100)
  Float fAggression = 0.0
  Alias_BadGuys.SetValue(Aggression, fAggression)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(700)
  Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Neshar.GetRef().Disable(False)
  Game.GetPlayer().MoveTo(Alias_Yannick.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Drug01_NesharDoorRef.Lock(True, False, True)
  Drug01_NesharDoorRef.SetLockLevel(254)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_Neshar.GetRef().Enable(False)
  Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Neshar.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_C153Container.GetRef().Unlock(False)
  Neon_Drug01_NesharCrateDoor.Unlock(False)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Neon_EvictedSleepcrate_Global.Mod(1.0)
  SleepcrateMinigameQuest.SetStage(10)
  Alias_C203Container.GetRef().Unlock(False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  DialogueFCNeon.SetStage(490)
  Alias_Felix.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Game.GetPlayer().RemoveItem(Alias_NesharsPackage.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_BadGuys.EnableAll(False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetStage(575)
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Alias_BadGuys.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Float fAggression = 1.0
  Alias_BadGuys.SetValue(Aggression, fAggression)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
  Alias_Felix.GetRef().Enable(False)
  Alias_Felix.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Alias_Felix.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0720_Item_00()
  (Alias_Felix.GetRef() as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0730_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0790_Item_00()
  Game.GetPlayer().AddItem(Drug02_AmpResearch as Form, 1, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  city_neon_drug01_questscript kmyQuest = __temp as city_neon_drug01_questscript
  Self.CompleteAllObjectives()
  Drug01_NesharDoorRef.Unlock(False)
  Drug01_NesharDoorRef.SetLockLevel(0)
  Alias_Neshar.GetActorRef().Disable(False)
  kmyQuest.UnregisterForExteriorDoorEvents()
  City_Neon_Drug02.Start()
  City_Neon_Drug02.SetActive(True)
  Alias_XenofreshFisheriesDoor.GetRef().Unlock(False)
  Alias_XenofreshGuard00.GetRef().Disable(False)
  Alias_XenofreshGuard01.GetRef().Disable(False)
  Alias_XenofreshGuard_NoTrespass.GetRef().Enable(False)
  Alias_XenofreshGuard_NoTrespass01.GetRef().Enable(False)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Felix.GetRef().Disable(False)
  Alias_Neshar.GetRef().Disable(False)
  Self.Stop()
EndFunction
