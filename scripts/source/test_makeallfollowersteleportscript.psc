ScriptName Test_MakeAllFollowersTeleportScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool toggle

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
Bool Property SkipWaitingFollowersObjective = False Auto
Bool Property IncludeWaitingFollowers = True Auto

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor[] teleportedFollowers = None
  If toggle == False
    teleportedFollowers = SQ_Followers.TeleportFollowers(Self.GetLinkedRef(None), None, True, IncludeWaitingFollowers, False, True, SkipWaitingFollowersObjective)
    toggle = True
  ElseIf toggle == True
    SQ_Followers.TeleportFollowers(Game.GetPlayer() as ObjectReference, teleportedFollowers, True, True, False, False, False)
    toggle = False
  EndIf
EndEvent
