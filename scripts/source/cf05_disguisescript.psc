ScriptName CF05_DisguiseScript Extends Quest

;-- Variables ---------------------------------------
Int CF05TimerID = 10 Const

;-- Properties --------------------------------------
Faction[] Property MyFaction Auto Const mandatory
Keyword Property CF05_EnsignArmorKeyword_Disguise Auto Const mandatory
Float Property TimeDelay Auto Const mandatory

;-- Functions ---------------------------------------

Function AddPlayerToFaction()
  Int I = 0
  While I < MyFaction.Length
    Game.GetPlayer().AddtoFaction(MyFaction[I])
    I += 1
  EndWhile
EndFunction

Function RemovePlayerFromFaction()
  Int I = 0
  While I < MyFaction.Length
    Game.GetPlayer().RemoveFromFaction(MyFaction[I])
    I += 1
  EndWhile
EndFunction

Function RunTimer()
  Self.CancelTimer(CF05TimerID)
  Self.StartTimer(TimeDelay, CF05TimerID)
EndFunction

Event OnTimer(Int timerID)
  If timerID == CF05TimerID
    Actor PlayerRef = Game.GetPlayer()
    If PlayerRef.WornHasKeyword(CF05_EnsignArmorKeyword_Disguise)
      Self.AddPlayerToFaction()
    Else
      Self.RemovePlayerFromFaction()
    EndIf
  EndIf
EndEvent
