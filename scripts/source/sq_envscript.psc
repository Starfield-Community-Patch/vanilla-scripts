ScriptName SQ_EnvScript Extends Quest
{ script attached to SQ_ENV quest }

;-- Variables ---------------------------------------
Bool DebugReportFallOn

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property TextReplacementRefAlias Auto Const mandatory
  ReferenceAlias Property Player Auto Const mandatory
  curve Property ENV_AFFL_FallDamageAfflictionChance Auto Const mandatory
  Message Property ENV_DEBUG_AFFL_Fall_Msg Auto Const mandatory
  sq_env_tutorialquestscript Property SQ_ENV_Tutorial Auto Const mandatory
EndGroup

Group FallData
  Float Property FallDamageThreshold_Small = 0.0 Auto Const
  { anything less than this isn't a fall for  affliction granting }
  Float Property FallDamageThreshold_Medium = 30.0 Auto Const
  { anything between this and FallDamageThreshold_Large is a medium fall }
  Float Property FallDamageThreshold_Large = 60.0 Auto Const
  { anything this or greater is a large fall }
EndGroup

Group DebugTest
  packin Property ENV_Hazard_PK_Vent_Gas_Corrosive Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForRemoteEvent(Player.GetActorReference() as ScriptObject, "OnPlayerFallLongDistance")
EndEvent

Event Actor.OnPlayerFallLongDistance(Actor akSender, Float afDamage)
  Self.GrantFallingAffliction(afDamage)
EndEvent

Function GrantFallingAffliction(Float Damage)
  Int afflictionChance = ENV_AFFL_FallDamageAfflictionChance.GetValueAt(Damage) as Int
  Bool dieRollSuccess = Game.GetDieRollSuccess(afflictionChance, 1, 100, -1, -1)
  If dieRollSuccess
    env_afflictionscript[] appropriateAfflictions = None
    sq_env_afflictionsscript SelfAfflictionScript = (Self as Quest) as sq_env_afflictionsscript
    If Damage >= FallDamageThreshold_Large
      appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsLarge()
    ElseIf Damage >= FallDamageThreshold_Medium
      appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsMedium()
    ElseIf Damage >= FallDamageThreshold_Small
      appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsSmall()
    EndIf
    If appropriateAfflictions.Length > 0
      Int I = Utility.RandomInt(0, appropriateAfflictions.Length - 1)
      env_afflictionscript randomAppropriateAffliction = appropriateAfflictions[I]
      randomAppropriateAffliction.Gain(True, False)
    EndIf
  EndIf
EndFunction

Function _ReportFall(Float Damage, Int afflictionChance, Bool dieRollSuccess)
  If DebugReportFallOn
    Int fallSize = 0
    If Damage >= FallDamageThreshold_Large
      fallSize = 3
    ElseIf Damage >= FallDamageThreshold_Medium
      fallSize = 2
    ElseIf Damage >= FallDamageThreshold_Small
      fallSize = 1
    EndIf
    ENV_DEBUG_AFFL_Fall_Msg.Show(Damage, fallSize as Float, afflictionChance as Float, dieRollSuccess as Float, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction

Function DisplayTextReplacedMessage(Message MessageToDisplay, Form FormWithName)
  ObjectReference tempRef = Game.GetPlayer().PlaceAtMe(FormWithName, 1, False, True, True, None, TextReplacementRefAlias as Alias, True)
  MessageToDisplay.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  TextReplacementRefAlias.Clear()
  tempRef.Delete()
EndFunction

Function TestFallInjuryCurve()
  Self.TestCurve(10.0, 30)
EndFunction

Function TestCurve(Float stepSize, Int steps)
  Float[] inputs = new Float[steps]
  Int I = 0
  While I < inputs.Length
    inputs[I] = I as Float * stepSize
    I += 1
  EndWhile
  Float[] values = ENV_AFFL_FallDamageAfflictionChance.GetValues(inputs)
  I = 0
  While I < values.Length
    I += 1
  EndWhile
EndFunction

Function DebugReportFall(Bool On)
  DebugReportFallOn = On
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
