ScriptName UC06_OrlaseCabinDoorAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property UC06_OrlaseCabinKey Auto Const mandatory
{ Item to check if the player has to see if we should set this stage }
Int Property ShutdownStage = 450 Auto Const
{ Player already unlocked the door. Can now ignore setting this stage. }
Int Property StageToSet = 445 Auto Const
{ Stage to set if all criteria's met }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest()
  Actor PlayACT = Game.GetPlayer()
  If akActionRef == PlayACT as ObjectReference
    If !OQ.GetStageDone(StageToSet) && !OQ.GetStageDone(ShutdownStage) && PlayACT.GetItemCount(UC06_OrlaseCabinKey as Form) < 1
      OQ.SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
