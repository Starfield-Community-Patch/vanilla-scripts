ScriptName DefaultAliasOnActivateGiveItem Extends DefaultAliasOnActivate default
{ Adds item(s) to <RefToCheck> when THIS Alias's reference is activated.
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
  Form Property ItemToGive Auto Const mandatory
  { Give this item to RefToCheck }
  Int Property AmountToGive = 1 Auto Const
  { The amount to give }
  Bool Property GiveSilently = False Auto Const
  { (Default false) If true, give the item silently. If true, show message when giving item. }
  ReferenceAlias Property ReferenceAliasToAddTo Auto Const
  { The item (or first item) will be put into this ref alias when it is given. }
  RefCollectionAlias Property ReferenceCollectionAliasToAddTo Auto Const
  { The item(s) will be put into this ref collection when they are given. }
EndGroup


;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Int I = 0
  While I < AmountToGive
    ObjectReference refToCheck = ParentScriptFunctionParams.refToCheck
    If ReferenceAliasToAddTo as Bool && I == 0
      refToCheck.AddAliasedItem(ItemToGive, ReferenceAliasToAddTo as Alias, 1, GiveSilently)
    EndIf
    If ReferenceCollectionAliasToAddTo
      refToCheck.AddAliasedItem(ItemToGive, ReferenceCollectionAliasToAddTo as Alias, 1, GiveSilently)
    EndIf
    I += 1
  EndWhile
  Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith)
EndFunction
