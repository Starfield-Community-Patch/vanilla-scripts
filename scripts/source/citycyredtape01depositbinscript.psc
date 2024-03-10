ScriptName CityCYRedTape01DepositBinScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Resource01Total Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor myPlayer = Game.GetPlayer()
  If akActionRef == myPlayer as ObjectReference
    Quest myQuest = Self.GetOwningQuest()
    citycyredtape01questscript myQuestScript = myQuest as citycyredtape01questscript
    If myQuest.GetStageDone(myQuestScript.GatheredResourcesCompleteStage) && !myQuest.GetStageDone(myQuestScript.TrevorApplicationPlanStage)
      Int iResource01Total = City_CY_RedTape01Resource01Total.GetValue() as Int
      If myPlayer.GetItemCount(InorgCommonIron as Form) >= iResource01Total
        myQuest.SetStage(myQuestScript.TrevorApplicationPlanStage)
        myPlayer.RemoveItem(InorgCommonIron as Form, iResource01Total, False, None)
        ObjectReference myRef = Self.GetRef().GetLinkedRef(LinkCustom01)
        myRef.Enable(False)
        Self.GetRef().BlockActivation(True, True)
      EndIf
    EndIf
  EndIf
EndEvent
