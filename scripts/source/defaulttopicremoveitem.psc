ScriptName DefaultTopicRemoveItem Extends TopicInfo Const default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property RemoveItemOnBegin = False Auto Const
{ Default: false; should we remove the item when the topic starts playing? }
Bool Property RemoveItemOnEnd = True Auto Const
{ Default: true; should we remove the item when the topic finishes playing? }
MiscObject Property MiscItemToRemove Auto Const
{ Which item should we remove from player? }
Int Property ItemCountToRemove = 1 Auto Const
{ how many items should we remove? }
GlobalVariable Property ItemCountToRemoveGlobal Auto Const
{ OPTIONAL - if this is provided, it will be used instead of ItemCountToRemove }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If RemoveItemOnBegin
    Self.RemoveItem()
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If RemoveItemOnEnd
    Self.RemoveItem()
  EndIf
EndEvent

Function RemoveItem()
  Int countToRemove = ItemCountToRemove
  If ItemCountToRemoveGlobal
    countToRemove = ItemCountToRemoveGlobal.GetValueInt()
  EndIf
  Game.GetPlayer().RemoveItem(MiscItemToRemove as Form, countToRemove, False, None)
EndFunction
