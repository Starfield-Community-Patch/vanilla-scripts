ScriptName RI02_ReplacementTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property NinaPresentation Auto Const mandatory
ReferenceAlias Property NinaPresentationReplacement Auto Const mandatory
ReferenceAlias Property NinaPresentationMarker Auto Const mandatory
MiscObject Property RI02_NinaPresentationReplacement Auto Const mandatory
Int Property iStageSwapPresentation = 500 Auto Const
Int Property iStageSwapCompleted = 575 Auto Const
Int Property iStageReturnToImogene = 600 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference MyPlayer = Game.GetPlayer() as ObjectReference
  Quest MyQuest = Self.GetOwningQuest()
  If akActionRef == MyPlayer && MyPlayer.GetItemCount(RI02_NinaPresentationReplacement as Form) >= 1
    Self.GetRef().BlockActivation(True, True)
    MyPlayer.AddItem(NinaPresentation.GetRef() as Form, 1, False)
    Utility.Wait(1.0)
    MyPlayer.RemoveItem(NinaPresentationReplacement.GetRef() as Form, 1, False, None)
    NinaPresentationMarker.GetRef().PlaceAtMe(RI02_NinaPresentationReplacement as Form, 1, False, False, True, None, None, True)
    MyQuest.SetStage(iStageSwapCompleted)
    If MyQuest.IsObjectiveDisplayed(iStageSwapPresentation)
      MyQuest.SetStage(iStageReturnToImogene)
    EndIf
  EndIf
EndEvent
