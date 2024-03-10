ScriptName RI07_MarketingTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Armor Property RI07_ResearchUniform Auto Const mandatory
Int Property iStageToSet Auto Const mandatory
Int Property iGetStageDone Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer()
  Quest OwningQuest = Self.GetOwningQuest()
  If (akActionRef == PlayerRef as ObjectReference) && PlayerRef.IsEquipped(RI07_ResearchUniform as Form) == False && !OwningQuest.GetStageDone(iGetStageDone) && OwningQuest.GetStageDone(iPreReqStage)
    OwningQuest.SetStage(iStageToSet)
  EndIf
EndEvent
