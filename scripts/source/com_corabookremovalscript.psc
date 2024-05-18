ScriptName COM_CoraBookRemovalScript Extends ReferenceAlias
{ A script to give experience and prevent players from overloading Cora with books }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Form Property ItemFilter Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnUnload()
  ObjectReference CoraRef = Self.GetRef()
  Int BookTotal = CoraRef.GetItemCount(ItemFilter)
  CoraRef.RemoveItem(ItemFilter, BookTotal, False, None)
EndEvent
