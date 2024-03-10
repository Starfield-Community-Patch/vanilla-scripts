ScriptName TestAliasRefillScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Alias Property ActorFillFromLoadedArea Auto Const
Alias Property RefFillFromLocationAlias Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.StartTimer(5.0, 0)
EndEvent

Event OnTimer(Int aiTimerID)
  ActorFillFromLoadedArea.RefillAlias()
  RefFillFromLocationAlias.RefillAlias()
  Self.StartTimer(5.0, 0)
EndEvent
