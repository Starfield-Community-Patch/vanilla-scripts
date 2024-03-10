ScriptName UC08QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard FollowerStateGuard

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
{ Followers quest property }
ReferenceAlias Property Hadrian Auto Const mandatory
{ Ref alias for Hadrian }
ReferenceAlias Property Kaiser Auto Const mandatory
{ Ref alias for Kaiser }
GlobalVariable Property UC08_HadrianKaiserFollowingPlayer Auto Const mandatory
{ Global used to track if Hadrian and Kaiser are currently following the player }
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
{ Keyword used to manage the companions using their custom followers package or not }

;-- Functions ---------------------------------------

Function ToggleFollowerState(Int iForceState)
  Guard FollowerStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Int iFollowerState = UC08_HadrianKaiserFollowingPlayer.GetValueInt()
    Actor HadACT = Hadrian.GetActorRef()
    Actor KaiACT = Kaiser.GetActorRef()
    If iForceState >= 0
      If iForceState == 0
        UC08_HadrianKaiserFollowingPlayer.SetValue(1.0)
      ElseIf iForceState == 1
        UC08_HadrianKaiserFollowingPlayer.SetValue(0.0)
      EndIf
    EndIf
    If iFollowerState < 1
      UC08_HadrianKaiserFollowingPlayer.SetValue(1.0)
      HadACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
      KaiACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
      SQ_Followers.SetRoleActive(HadACT, False, True, 0.0, 0.0)
      SQ_Followers.SetRoleActive(KaiACT, False, True, 0.0, 0.0)
      SQ_Followers.CommandFollow(HadACT)
      SQ_Followers.CommandFollow(KaiACT)
    Else
      UC08_HadrianKaiserFollowingPlayer.SetValue(0.0)
      HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
      KaiACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
      SQ_Followers.SetRoleInactive(HadACT, False, False, True)
      SQ_Followers.SetRoleInactive(KaiACT, False, False, True)
    EndIf
    HadACT.EvaluatePackage(False)
    KaiACT.EvaluatePackage(False)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function CatchUpFollowers()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  Kaiser.GetRef().Moveto(PlayREF, 0.0, 0.0, 0.0, True, False)
  Hadrian.GetRef().Moveto(PlayREF, 0.0, 0.0, 0.0, True, False)
EndFunction

Function JumpFollowersToPackageDest()
  Kaiser.GetActorRef().MoveToPackageLocation()
  Hadrian.GetActorRef().MoveToPackageLocation()
EndFunction

Function EVPFollowers()
  Kaiser.GetActorRef().EvaluatePackage(False)
  Hadrian.GetActorRef().EvaluatePackage(False)
EndFunction

Function PauseFollowers()
  SQ_Followers.SetRoleInactive(Hadrian.GetActorRef(), False, False, True)
  SQ_Followers.SetRoleInactive(Kaiser.GetActorRef(), False, False, True)
EndFunction

Function ResumeFollowers()
  Actor HadACT = Hadrian.GetActorRef()
  Actor KaiACT = Kaiser.GetActorRef()
  SQ_Followers.SetRoleActive(HadACT, False, True, 0.0, 0.0)
  SQ_Followers.SetRoleActive(KaiACT, False, True, 0.0, 0.0)
  SQ_Followers.CommandFollow(HadACT)
  SQ_Followers.CommandFollow(KaiACT)
  Self.EVPFollowers()
EndFunction

Function ToggleLazPlants(RefCollectionAlias akTargetCollection)
  Int I = 0
  Int iCount = akTargetCollection.GetCount()
  While I < iCount
    ObjectReference currRef = akTargetCollection.GetAt(I)
    currRef.PlayAnimation("Stage2")
    I += 1
  EndWhile
EndFunction
