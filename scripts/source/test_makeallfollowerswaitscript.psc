ScriptName Test_MakeAllFollowersWaitScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  SQ_Followers.AllFollowersWait(Self.GetLinkedRef(None), True, False)
EndEvent
