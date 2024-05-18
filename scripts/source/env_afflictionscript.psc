ScriptName ENV_AfflictionScript Extends Activator
{ script attached to activator prefixed "ENV_AFFL_" - holds various data and functions for Afflictions }

;-- Structs -----------------------------------------
Struct Stat
  String Name = "undefined"
  curve ChanceCurve
  Int Attempts_Poor = 0
  Int Attempts_Stable = 0
  Int Attempts_Good = 0
  Int Attempts_Excellent = 0
EndStruct


;-- Variables ---------------------------------------
Int iPrognosis_Excellent = 3 Const
Int iPrognosis_Good = 2 Const
Int iPrognosis_Poor = 0 Const
Int iPrognosis_Stable = 1 Const
env_afflictionscript:stat[] myStats
String strCureAttempts = "CureAttempts"
String strGainInfectionAttempts = "GainInfectionAttempts"
String strImproveAttempts = "ImproveAttempts"
String strWorsenAttempts = "WorsenAttempts"

;-- Properties --------------------------------------
Group Autofill
  sq_env_afflictionsscript Property SQ_ENV Auto Const mandatory
  ActorValue Property ENV_AFFL_BonusCureChance_Infection Auto Const mandatory
  ActorValue Property ENV_AFFL_BonusCureChance_Injury Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChallengeAV_Infection Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChallengeAV_Injury Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChance_PreventInfection Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChance_PreventInjury Auto Const mandatory
  ActorValue Property PEO_ENV_AFFL_Treatment_CureChance_AV Auto Const mandatory
  GlobalVariable Property PEO_PrognosisChances_GV Auto Const mandatory
  GlobalVariable Property PEO_PrognosisChances_IncChanceMult Auto Const mandatory
EndGroup

Group Data
  String Property ID Auto Const mandatory
  { a unique string to identify this object }
  Bool Property IsInfection = False Auto Const
  { True = infection, False (default) = Injury }
  wwiseevent Property SoundEvent Auto Const mandatory
  { what WwiseEvent to play when gaining the affliction }
  FormList Property AfflictionSpellList Auto Const mandatory
  { the spells that represent this affliction (ie Rank1, 2, 3 versions) }
  Keyword Property TreatmentEffectKeyword Auto Const mandatory
  { the keyword is on magic effect that represents the treatment for this affliction }
  env_afflictionscript[] Property InfectionArray Auto Const
  { an array of Infection Afflictions that this affliction can add }
  ActorValue Property PrognosisAV Auto Const mandatory
  { the actorvalue that will hold this afflictions prognosis value }
  curve Property Curve_Cure_Chance Auto Const mandatory
  { Curve table expression chance to cure. Input is value of PrognosisAV
    CURE means to remove the affliction completely }
  curve Property Curve_Improve_Chance Auto Const mandatory
  { Curve table expression chance to improve to the next level. Input is value of PrognosisAV
    IMPROVE means to increase the prognosis }
  curve Property Curve_Infection_Chance Auto Const
  { Curve table expression chance to gain an infection. Input is value of PrognosisAV }
  curve Property Curve_Worsen_Chance Auto Const
  { Curve table expression chance to worsen to the next level. Input is value of PrognosisAV
    WORSEN means to increase the tier of the affliction from tier i to tier - ie add additional symptoms }
  Bool Property Active Auto hidden
  { Flag set/unset when gained/cured }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  myStats = new env_afflictionscript:stat[0]
  env_afflictionscript:stat Stat_Improve = new env_afflictionscript:stat
  Stat_Improve.Name = strImproveAttempts
  Stat_Improve.ChanceCurve = Curve_Improve_Chance
  myStats.add(Stat_Improve, 1)
  env_afflictionscript:stat Stat_Cure = new env_afflictionscript:stat
  Stat_Cure.Name = strCureAttempts
  Stat_Cure.ChanceCurve = Curve_Cure_Chance
  myStats.add(Stat_Cure, 1)
  env_afflictionscript:stat Stat_Worsen = new env_afflictionscript:stat
  Stat_Worsen.Name = strWorsenAttempts
  Stat_Worsen.ChanceCurve = Curve_Worsen_Chance
  myStats.add(Stat_Worsen, 1)
  env_afflictionscript:stat Stat_GainInfection = new env_afflictionscript:stat
  Stat_GainInfection.Name = strGainInfectionAttempts
  Stat_GainInfection.ChanceCurve = Curve_Infection_Chance
  myStats.add(Stat_GainInfection, 1)
