ScriptName MS06_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property MS06_ResourceTypes Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerForResourceTracking()
  Self.AddInventoryEventFilter(MS06_ResourceTypes as Form)
  Self.RunCheckResources()
EndFunction

Function RunCheckResources()
  Quest myQuest = Self.GetOwningQuest()
  ms06_questscript myQIScript = myQuest as ms06_questscript
  myQIScript.ResourceCheck()
EndFunction

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.RunCheckResources()
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Self.RunCheckResources()
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  Quest myQuest = Self.GetOwningQuest()
  ms06_questscript myQIScript = myQuest as ms06_questscript
  If auiStageID == myQIScript.GatherResourcesStage
    Self.RegisterPlayerForResourceTracking()
  ElseIf auiStageID == myQIScript.ResourcesCompletedStage
    Self.RemoveInventoryEventFilter(MS06_ResourceTypes as Form)
  EndIf
EndEvent
