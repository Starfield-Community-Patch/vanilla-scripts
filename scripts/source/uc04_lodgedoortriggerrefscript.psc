ScriptName UC04_LodgeDoorTriggerRefScript Extends ObjectReference

;-- Variables ---------------------------------------
Int iCooldownTimerID = 1 Const

;-- Properties --------------------------------------
Message Property UC04_LodgeBlocked Auto Const mandatory
{ Message to show when the player activates this trigger }
Int Property CooldownTimer = 5 Auto Const
{ How often we show the warning prompt }
Bool Property InCooldown = False Auto
{ If true, don't reshow the warning message }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If !InCooldown
    InCooldown = True
    UC04_LodgeBlocked.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.StartTimer(CooldownTimer as Float, iCooldownTimerID)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iCooldownTimerID
    InCooldown = False
  EndIf
EndEvent
