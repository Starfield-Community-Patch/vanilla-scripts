ScriptName FFConstantR02QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct CrimeFactionDatum
  Keyword SettlementCrimeFactionKeyword
  { The Crime Faction keyword used in the location where the family member can be found }
  Faction CrimeFaction
  { The corresponding Crime Faction for that Location }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property FamilyLoc Auto Const mandatory
Message[] Property FNameList Auto Const mandatory
Message[] Property MNameList Auto Const mandatory
ReferenceAlias Property Family Auto Const mandatory
ReferenceAlias Property Slate Auto Const mandatory
Book Property FFConstantR02_Slate Auto Const mandatory
Int Property StartStage = 100 Auto Const
ffconstantr02questscript:crimefactiondatum[] Property CrimeFactionData Auto Const
{ Array of data for setting up crime factions for the family member }

;-- Functions ---------------------------------------

Function SetCrimeFaction()
  Location myFamilyLocation = FamilyLoc.GetLocation()
  Actor myFamily = Family.GetActorRef()
  Int I = 0
  Int iCount = CrimeFactionData.Length
  While I < iCount
    If myFamilyLocation.HasKeyword(CrimeFactionData[I].SettlementCrimeFactionKeyword)
      myFamily.SetCrimeFaction(CrimeFactionData[I].CrimeFaction)
      I = iCount
    EndIf
    I += 1
  EndWhile
EndFunction

Function SetRelativeName()
  ActorBase myActorBase = Family.GetActorRef().GetLeveledActorBase()
  Int iSex = myActorBase.GetSex()
  If iSex == 0
    Self.SetMName()
  ElseIf iSex == 1
    Self.SetFName()
  Else
    Int iRandomSex = Utility.RandomInt(0, 1)
    If iRandomSex == 0
      Self.SetMName()
    ElseIf iRandomSex == 1
      Self.SetFName()
    EndIf
  EndIf
  Self.SetCrimeFaction()
EndFunction

Function SetMName()
  ObjectReference myRelative = Family.GetRef()
  Message myName = None
  Int iRandom = Utility.RandomInt(0, MNameList.Length - 1)
  myName = MNameList[iRandom]
  myRelative.SetOverrideName(myName)
  Self.CreateSlate(myName)
EndFunction

Function SetFName()
  ObjectReference myRelative = Family.GetRef()
  Message myName = None
  Int iRandom = Utility.RandomInt(0, FNameList.Length - 1)
  myName = FNameList[iRandom]
  myRelative.SetOverrideName(myName)
  Self.CreateSlate(myName)
EndFunction

Function CreateSlate(Message amName)
  Game.GetPlayer().AddAliasedItem(FFConstantR02_Slate as Form, Slate as Alias, 1, False)
  Slate.GetRef().AddTextReplacementData("myName", amName as Form)
  Self.SetStage(StartStage)
EndFunction

Function DebugObjective()
  Self.SetObjectiveDisplayed(StartStage, True, True)
EndFunction

Event OnQuestInit()
  Self.SetRelativeName()
EndEvent