EndEvent

Bool Function Improve(Int ImprovementLevels, Bool isTreatment)
  Actor playerRef = Game.GetPlayer()
  Int currentValue = playerRef.GetValue(PrognosisAV) as Int
  Bool severityImproved = False
  Bool cured = False
  Bool isPrognosisInitiallyExcellent = currentValue >= iPrognosis_Excellent
  If isPrognosisInitiallyExcellent
    If isTreatment
      If Game.GetDieRollSuccess(Game.GetPlayer().GetValue(PEO_ENV_AFFL_Treatment_CureChance_AV) as Int, 1, 100, -1, -1)
        Self.Cure()
        cured = True
      EndIf
    Else
      Int iCurrentSpell = Self.GetSpellListIndexForCurrentSpell()
      If iCurrentSpell == 0
        Self.Cure()
        cured = True
      Else
        Spell currentSpell = AfflictionSpellList.GetAt(iCurrentSpell) as Spell
        Spell nextSpell = AfflictionSpellList.GetAt(iCurrentSpell - 1) as Spell
        Game.GetPlayer().RemoveSpell(currentSpell)
        Game.GetPlayer().AddSpell(nextSpell, False)
        SQ_ENV.StartAfflictionTimer(Self as ScriptObject)
        severityImproved = True
      EndIf
    EndIf
  EndIf
  Int newValue = currentValue + ImprovementLevels
  newValue = Math.Min(newValue as Float, iPrognosis_Excellent as Float) as Int
  Game.GetPlayer().SetValue(PrognosisAV, newValue as Float)
  If severityImproved
    SQ_ENV.ShowSeverityImprovedMessage(Self)
  ElseIf cured == False
    If isPrognosisInitiallyExcellent
      SQ_ENV.ShowAttemptedToCureMessage(Self)
    Else
      SQ_ENV.ShowImprovedMessage(Self)
    EndIf
  EndIf
  Return True
EndFunction

Function ResetPrognosis()
  Game.GetPlayer().SetValue(PrognosisAV, 0.0)
EndFunction

Bool Function CheckSkillPrevention(ActorValue SkillAV)
  Int chanceToPrevent = Game.GetPlayer().GetValue(SkillAV) as Int
  Bool preventionSuccess = Game.GetDieRollSuccess(chanceToPrevent, 1, 100, -1, -1)
  Return preventionSuccess
EndFunction

Bool Function Gain(Bool PerformSkillCheck, Bool OnlyWorsen)
  Bool skillCheckPrevented = False
  If PerformSkillCheck
    If IsInfection && Self.CheckSkillPrevention(ENV_AFFL_SkillChance_PreventInfection)
      skillCheckPrevented = True
    ElseIf IsInfection == False && Self.CheckSkillPrevention(ENV_AFFL_SkillChance_PreventInjury)
      skillCheckPrevented = True
    EndIf
  EndIf
  If skillCheckPrevented
    Return False
  EndIf
  Bool gained = False
  Bool worsened = False
  Int iCurrentSpell = Self.GetSpellListIndexForCurrentSpell()
  Int currentSpellListMaxIndex = AfflictionSpellList.GetSize() - 1
  If iCurrentSpell == currentSpellListMaxIndex
    
  ElseIf iCurrentSpell == -1
    If OnlyWorsen == False
      Int nextSpellInt = 0
      Spell nextSpell = AfflictionSpellList.GetAt(nextSpellInt) as Spell
      Game.GetPlayer().AddSpell(nextSpell, False)
      SQ_ENV.ShowGainedMessage(Self)
      SQ_ENV.StartAfflictionTimer(Self as ScriptObject)
      gained = True
    EndIf
  Else
    Spell currentSpell = AfflictionSpellList.GetAt(iCurrentSpell) as Spell
    Spell nextspell = AfflictionSpellList.GetAt(iCurrentSpell + 1) as Spell
    Game.GetPlayer().RemoveSpell(currentSpell)
    Game.GetPlayer().AddSpell(nextspell, False)
    SQ_ENV.ShowWorsenedMessage(Self)
    SQ_ENV.StartAfflictionTimer(Self as ScriptObject)
    worsened = True
  EndIf
  If gained
    Active = True
  EndIf
  If gained || worsened
    SoundEvent.PlayUI(None, None)
    Self.ResetPrognosis()
    SQ_ENV.SQ_ENV.SQ_ENV_Tutorial.StartAfflictionTutorial()
  EndIf
  Return gained || worsened
