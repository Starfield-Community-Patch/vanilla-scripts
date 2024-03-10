ScriptName DefaultAliasSetTimestampOnInit Extends ReferenceAlias Const default
{ sets a specified AV as a timestamp (with a specified offset from current time) OnAliasInit }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property TimestampAV Auto Const mandatory
{ actor value used to stamp GameDaysPassed + TimestampOffset on the ref in this alias }
Float Property TimestampOffset = 0.0 Auto Const
{ how much to add to GameDaysPassed when setting TimestampAV }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference myRef = Self.GetRef()
  Float timestamp = Utility.GetCurrentGameTime() + TimestampOffset
  myRef.SetValue(TimestampAV, timestamp)
EndEvent
