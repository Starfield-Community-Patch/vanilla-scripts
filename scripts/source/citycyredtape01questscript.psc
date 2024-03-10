ScriptName CityCYRedTape01QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01Resource01Count Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Resource01Total Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
Int Property GatherResourcesStage = 100 Auto Const
Int Property IronQTStage = 110 Auto Const
Int Property GatheredResourcesCompleteStage = 200 Auto Const
Int Property TrevorApplicationPlanStage = 250 Auto Const
Int Property ResourceObjective = 100 Auto Const
Int Property TurnInObjective = 200 Auto Const
ReferenceAlias Property Player Auto Const mandatory
ReferenceAlias Property DepositBin Auto Const mandatory
RefCollectionAlias Property IronDeposits Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerforInventoryFilter(Bool bRegister)
  citycyredtape01playerscript myPlayerScript = Player as citycyredtape01playerscript
  myPlayerScript.RegisterPlayerForResourceTracking(bRegister)
EndFunction

Function ResourceCheck()
  City_CY_RedTape01Resource01Count.SetValue(Game.GetPlayer().GetItemCount(InorgCommonIron as Form) as Float)
  Self.UpdateCurrentInstanceGlobal(City_CY_RedTape01Resource01Count)
  Float fResourceCount = City_CY_RedTape01Resource01Count.GetValue()
  Float fResourceTotal = City_CY_RedTape01Resource01Total.GetValue()
  If fResourceCount >= fResourceTotal
    If Self.IsObjectiveDisplayed(TurnInObjective) == False
      Self.SetStage(GatheredResourcesCompleteStage)
      Self.SetObjectiveDisplayed(ResourceObjective, False, False)
      Self.SetObjectiveDisplayed(TurnInObjective, True, True)
      DepositBin.GetRef().BlockActivation(False, False)
    EndIf
  ElseIf fResourceCount >= fResourceTotal - 5.0 && fResourceCount < fResourceTotal
    If !Self.GetStageDone(IronQTStage)
      IronDeposits.RefillAlias()
      Self.SetStage(IronQTStage)
    EndIf
    Self.SetObjectiveDisplayed(ResourceObjective, True, True)
    Self.SetObjectiveDisplayed(TurnInObjective, False, False)
    DepositBin.GetRef().BlockActivation(True, True)
  Else
    Self.SetObjectiveDisplayed(ResourceObjective, True, True)
    Self.SetObjectiveDisplayed(TurnInObjective, False, False)
    DepositBin.GetRef().BlockActivation(True, True)
  EndIf
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == GatherResourcesStage
    Self.RegisterPlayerforInventoryFilter(True)
  ElseIf auiStageID == TrevorApplicationPlanStage
    Self.RegisterPlayerforInventoryFilter(False)
  EndIf
EndEvent

Function DebugGiveResources()
  Game.GetPlayer().AddItem(InorgCommonIron as Form, City_CY_RedTape01Resource01Total.GetValue() as Int, False)
EndFunction