EndFunction

Int Function GetSpellListIndexForCurrentSpell()
  Int I = AfflictionSpellList.GetSize() - 1
  Int iLastFound = 0
  While I > -1
    Spell currentSpell = AfflictionSpellList.GetAt(I) as Spell
    If Game.GetPlayer().HasSpell(currentSpell as Form)
      Return I
    EndIf
    I -= 1
  EndWhile
  Return -1
EndFunction

Bool Function AttemptToWorsen(Int ForcedDieRoll, Int DebugDieRoll)
  Int Chance_Worsen = Self.GetChance_Worsen()
  If Chance_Worsen > 0
    Bool WorsenSuccess = Game.GetDieRollSuccess(Chance_Worsen, 1, 100, DebugDieRoll, ForcedDieRoll)
    Self.IncrementStat(strWorsenAttempts)
    If WorsenSuccess
      Return Self.Gain(False, True)
    EndIf
  EndIf
  Return False
EndFunction

Function IncrementStat(String Name)
  Int iFound = myStats.findstruct("Name", Name, 0)
  If iFound > -1
    env_afflictionscript:stat statToIncrement = myStats[iFound]
    Float PrognosisLevel = Game.GetPlayer().GetValue(PrognosisAV)
    If PrognosisLevel == iPrognosis_Poor as Float
      statToIncrement.Attempts_Poor = statToIncrement.Attempts_Poor + 1
    ElseIf PrognosisLevel == iPrognosis_Stable as Float
      statToIncrement.Attempts_Stable = statToIncrement.Attempts_Stable + 1
    ElseIf PrognosisLevel == iPrognosis_Good as Float
      statToIncrement.Attempts_Good = statToIncrement.Attempts_Good + 1
    ElseIf PrognosisLevel == iPrognosis_Excellent as Float
      statToIncrement.Attempts_Excellent = statToIncrement.Attempts_Excellent + 1
    EndIf
  EndIf
EndFunction

Function ResetStats()
  Int I = 0
  While I < myStats.Length
    myStats[I].Attempts_Poor = 0
    myStats[I].Attempts_Stable = 0
    myStats[I].Attempts_Good = 0
    myStats[I].Attempts_Excellent = 0
    I += 1
  EndWhile
EndFunction

Bool Function AttemptToImprove(Int ForcedDieRoll, Int DebugDieRoll)
  Int Chance_Improve = Self.GetChance_Improve()
  If Chance_Improve > 0
    Bool ImproveSuccess = Game.GetDieRollSuccess(Chance_Improve, 1, 100, DebugDieRoll, ForcedDieRoll)
    Self.IncrementStat(strImproveAttempts)
    If ImproveSuccess
      Return Self.Improve(1, False)
    EndIf
  EndIf
  Return False
EndFunction

Bool Function AttemptToGainInfection(Int ForcedDieRoll, Int DebugDieRoll)
  Int GainChance_Infection = Self.GetChance_Infection()
  If GainChance_Infection > 0
    Bool GainInfectionSuccess = Game.GetDieRollSuccess(GainChance_Infection, 1, 100, DebugDieRoll, ForcedDieRoll)
    Self.IncrementStat(strGainInfectionAttempts)
    If GainInfectionSuccess
      ENV_AfflictionScript randomInfection = None
      Int[] randomizedIndexes = commonarrayfunctions.GetRandomizedIndexes(InfectionArray.Length)
      Int I = 0
      While I < randomizedIndexes.Length && randomInfection == None
        ENV_AfflictionScript currentInfection = InfectionArray[randomizedIndexes[I]]
        If currentInfection.PlayerHasAffliction() == False
          randomInfection = currentInfection
        EndIf
        I += 1
      EndWhile
      Return randomInfection.Gain(True, False)
    EndIf
  EndIf
  Return False
EndFunction

Bool Function PlayerHasAffliction()
  Bool returnVal = False
  Int I = 0
  Int iMax = AfflictionSpellList.GetSize()
  While I < iMax && returnVal == False
    Spell currentSpell = AfflictionSpellList.GetAt(I) as Spell
    If Game.GetPlayer().HasSpell(currentSpell as Form)
      returnVal = True
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

