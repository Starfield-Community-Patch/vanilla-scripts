ScriptName Fragments:Quests:QF_City_Neon_Gang01_00229EE7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property Gang01_200a_AuraBriggsAmbient Auto Const mandatory
RefCollectionAlias Property Alias_DiscipleEnemies Auto Const mandatory
Quest Property City_Neon_Gang02 Auto Const mandatory
ReferenceAlias Property Alias_StrikersDoor Auto Const mandatory
ReferenceAlias Property Alias_Digger Auto Const mandatory
ObjectReference Property Gang01_BarMarker Auto Const mandatory
ReferenceAlias Property Alias_MadameSauvage Auto Const mandatory
ReferenceAlias Property Alias_Andrea Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Digger.GetActorRef().EvaluatePackage(False)
  Gang01_BarMarker.Disable(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_Digger.GetActorRef().EvaluatePackage(False)
  Gang01_BarMarker.Disable(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
  Self.SetStage(210)
  Alias_StrikersDoor.GetRef().Unlock(False)
  Alias_StrikersDoor.GetRef().SetLockLevel(0)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Gang01_200a_AuraBriggsAmbient.Start()
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_Andrea.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_Andrea.GetActorRef().EvaluatePackage(False)
  Alias_DiscipleEnemies.EnableAll(False)
  Alias_Digger.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_Andrea.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.CompleteAllObjectives()
  City_Neon_Gang02.SetStage(100)
  City_Neon_Gang02.SetActive(True)
  Gang01_BarMarker.Enable(False)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
