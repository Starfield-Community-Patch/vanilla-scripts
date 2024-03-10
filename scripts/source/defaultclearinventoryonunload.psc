ScriptName DefaultClearInventoryOnUnload Extends ObjectReference Const default
{ Removes all items from this reference's inventory when unloaded. }

;-- Functions ---------------------------------------

Event OnUnload()
  Self.RemoveAllItems(None, False, False)
EndEvent
