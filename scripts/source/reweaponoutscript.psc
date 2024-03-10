ScriptName REWeaponOutScript Extends Quest

;-- Variables ---------------------------------------
Int WeaponOutTimerID = 10
Float WeaponOutTimerLength = 3.0

;-- Functions ---------------------------------------

Function StartUp()
  Self.StartTimer(WeaponOutTimerLength, WeaponOutTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == WeaponOutTimerID
    If !Game.GetPlayer().IsWeaponDrawn()
      Self.SendCustomEvent("reweaponoutscript_OnWeaponAway", None)
    EndIf
    Self.StartTimer(WeaponOutTimerLength, WeaponOutTimerID)
  EndIf
EndEvent
