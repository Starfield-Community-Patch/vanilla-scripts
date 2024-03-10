ScriptName Fragments:Quests:QF_City_Neon_Gang02_00226527 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Neon_Gang_Tagging Auto Const mandatory
Quest Property City_Neon_Gang03 Auto Const mandatory
ReferenceAlias Property Alias_GuardAt02 Auto Const mandatory
RefCollectionAlias Property Alias_DisciplesAt03 Auto Const mandatory
Scene Property Gang02_400_GuardAccost Auto Const mandatory
Scene Property Gang02_400a_GuardStart Auto Const mandatory
RefCollectionAlias Property Alias_DisciplesAt01 Auto Const mandatory
ReferenceAlias Property Alias_GangSign01 Auto Const mandatory
ReferenceAlias Property Alias_GangSign02 Auto Const mandatory
ReferenceAlias Property Alias_GangSign03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  City_Neon_Gang_Tagging.Start()
  Alias_DisciplesAt01.EnableAll(False)
  Alias_DisciplesAt01.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Alias_DisciplesAt03.EnableAll(False)
  Alias_DisciplesAt03.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(400, True, False)
  Self.SetObjectiveDisplayed(300, True, False)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Alias_GangSign01.GetRef().GetLinkedRef(None).PlayAnimation("Play01")
  If Self.GetStageDone(400) && Self.GetStageDone(500)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Alias_GangSign02.GetRef().GetLinkedRef(None).PlayAnimation("Play01")
  If Self.GetStageDone(300) && Self.GetStageDone(500)
    Self.SetStage(600)
  EndIf
  Alias_GuardAt02.GetRef().Enable(False)
  Gang02_400a_GuardStart.Start()
EndFunction

Function Fragment_Stage_0410_Item_00()
  (Alias_GuardAt02.GetRef() as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0440_Item_00()
  Alias_GuardAt02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Alias_GangSign03.GetRef().GetLinkedRef(None).PlayAnimation("Play01")
  If Self.GetStageDone(300) && Self.GetStageDone(400)
    Self.SetStage(600)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.CompleteAllObjectives()
  City_Neon_Gang03.SetStage(100)
  City_Neon_Gang03.SetActive(True)
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  City_Neon_Gang_Tagging.Stop()
  Alias_GuardAt02.GetRef().Disable(False)
  Alias_GangSign01.GetRef().GetLinkedRef(None).PlayAnimation("Play02")
  Alias_GangSign02.GetRef().GetLinkedRef(None).PlayAnimation("Play02")
  Alias_GangSign03.GetRef().GetLinkedRef(None).PlayAnimation("Play02")
  Self.Stop()
EndFunction
