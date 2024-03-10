ScriptName UC08_AB_HostileThrallCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Bool EnemiesEnabled
Bool WaveTriggered

;-- Properties --------------------------------------
RefCollectionAlias Property SubsequentCollection Auto Const
{ Once this collection is emptied, which one spawns next? }
RefCollectionAlias Property ActiveHostiles Auto Const mandatory
{ Ref collection that contains only the active enemy NPCs }
Int Property StageToSetOnEmpty = -1 Auto Const
{ Stage to set once this collection has been emptied }
GlobalVariable Property UC08_AB_SwitchCount Auto Const mandatory
{ Count of the number of switches to be thrown. If greater than 2, the Queen has lost her ability to call in reinforcements }
GlobalVariable Property UC08_AB_NextWaveTimer Auto Const mandatory
{ Global used to managed the amount ot time between the Queen's spawns }
GlobalVariable Property UC08_AB_WaveCount Auto Const mandatory
{ Count of how many enemy waves have fired off. Used to change up the dialogue lines from Percival. }
Bool Property TriggerNextWaveOnEmpty = True Auto Const
{ If set to true, when this wave is empty, start a timer to spawn the next one }
Bool Property PlayIncomingEnemiesScene = True Auto Const
{ If set to true, use one of the generic "enemies incoming" scenes }
Float Property MinTimerMultiper = 0.75 Auto Const
{ Multiplier for the min amount of time a next wave should take to trigger }
Float Property MaxTimerMultiper = 1.25 Auto Const
{ Multiplier for the max amount of time a next wave should take to trigger }
Scene Property UC08_QueenBattle_Percival_EnemiesInbound Auto Const mandatory
{ Scene to play when non-Morph enemies are inbound }
Scene Property UC08_QueenBattle_Percival_MorphsInbound Auto Const mandatory
{ Scene to play when Morphs are inbound }

;-- Functions ---------------------------------------

Function TriggerWave()
  WaveTriggered = True
  Self.CheckForEmpty()
EndFunction

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef)
  Self.CheckForEmpty()
EndEvent

Function CheckForEmpty()
  If WaveTriggered
    If Self.GetCount() <= 0 && UC08_AB_SwitchCount.GetValueInt() < 3
      If TriggerNextWaveOnEmpty
        Int WaveTimerBase = UC08_AB_NextWaveTimer.GetValueInt()
        Int iMinTime = (WaveTimerBase as Float * MinTimerMultiper) as Int
        Int iMaxTime = (WaveTimerBase as Float * MaxTimerMultiper) as Int
        Int iTimerLength = Utility.RandomInt(iMinTime, iMaxTime)
        Self.StartTimer(iTimerLength as Float, 0)
      EndIf
      If StageToSetOnEmpty >= 0
        Self.GetOwningQuest().SetStage(StageToSetOnEmpty)
      EndIf
    ElseIf !EnemiesEnabled
      EnemiesEnabled = True
      UC08_AB_WaveCount.Mod(1.0)
      Self.EnableAll(False)
      ActiveHostiles.AddRefCollection(Self as RefCollectionAlias)
    EndIf
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If UC08_AB_SwitchCount.GetValueInt() < 3
    UC08_AB_HostileThrallCollScript NextColl = SubsequentCollection as UC08_AB_HostileThrallCollScript
    If NextColl != None
      NextColl.TriggerWave()
      If PlayIncomingEnemiesScene
        Int icurrWave = UC08_AB_WaveCount.GetValueInt()
        If icurrWave == 4
          UC08_QueenBattle_Percival_MorphsInbound.Start()
        ElseIf icurrWave > 1
          UC08_QueenBattle_Percival_EnemiesInbound.Start()
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
