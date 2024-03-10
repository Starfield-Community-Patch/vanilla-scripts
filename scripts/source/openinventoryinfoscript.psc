ScriptName OpenInventoryInfoScript Extends TopicInfo Const
{ opens actor's inventory on the info OnEnd event }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If Utility.IsGameMenuPaused() == False
    Utility.wait(0.200000003)
    If akSpeakerRef == Game.GetPlayer() as ObjectReference
      (akSpeakerRef as Actor).GetDialogueTarget().OpenInventory(True, None, True)
    Else
      (akSpeakerRef as Actor).OpenInventory(True, None, True)
    EndIf
  EndIf
EndEvent
