ScriptName Fragments:Quests:QF_OE_AustinF_DeadManWalking_000FEA94 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Colonist Auto Const mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const mandatory
Scene Property Scene_Healed Auto Const mandatory
Potion Property MedPack Auto Const mandatory
RefCollectionAlias Property Alias_predators Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
env_afflictionscript Property ENV_AFFL_Infection_LungInfection Auto Const mandatory
ReferenceAlias Property Alias_spawnMarker Auto Const mandatory
RefCollectionAlias Property Alias_Creatures Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference predator = None
  ObjectReference marker = Alias_spawnMarker.GetRef()
  Int count = Alias_predators.GetCount()
  Int index = 0
  While index < count
    predator = Alias_predators.GetAt(index)
    predator.MoveTo(marker, 0.0, 0.0, 0.0, True, False)
    index += 1
  EndWhile
  Alias_predators.DisableAll(False)
  Alias_Creatures.KillAll(None)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Game.GetPlayer().GetItemCount(MedPack as Form) >= 1
    Game.GetPlayer().RemoveItem(MedPack as Form, 1, False, None)
    Self.SetStage(275)
  Else
    Self.SetStage(300)
  EndIf
EndFunction

Function Fragment_Stage_0275_Item_00()
  Scene_Healed.Start()
  ENV_AFFL_Infection_LungInfection.Cure()
EndFunction

Function Fragment_Stage_0280_Item_00()
  Actor Colonist = Alias_Colonist.GetActorRef()
  Colonist.SetProtected(False)
  Colonist.Kill(None)
EndFunction

Function Fragment_Stage_0300_Item_00()
  ENV_AFFL_Infection_LungInfection.Gain(False, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  If !Self.GetStageDone(275)
    Self.SetStage(300)
  EndIf
  Self.SetStage(700)
  If Self.GetStageDone(250) || Self.GetStageDone(200)
    Self.SetStage(985)
  Else
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_predators.EnableAll(False)
  Alias_predators.EvaluateAll()
  If !Self.GetStageDone(600)
    Alias_Colonist.GetActorRef().SetProtected(False)
  EndIf
EndFunction

Function Fragment_Stage_0985_Item_00()
  Self.FailAllObjectives()
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.SetStage(995)
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives()
EndFunction
