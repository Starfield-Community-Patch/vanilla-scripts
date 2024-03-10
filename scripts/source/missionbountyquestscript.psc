ScriptName MissionBountyQuestScript Extends missionquestscript
{ for bounty missions that need to select enemy type }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Bounty
  ReferenceAlias Property EnemyType Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor enemyActor = PrimaryRef.GetActorRef()
  If enemyActor
    Int I = 0
    Form enemyTypeMarker = None
    While I < MissionParent.enemyTypes.Length && enemyTypeMarker == None
      missionparentscript:missionenemytype theEnemyType = MissionParent.enemyTypes[I]
      If enemyActor.IsInFaction(theEnemyType.enemyFaction)
        enemyTypeMarker = theEnemyType.enemyName
      EndIf
      I += 1
    EndWhile
    If enemyTypeMarker
      EnemyType.ForceRefTo(enemyActor.PlaceAtMe(enemyTypeMarker, 1, False, True, True, None, None, True))
      Parent.OnQuestStarted()
    EndIf
  Else
    Self.Stop()
  EndIf
EndEvent
