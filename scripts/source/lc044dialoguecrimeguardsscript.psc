ScriptName LC044DialogueCrimeGuardsScript Extends Quest
{ special cases for LC044 }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guard Auto Const mandatory

;-- Functions ---------------------------------------

Function PlayerWinSpeechChallenge()
  Actor guardRef = Alias_Guard.GetActorRef()
  Faction crimeFaction = guardRef.GetCrimeFaction()
  Self.ClearPlayerBounty(crimeFaction)
  Alias_Guard.TryToPlayerPayFine(False, False)
EndFunction

Function PlayerGoToDetention()
  Actor guardRef = Alias_Guard.GetActorRef()
  Faction crimeFaction = guardRef.GetCrimeFaction()
  Self.ClearPlayerBounty(crimeFaction)
  crimeFaction.SendPlayerToJail(False, True)
EndFunction

Function ClearPlayerBounty(Faction crimeFaction)
  If crimeFaction
    crimeFaction.SetCrimeGold(0)
  EndIf
EndFunction
