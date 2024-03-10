ScriptName SQ_COM_CREW_GiveItemQuestScript Extends Quest
{ attached to SQ_Crew quest }

;-- Structs -----------------------------------------
Struct SkillDatum
  Perk GiveItemSkill
  { a perk on crew that will give the player items after exploring types of planets/locations }
  conditionform Conditions
  { conditions that when true (checked on change location) will grant items to give the player upon returning to the ship }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  sq_com_crew_giveitemquestscript:skilldatum[] Property SkillData Auto Const mandatory
  Float Property DistanceFromShip = 100.0 Auto Const
  { how far must the skill holder be from the ship before we check Conditions to determine if they have items to give to player - ie: how far must they adventure to emulate them having a chance to find stuff? }
EndGroup


;-- Functions ---------------------------------------

Bool Function CheckGiveItemConditions(Actor ActorToCheck)
  Bool passedDistanceCheck = ActorToCheck.GetDistance(Game.GetPlayerHomeSpaceShip() as ObjectReference) >= DistanceFromShip
  Bool passedSkillAndConditionsCheck = False
  If passedDistanceCheck
    Int I = 0
    While I < SkillData.Length && passedSkillAndConditionsCheck == False
      sq_com_crew_giveitemquestscript:skilldatum currentSkillDatum = SkillData[I]
      Bool hasSkillPerk = ActorToCheck.HasPerk(currentSkillDatum.GiveItemSkill)
      Bool passedConditions = False
      If hasSkillPerk
        passedConditions = currentSkillDatum.Conditions.IsTrue(ActorToCheck as ObjectReference, None)
      EndIf
      If hasSkillPerk && passedConditions
        passedSkillAndConditionsCheck = True
      EndIf
      I += 1
    EndWhile
  EndIf
  Return passedDistanceCheck && passedSkillAndConditionsCheck
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
