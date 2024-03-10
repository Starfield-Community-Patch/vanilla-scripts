ScriptName DefaultTopicInfoSetActorValue Extends TopicInfo Const default
{ Sets or mods an actor value on the topic info target and/or on the player }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Data
  Bool Property OnEnd = True Auto Const
  { Set to true if you want this to fire on the of the line. Otherwise, it'll trigger on start }
  Bool Property SetOnSpeaker = True Auto Const
  { Set to true if you want the value to be set on the line's speaker. }
  Bool Property SetOnPlayer = False Auto Const
  { Set to true if you want the value to be set on the line's player.

NOTE: topic infos in scenes will NOT have a target. }
  ActorValue Property ValueToModify Auto Const mandatory
  { The Actor Value to set }
  Float Property NewValue = 1.0 Auto Const
  { The new value for the given actor value }
  Bool Property SetActorValueToNewValue = True Auto Const
  { TRUE = will call SetValue(ValueToModify, newValue)
                FALSE = will call ModValue(ValueToModify, newValue) }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If !OnEnd
    Self.HandleActorValueChange(akSpeakerRef)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If OnEnd
    Self.HandleActorValueChange(akSpeakerRef)
  EndIf
EndEvent

Function HandleActorValueChange(ObjectReference akSpeakerRef)
  If SetOnSpeaker
    Self.ChangeActorValue(akSpeakerRef)
  EndIf
  If SetOnPlayer
    Self.ChangeActorValue(Game.GetPlayer() as ObjectReference)
  EndIf
EndFunction

Function ChangeActorValue(ObjectReference refToModify)
  If SetActorValueToNewValue
    refToModify.SetValue(ValueToModify, NewValue)
  Else
    refToModify.ModValue(ValueToModify, NewValue)
  EndIf
EndFunction
