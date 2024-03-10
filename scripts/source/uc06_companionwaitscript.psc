ScriptName UC06_CompanionWaitScript Extends ReferenceAlias Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CompanionResponseMarkup
  Bool Property PlayCompanionResponseScene = False Auto Const
  Scene Property CompanionResponseScene Auto Const
  Quest Property CompanionResponsePrereqQuest Auto Const
  Int Property CompanionResponsePrereqStage Auto Const
  ReferenceAlias Property Companion Auto Const
EndGroup

ReferenceAlias Property Alias_WaitHereMarker Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Keyword Property WaitTriggerKeyword Auto Const mandatory
ReferenceAlias Property Alias_ResumeTrigger Auto Const mandatory
RefCollectionAlias Property Alias_WaitingCompanions Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ObjectReference myTrigger = Self.GetRef()
  If akActionRef == Game.GetPlayer() as ObjectReference
    If myTrigger.HasKeyword(WaitTriggerKeyword)
      Actor[] ActorsNewlyToldToWaitAtMyRef = SQ_Followers.AllFollowersWait(Alias_WaitHereMarker.GetRef(), True, False)
      Int I = 0
      While I < ActorsNewlyToldToWaitAtMyRef.Length
        Alias_WaitingCompanions.AddRef(ActorsNewlyToldToWaitAtMyRef[I] as ObjectReference)
        I += 1
      EndWhile
      Alias_ResumeTrigger.GetRef().EnableNoWait(False)
      If PlayCompanionResponseScene && CompanionResponsePrereqQuest.GetStageDone(CompanionResponsePrereqStage) && Companion.GetRef() != None
        CompanionResponseScene.Start()
      EndIf
    Else
      Actor[] ActorsToFollowMyRef = Alias_WaitingCompanions.GetActorArray()
      If ActorsToFollowMyRef[0] != None
        SQ_Followers.AllFollowersFollow(ActorsToFollowMyRef)
        Alias_WaitingCompanions.RemoveAll()
      EndIf
      myTrigger.DisableNoWait(False)
    EndIf
  EndIf
EndEvent

Event OnCellDetach()
  Actor[] ActorsToFollowMyRef = Alias_WaitingCompanions.GetActorArray()
  If ActorsToFollowMyRef[0] != None
    SQ_Followers.TeleportFollowers(Game.GetPlayer() as ObjectReference, ActorsToFollowMyRef, True, True, False, False, False)
    SQ_Followers.AllFollowersFollow(ActorsToFollowMyRef)
    Alias_WaitingCompanions.RemoveAll()
  EndIf
  ObjectReference myTrigger = Self.GetRef()
  If !myTrigger.HasKeyword(WaitTriggerKeyword) && myTrigger.IsEnabled()
    myTrigger.DisableNoWait(False)
  EndIf
EndEvent
