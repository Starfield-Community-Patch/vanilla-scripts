ScriptName FFCydoniaZ04WallActivatorAliasScript Extends RefCollectionAlias
{ Modifies a global value for the Quest Objective, Enables a linked ref, and Removes the Activated Ref from the Collection }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaZ04_DrawingsPosted Auto Const mandatory
GlobalVariable Property FFCydoniaZ04_DrawingsTotal Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Int Property ObjectiveToUpdate Auto Const mandatory
Int Property StageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If akSenderRef.GetLinkedRef(LinkCustom01)
      akSenderRef.GetLinkedRef(LinkCustom01).Enable(False)
      akSenderRef.BlockActivation(True, True)
      Float fTotalDrawings = FFCydoniaZ04_DrawingsTotal.GetValue()
      If FFCydoniaZ04_DrawingsPosted.GetValue() <= fTotalDrawings
        Quest myQuest = Self.GetOwningQuest()
        If myQuest.ModObjectiveGlobal(1.0, FFCydoniaZ04_DrawingsPosted, ObjectiveToUpdate, fTotalDrawings, True, True, True, False) == True
          myQuest.SetStage(StageToSet)
        EndIf
        Self.RemoveRef(akSenderRef)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnAliasInit()
  Self.BlockActivation(False, False)
EndEvent
