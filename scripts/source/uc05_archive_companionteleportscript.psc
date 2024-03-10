ScriptName UC05_Archive_CompanionTeleportScript Extends ReferenceAlias
{ Followers told to wait in Armistice Archives are moved outside the vault to prevent them from getting stuck }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
Int Property StageToCheck Auto Const
Cell Property CityNewAtlantisArmisticeArchives Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellDetach()
    Actor[] WaitingFollowers = SQ_Followers.GetFollowers(False, True)
    If WaitingFollowers[0] != None && Self.GetOwningQuest().GetStageDone(StageToCheck)
      Self.goToState("Done")
      Int I = 0
      While I < WaitingFollowers.Length
        If WaitingFollowers[I].GetParentCell() == CityNewAtlantisArmisticeArchives
          SQ_Followers.CommandFollow(WaitingFollowers[I])
          WaitingFollowers[I].MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
        EndIf
        I += 1
      EndWhile
    EndIf
  EndEvent
EndState
