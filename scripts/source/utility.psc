ScriptName Utility Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Var Function CallGlobalFunction(String asScriptName, String asFuncName, Var[] aParams) Global Native

Function CallGlobalFunctionNoWait(String asScriptName, String asFuncName, Var[] aParams) Global Native

String Function CaptureFrameRate(Int numFrames) Global Native

Function EndFrameRateCapture() Global Native

Function EnterTestData(String astestType, String astestMatter, String astestDetails, String astestResultContext, String astestResult) Global Native

String Function GameTimeToString(Float afGameTime) Global Native

Float Function GetAverageFrameRate() Global Native

Int Function GetBudgetCount() Global Native

String Function GetBudgetLimit(Int aiBudgetNumber) Global Native

String Function GetBudgetName(Int aiBudgetNumber) Global Native

String Function GetCurrentBudget(Int aiBudgetNumber) Global Native

Float Function GetCurrentGameTime() Global Native

String Function GetCurrentMemory() Global Native

Float Function GetCurrentRealTime() Global Native

Int Function GetCurrentStackID() Global Native

Float Function GetMaxFrameRate() Global Native

Float Function GetMinFrameRate() Global Native

String Function IntToHex(Int IntID) Global Native

Bool Function IsGameMenuPaused() Global Native

Bool Function OverBudget(Int aiBudgetNumber) Global Native

Function PostStartUpTimes() Global Native

Float Function RandomFloat(Float afMin, Float afMax) Global Native

Float[] Function RandomFloatsFromSeed(Int aiSeed, Int aiCount, Float afMin, Float afMax) Global Native

Int Function RandomInt(Int aiMin, Int aiMax) Global Native

Int[] Function RandomIntsFromSeed(Int aiSeed, Int aiCount, Int aiMin, Int aiMax) Global Native

Function SetINIBool(String ini, Bool value) Global Native

Function SetINIFloat(String ini, Float value) Global Native

Function SetINIInt(String ini, Int value) Global Native

Function SetINIString(String ini, String value) Global Native

Int[] Function SplitStringChars(String aString) Global Native

Function StartFrameRateCapture() Global Native

Function Wait(Float afSeconds) Global Native

Function WaitGameTime(Float afHours) Global Native

Function WaitMenuPause(Float afSeconds) Global Native

Float Function ExpiryDay(Float DaysFromNow, planet LocalPlanet, Float MaxUniversalDays, Float FutureStartDay) Global
  Float startDay = Math.Max(FutureStartDay, Utility.GetCurrentGameTime())
  Float localPlanetDayMult = 1.0
  If LocalPlanet
    localPlanetDayMult = 24.0 / LocalPlanet.GetDayLength()
  EndIf
  Float globalDaysToAdd = DaysFromNow * localPlanetDayMult
  If MaxUniversalDays > 0.0
    globalDaysToAdd = Math.Min(globalDaysToAdd, MaxUniversalDays)
  EndIf
  Float ExpiryDay = startDay + globalDaysToAdd
  Return ExpiryDay
EndFunction

Bool Function HasExpiryDayPassed(Float afExpiryDay) Global
  Return Utility.GetCurrentGameTime() >= afExpiryDay
EndFunction

Float Function GetHoursUntilLocalHour(Float afTargetHourLocal) Global
  Float dayLength = 24.0
  planet currentPlanet = Game.GetPlayer().GetCurrentPlanet()
  If currentPlanet
    dayLength = currentPlanet.GetDayLength()
  EndIf
  Float currentTime = 0.0
  If currentPlanet
    currentTime = Game.GetLocalTime()
  Else
    Float currentGameTime = Utility.GetCurrentGameTime()
    currentTime = (currentGameTime - Math.Floor(currentGameTime) as Float) * 24.0
  EndIf
  Float hoursUntil = 0.0
  If afTargetHourLocal > currentTime
    hoursUntil = afTargetHourLocal - currentTime
  Else
    hoursUntil = 24.0 - currentTime + afTargetHourLocal
  EndIf
  Float realHoursUntil = hoursUntil * dayLength / 24.0
  Return realHoursUntil
EndFunction

ObjectReference Function GetFirstPlayer(ObjectReference refToCheck01, ObjectReference refToCheck02, ObjectReference refToCheck03, ObjectReference refTocheck04) Global
  ObjectReference thePlayer = Game.GetPlayer() as ObjectReference
  ObjectReference foundPlayerRef = None
  ObjectReference[] refsToCheck = new ObjectReference[4]
  refsToCheck[0] = refToCheck01
  refsToCheck[1] = refToCheck02
  refsToCheck[2] = refToCheck03
  refsToCheck[3] = refTocheck04
  Int I = 0
  While foundPlayerRef == None && I < refsToCheck.Length
    If refsToCheck[I] == thePlayer
      foundPlayerRef = refsToCheck[I]
    EndIf
    I += 1
  EndWhile
  Return foundPlayerRef
EndFunction

ObjectReference Function GetFirstNonPlayer(ObjectReference refToCheck01, ObjectReference refToCheck02, ObjectReference refToCheck03, ObjectReference refTocheck04) Global
  ObjectReference thePlayer = Game.GetPlayer() as ObjectReference
  ObjectReference foundNonPlayerRef = None
  ObjectReference[] refsToCheck = new ObjectReference[4]
  refsToCheck[0] = refToCheck01
  refsToCheck[1] = refToCheck02
  refsToCheck[2] = refToCheck03
  refsToCheck[3] = refTocheck04
  Int I = 0
  While foundNonPlayerRef == None && I < refsToCheck.Length
    If refsToCheck[I] != thePlayer
      foundNonPlayerRef = refsToCheck[I]
    EndIf
    I += 1
  EndWhile
  Return foundNonPlayerRef
EndFunction
