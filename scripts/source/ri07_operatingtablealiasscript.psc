ScriptName RI07_OperatingTableAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iActivatedChairStage Auto Const mandatory
Int Property iEnteredChairStage Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory
Int Property iTurnOffStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnterFurniture(Actor akActionRef)
  Quest OwningQuest = Self.GetOwningQuest()
  If akActionRef == Game.GetPlayer() && OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
    OwningQuest.SetStage(iEnteredChairStage)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Quest OwningQuest = Self.GetOwningQuest()
  Actor PlayerRef = Game.GetPlayer()
  If (akActionRef == PlayerRef as ObjectReference) && PlayerRef.GetCombatState() == 0 && OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
    OwningQuest.SetStage(iActivatedChairStage)
  EndIf
EndEvent
