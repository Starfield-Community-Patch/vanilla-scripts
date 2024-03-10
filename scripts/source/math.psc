ScriptName Math Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Int Function Ceiling(Float afValue) Global Native

Float Function DegreesToRadians(Float afDegrees) Global Native

Int Function Floor(Float afValue) Global Native

Float Function RadiansToDegrees(Float afRadians) Global Native

Float Function abs(Float afValue) Global Native

Float Function acos(Float afValue) Global Native

Float Function asin(Float afValue) Global Native

Float Function atan(Float afValue) Global Native

Float Function cos(Float afValue) Global Native

Float Function pow(Float x, Float y) Global Native

Float Function sin(Float afValue) Global Native

Float Function sqrt(Float afValue) Global Native

Float Function tan(Float afValue) Global Native

Float Function Max(Float afValue1, Float afValue2) Global
  If afValue1 > afValue2
    Return afValue1
  Else
    Return afValue2
  EndIf
EndFunction

Float Function Min(Float afValue1, Float afValue2) Global
  If afValue1 < afValue2
    Return afValue1
  Else
    Return afValue2
  EndIf
EndFunction

Float Function Clamp(Float ValueToClamp, Float afValueMin, Float afValueMax) Global
  Return Math.Max(Math.Min(ValueToClamp, afValueMax), afValueMin)
EndFunction

Float Function Normalize(Float afValue, Float afMin, Float afMax) Global
  Return (afValue - afMin) / (afMax - afMin)
EndFunction

Int Function Round(Float afValueToRound) Global
  Int trunc = afValueToRound as Int
  If Math.abs(afValueToRound) - Math.abs(trunc as Float) >= 0.5
    If afValueToRound < 0.0
      Return trunc - 1
    Else
      Return trunc + 1
    EndIf
  EndIf
  Return trunc
EndFunction

Int Function ExtractDigit(Int number, Int position, Int NonExistentDigit) Global
  Int leftDigits = number / Math.pow(10.0, position as Float) as Int
  If leftDigits < 1
    Return NonExistentDigit
  Else
    Return leftDigits % 10
  EndIf
EndFunction

Float Function HoursAsDays(Float afHours) Global
  Return afHours / 24.0
EndFunction

Float Function MinutesAsDays(Float afMinutes) Global
  Return afMinutes / 24.0 / 60.0
EndFunction

Float Function SecondsAsDays(Float afSeconds) Global
  Return afSeconds / 24.0 / 60.0 / 60.0
EndFunction

Float Function DaysAsHours(Float afDays) Global
  Return afDays * 24.0
EndFunction

Float Function DaysAsMinutes(Float afDays) Global
  Return afDays * 24.0 * 60.0
EndFunction

Float Function DaysAsSeconds(Float afDays) Global
  Return afDays * 24.0 * 60.0 * 60.0
EndFunction
