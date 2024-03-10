ScriptName DefaultTopicAddItem Extends TopicInfo Const default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property AddItemOnBegin = False Auto Const
{ Default: false; should we add the item when the topic starts playing? }
Bool Property AddItemOnEnd = True Auto Const
{ Default: true; should we add the item when the topic finishes playing? }
Form Property ItemToAdd Auto Const
{ Which item should we add to player? }
Int Property AmountToAdd = 1 Auto Const
{ How many of the item(s) to add. }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If AddItemOnBegin
    Game.GetPlayer().AddItem(ItemToAdd, 1, False)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If AddItemOnEnd
    Game.GetPlayer().AddItem(ItemToAdd, AmountToAdd, False)
  EndIf
EndEvent
