ScriptName DialogueCrimeGuardsQuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct CrimeFactionGlobals
  Faction CrimeFaction
  GlobalVariable CountArrests
  GlobalVariable CountJail
  GlobalVariable CountPayFine
  GlobalVariable CountResist
EndStruct


;-- Variables ---------------------------------------
Int CountArrests = 0 Const
Int CountJail = 1 Const
Int CountPayFine = 2 Const
Int CountResist = 3 Const

;-- Properties --------------------------------------
Group CrimeGlobals
  GlobalVariable Property CrimeBribeAmount Auto Const mandatory
  GlobalVariable Property CrimeAllowBribePlayerCreditsRequired Auto Const mandatory
  GlobalVariable Property CrimeBountyAmount Auto Const mandatory
EndGroup

Group SpecialCases
  Keyword Property LocTypeSettlement Auto Const mandatory
  Quest Property City_Akila_Ashta01 Auto Const mandatory
  Location Property CityAkilaCityLocation Auto Const mandatory
  Int Property Ashta01_StageRequired = 50 Auto Const
  Int Property Ashta01_StageToSet = 65 Auto Const
EndGroup

ReferenceAlias Property Alias_Guard Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
dialoguecrimeguardsquestscript:crimefactionglobals[] Property CrimeFactions Auto Const
{ array to hold globals for each crime faction to count player arrests etc. }

;-- Functions ---------------------------------------

Function PlayerResistingArrest()
  Self.IncrementCrimeGlobal(CountResist)
  Alias_Guard.TryToSetPlayerResistingArrest()
EndFunction

Function PlayerGoToJail()
  Self.IncrementCrimeGlobal(CountJail)
  Alias_Guard.TryToSendPlayerToJail(True, False)
  SQ_Parent.SendContrabandConfiscatedEvent(Alias_Guard.TryToGetCrimeFaction())
EndFunction

Function PlayerPayFine(Bool abRemoveStolenItems, Bool abGoToJail)
  Self.IncrementCrimeGlobal(CountPayFine)
  Alias_Guard.TryToPlayerPayFine(abRemoveStolenItems, abGoToJail)
  If abRemoveStolenItems
    SQ_Parent.SendContrabandConfiscatedEvent(Alias_Guard.TryToGetCrimeFaction())
  EndIf
EndFunction

Function PlayerTryToArrest()
  CrimeAllowBribePlayerCreditsRequired.SetValue(0.0)
  CrimeBountyAmount.SetValue(0.0)
  Faction CrimeFaction = Alias_Guard.TryToGetCrimeFaction()
  If CrimeFaction
    Float currentBounty = CrimeFaction.GetCrimeGold() as Float
    CrimeBountyAmount.SetValue(currentBounty)
    CrimeAllowBribePlayerCreditsRequired.SetValue(currentBounty + CrimeBribeAmount.Getvalue())
    Self.UpdateCurrentInstanceGlobal(CrimeBountyAmount)
    Self.UpdateCurrentInstanceGlobal(CrimeAllowBribePlayerCreditsRequired)
  EndIf
  Self.IncrementCrimeGlobal(CountArrests)
  If City_Akila_Ashta01.GetStageDone(Ashta01_StageRequired) && City_Akila_Ashta01.GetStageDone(Ashta01_StageToSet) == False
    If Game.GetPlayer().GetCurrentLocation().IsSameLocation(CityAkilaCityLocation, LocTypeSettlement)
      City_Akila_Ashta01.SetStage(Ashta01_StageToSet)
    EndIf
  EndIf
EndFunction

Function PlayerSmuggling()
  Alias_Guard.TryToSendSmugglingAlarm()
EndFunction

Function IncrementCrimeGlobal(Int globalTypeEnum)
  If globalTypeEnum > -1 && globalTypeEnum <= CountResist
    Faction CrimeFaction = Alias_Guard.TryToGetCrimeFaction()
    Int factionIndex = CrimeFactions.findstruct("CrimeFaction", CrimeFaction, 0)
    If factionIndex > -1
      dialoguecrimeguardsquestscript:crimefactionglobals theFactionGlobals = CrimeFactions[factionIndex]
      GlobalVariable countGlobal = None
      If globalTypeEnum == CountArrests
        countGlobal = theFactionGlobals.CountArrests
      ElseIf globalTypeEnum == CountJail
        countGlobal = theFactionGlobals.CountJail
      ElseIf globalTypeEnum == CountPayFine
        countGlobal = theFactionGlobals.CountPayFine
      ElseIf globalTypeEnum == CountResist
        countGlobal = theFactionGlobals.CountResist
      EndIf
      If countGlobal
        countGlobal.Mod(1.0)
      EndIf
    EndIf
  EndIf
EndFunction

Function TestGoToJail(Faction CrimeFaction, Bool realJail)
  CrimeFaction.SendPlayerToJail(True, realJail)
EndFunction
