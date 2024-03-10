ScriptName ProximityTrapScript Extends ObjectReference Const
{ Damages itself when linked trigger is entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property TimeToExplode = 3.0 Auto Const
Float Property DamageToDo = 100.0 Auto Const
String Property SequenceName = "Play01" Auto Const
{ Effect Sequence to play when this is activated. }
ObjectReference Property TargetArt Auto Const
wwiseevent Property WarningSound Auto Const
Keyword Property IgnoredByTrapFloraKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.GetLinkedRef(None)
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnTriggerEnter")
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnTriggerLeave")
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If !akActionRef.HasKeyword(IgnoredByTrapFloraKeyword)
    If TimeToExplode != 0.0
      Self.StartTimer(TimeToExplode, 0)
      WarningSound.Play(Self as ObjectReference, None, None)
    Else
      Self.Explode()
      TargetArt.StartSequence(SequenceName, True, 1.0)
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  Self.Explode()
EndEvent

Function Explode()
  Self.DamageObject(DamageToDo)
  Self.UnregisterForAllEvents()
EndFunction
