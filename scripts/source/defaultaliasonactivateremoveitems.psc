ScriptName DefaultAliasOnActivateRemoveItems Extends DefaultAliasOnActivate default
{ Removes item(s) to <RefToCheck> when THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Form Property ItemToRemove Auto Const mandatory
  { Remove this item from RefToCheck }
  Int Property AmountToRemove = 1 Auto Const
  { The amount to give }
  Bool Property RemoveSilently = False Auto Const
  { (Default false) If true, give the item silently. If true, show message when giving item. }
  Message Property InsufficientItemsMessage Auto Const
  { Message to display if RefToCheck doesn't have AmountToRemove or more ItemToRemove in their inventory }
EndGroup


;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck
  If RefToCheck.GetItemCount(ItemToRemove) >= AmountToRemove
    ParentScriptFunctionParams.RefToCheck.RemoveItem(ItemToRemove, AmountToRemove, RemoveSilently, None)
    Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith)
  ElseIf InsufficientItemsMessage
    InsufficientItemsMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction
