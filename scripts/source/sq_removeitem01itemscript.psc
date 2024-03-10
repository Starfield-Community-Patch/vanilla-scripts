ScriptName SQ_RemoveItem01ItemScript Extends ReferenceAlias Const
{ Handles the item being picked up before the bot arrives. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Bot Auto Const mandatory

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akNewContainer != Bot.GetRef()
    Self.GetOwningQuest().Stop()
  EndIf
EndEvent
