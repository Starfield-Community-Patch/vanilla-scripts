ScriptName UC06_TurretOnlineScript Extends SpaceshipReference Const

;-- Variables ---------------------------------------
Int iTurnOnWaitID = 1 Const

;-- Properties --------------------------------------
Faction Property PlayerFriendFaction Auto Const mandatory
Float Property WaitTime Auto Const mandatory
ActorValue Property HideShipFromHUDValue Auto Const mandatory

;-- Functions ---------------------------------------

Function SetTurretOnline()
  Self.StartTimer(WaitTime, iTurnOnWaitID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTurnOnWaitID
    Self.SetValue(HideShipFromHUDValue, 0.0)
    Self.SetUnconscious(False)
    Self.RemoveFromFaction(PlayerFriendFaction)
  EndIf
EndEvent
