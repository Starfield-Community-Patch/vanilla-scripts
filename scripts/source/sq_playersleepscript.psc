ScriptName SQ_PlayerSleepScript Extends Actor Const
{ casts spells at player after waking up }

;-- Structs -----------------------------------------
Struct EffectDatum
  FormList KeywordList
  Spell SpellToCast
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { autofill }
  conditionform Property CND_SleepRequirements_WellRested_And_EmotionalSecurity Auto Const mandatory
  { autofill; SUBJECT: Player, TARGET: Bed }
  sq_playersleepscript:effectdatum[] Property SleepEffectData Auto Const mandatory
  { holds data associating keywords on beds with effects to cast. This found first (lower indexes) take precedence }
  Float Property RomanticCompanionDistance = 5.0 Auto Const
  { the distance needed for a romantic companion to be considered nearby; remember SQ_CompanionsScript moves companions to the bed the player clicked on if romantic }
  Spell Property WakeRomanticSpell Auto Const mandatory
  { spell to cast if a romantic companion is nearby when player wakes }
EndGroup

Keyword Property COM_NoSleepTeleportLocation Auto Const mandatory
{ If the location has this keyword, don't allow Companion to teleport there when Player awakens }

;-- Functions ---------------------------------------

Event OnInit()
  Self.RegisterForPlayerSleep()
EndEvent

Event OnPlayerSleepStop(Bool abInterrupted, ObjectReference akBed)
  If CND_SleepRequirements_WellRested_And_EmotionalSecurity.IsTrue(Game.GetPlayer() as ObjectReference, akBed)
    ObjectReference RomanticCompanion = SQ_Companions.SleepCompanionRomantic.GetRef()
    companionactorscript StandardCompanion = SQ_Companions.SleepCompanion.GetRef() as companionactorscript
    If RomanticCompanion != None || StandardCompanion != None && SQ_Companions.IsCompanionRomantic(StandardCompanion)
      Self.Apply(WakeRomanticSpell)
    Else
      Int I = 0
      While I < SleepEffectData.Length
        sq_playersleepscript:effectdatum currentDatum = SleepEffectData[I]
        If akBed.GetCurrentLocation().HasKeyword(COM_NoSleepTeleportLocation) == False
          If akBed.HasKeywordInFormList(currentDatum.KeywordList)
            Self.Apply(currentDatum.SpellToCast)
          EndIf
        EndIf
        I += 1
      EndWhile
    EndIf
  EndIf
EndEvent

Function Apply(Spell SpellToApply)
  SpellToApply.Cast(Game.GetPlayer() as ObjectReference, Game.GetPlayer() as ObjectReference)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
