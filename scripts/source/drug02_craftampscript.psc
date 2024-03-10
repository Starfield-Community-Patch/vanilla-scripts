ScriptName Drug02_CraftAmpScript Extends ReferenceAlias Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form Property FormToCheck Auto Const
Int Property StageToSet Auto Const
researchproject Property Drug_Research_T1_Amp Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnPlayerCraftItem")
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnPlayerCompleteResearch")
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
  If akCreatedItem == FormToCheck
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, researchproject akCompletedProject)
  If akCompletedProject == Drug_Research_T1_Amp
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
