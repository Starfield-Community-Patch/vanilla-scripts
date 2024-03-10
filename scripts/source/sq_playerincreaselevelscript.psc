ScriptName SQ_PlayerIncreaseLevelScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MB_MaxTargetLevel Auto Const mandatory
{ global for max encounter level }
Int Property encounterLevelMaxAdjustment = 10 Auto Const
{ how much to add to player level to get max encounter level global }
Spell Property WellnessAbilityRank01 Auto Const mandatory
Spell Property WellnessAbilityRank02 Auto Const mandatory
Spell Property WellnessAbilityRank03 Auto Const mandatory
Spell Property WellnessAbilityRank04 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor playerRef = Game.GetPlayer()
  Int playerLevel = playerRef.GetLevel()
  MB_MaxTargetLevel.SetValueInt(playerLevel + encounterLevelMaxAdjustment)
  Self.RemoveAndReapplySpells(playerRef, WellnessAbilityRank01)
  Self.RemoveAndReapplySpells(playerRef, WellnessAbilityRank02)
  Self.RemoveAndReapplySpells(playerRef, WellnessAbilityRank03)
  Self.RemoveAndReapplySpells(playerRef, WellnessAbilityRank04)
  Self.Stop()
EndEvent

Function RemoveAndReapplySpells(Actor akActor, Spell spellToRemoveAndReapply)
  Int timeoutIterations = 0
  If akActor.HasSpell(spellToRemoveAndReapply as Form)
    akActor.removeSpell(spellToRemoveAndReapply)
    While akActor.HasSpell(spellToRemoveAndReapply as Form) == True || timeoutIterations < 10
      Utility.Wait(0.100000001)
      timeoutIterations += 1
    EndWhile
    akActor.addSpell(spellToRemoveAndReapply, True)
    If timeoutIterations >= 10
      
    EndIf
  EndIf
EndFunction
