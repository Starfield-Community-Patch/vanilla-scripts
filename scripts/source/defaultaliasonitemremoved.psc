ScriptName DefaultAliasOnItemRemoved Extends DefaultAlias default
{ Sets quest stage when items are removed from this Alias.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the PLAYER.
<LocationToCheck> is the current location of THIS alias. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Form Property ItemFilter Auto Const
  { The item filter defining the items we care about being removed from the container. See "AddInventoryEventFilter" function documentation for details }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(ItemFilter)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Game.GetPlayer() as ObjectReference, Self.TryToGetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent
