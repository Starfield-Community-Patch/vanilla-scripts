ScriptName SBTempleDoorScript Extends ObjectReference
{ Script for Starborn Temple doors.
 Robot followers can't enter Temples because they can't operate in ZeroG, so force them to wait outside. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ActorValue Property SBTempleDoorWaiting Auto Const mandatory
  Keyword Property ActorTypeRobot Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Actor[] allFollowers = SQ_Followers.GetFollowers(True, True)
  Int I = 0
  While I < allFollowers.Length
    Actor current = allFollowers[I]
    If current.GetValue(SBTempleDoorWaiting) > 0.0
      current.SetValue(SBTempleDoorWaiting, 0.0)
      SQ_Followers.CommandFollow(current)
    EndIf
    I += 1
  EndWhile
EndEvent

Event OnActivate(ObjectReference akActivator)
  If akActivator == Game.GetPlayer() as ObjectReference
    Actor[] activeFollowers = SQ_Followers.GetFollowers(True, False)
    Int I = 0
    While I < activeFollowers.Length
      Actor current = activeFollowers[I]
      If current.HasKeyword(ActorTypeRobot)
        current.SetValue(SBTempleDoorWaiting, 1.0)
        SQ_Followers.CommandWait(current, None)
      EndIf
      I += 1
    EndWhile
  EndIf
EndEvent