Bool Function AttemptToCure(Int ForcedDieRoll, Int DebugDieRoll)
  Int cureChance = Self.GetChance_Cure()
  Bool cureSuccess = Game.GetDieRollSuccess(cureChance, 1, 100, DebugDieRoll, ForcedDieRoll)
  Self.IncrementStat(strCureAttempts)
  If cureSuccess
    Return Self.Cure()
  EndIf
  Return False
EndFunction

Bool Function Cure()
  FormList AfflictionList = AfflictionSpellList
  Bool hadAffliction = False
  Int I = 0
  Int iMax = AfflictionList.GetSize()
  While I < iMax
    Spell currentSpell = AfflictionList.GetAt(I) as Spell
    hadAffliction = hadAffliction || Game.GetPlayer().HasSpell(currentSpell as Form)
    Game.GetPlayer().RemoveSpell(currentSpell)
    I += 1
  EndWhile
  If hadAffliction
    SQ_ENV.ShowCuredMessage(Self)
    Active = False
    Actor playerRef = Game.GetPlayer()
    If IsInfection
      playerRef.SetValue(ENV_AFFL_SkillChallengeAV_Infection, playerRef.GetValue(ENV_AFFL_SkillChallengeAV_Infection) + 1.0)
    Else
      playerRef.SetValue(ENV_AFFL_SkillChallengeAV_Injury, playerRef.GetValue(ENV_AFFL_SkillChallengeAV_Injury) + 1.0)
    EndIf
    Self.ResetStats()
    Return True
  EndIf
  Return False
EndFunction

Int Function GetCurveChance(curve curveTable)
  Int iPrognosis = Game.GetPlayer().GetValue(PrognosisAV) as Int
  Int returnVal = 0
  If curveTable
    returnVal = curveTable.GetValueAt(iPrognosis as Float) as Int
  EndIf
  Return returnVal
EndFunction

Int Function GetChance_Cure()
  Int returnVal = Self.GetCurveChance(Curve_Cure_Chance)
  If returnVal > 0
    If IsInfection
      returnVal += Game.GetPlayer().GetValue(ENV_AFFL_BonusCureChance_Infection) as Int
    Else
      returnVal += Game.GetPlayer().GetValue(ENV_AFFL_BonusCureChance_Injury) as Int
    EndIf
  EndIf
  returnVal = Self.PEO_ChangeCureOrImproveChance(returnVal)
  Return returnVal
EndFunction

Int Function GetChance_Improve()
  Int returnVal = Self.GetCurveChance(Curve_Improve_Chance)
  returnVal = Self.PEO_ChangeCureOrImproveChance(returnVal)
  Return returnVal
EndFunction

Int Function GetChance_Worsen()
  Int returnVal = Self.GetCurveChance(Curve_Worsen_Chance)
  Return returnVal
EndFunction

Int Function GetChance_Infection()
  Int returnVal = Self.GetCurveChance(Curve_Infection_Chance)
  Return returnVal
EndFunction

Int Function PEO_ChangeCureOrImproveChance(Int valueToChange)
  Int prognosisChances_Setting = PEO_PrognosisChances_GV.GetValueInt()
  If prognosisChances_Setting != 0
    valueToChange = Math.Floor(valueToChange as Float * PEO_PrognosisChances_IncChanceMult.GetValue())
  EndIf
  Return valueToChange
EndFunction

String Function MakeStatString(env_afflictionscript:stat StatToGet)
  String returnVal = ((((", " + ID + ", " + StatToGet.Name + ", " + StatToGet.ChanceCurve as String) + ", " + StatToGet.Attempts_Poor as String) + ", " + StatToGet.Attempts_Stable as String) + ", " + StatToGet.Attempts_Good as String) + ", " + StatToGet.Attempts_Excellent as String
  Return returnVal
EndFunction

; Fixup hacks for debug-only function: TraceStats
Function TraceStats()
  String logname = "EnvironmentalGameplay_Afflictions_STATS"
  Bool opened = false
  If opened
    
  EndIf
  Int I = 0
  While I < myStats.Length
    env_afflictionscript:stat currentStat = myStats[I]
    String statString = Self.MakeStatString(currentStat)
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
