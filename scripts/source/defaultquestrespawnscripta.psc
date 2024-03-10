ScriptName defaultQuestRespawnScriptA Extends defaultQuestRespawnScript default
{ Simple script to respawn Aliases that have the DefaultAliasRespawnScriptA on them. }

;-- Functions ---------------------------------------

Function TryToRespawn(ReferenceAlias aliasToRespawn)
  If (StartStage == 0 || StartStage > 0 && Self.GetStageDone(StartStage)) && (DoneStage == 0 || DoneStage > 0 && !Self.GetStageDone(DoneStage)) && (RespawnPool == 0 || RespawnPool > 0 && respawnCount < RespawnPool)
    respawnCount += 1
    Utility.Wait(Utility.RandomInt(RespawnTimeMin, RespawnTimeMax) as Float)
    If (aliasToRespawn as defaultaliasrespawnscripta).RespawningOn
      Self.Respawn(aliasToRespawn)
    EndIf
  EndIf
EndFunction
