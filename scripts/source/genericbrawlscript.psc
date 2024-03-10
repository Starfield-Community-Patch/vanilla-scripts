ScriptName GenericBrawlScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property EndTimerID = 1 Auto Const
Float Property EndTime = 30.0 Auto Const
ReferenceAlias Property Opponent Auto Const
ReferenceAlias Property OpponentFriend Auto Const
RefCollectionAlias Property PlayerAllies Auto Const
Weapon Property Unarmed Auto Const
ActorValue Property GenericBrawlWinner Auto Const
ActorValue Property GenericBrawlLoser Auto Const
Int Property EndBrawlStage = 200 Auto Const
Int Property PlayerWinsStage = 15 Auto Const
Int Property PlayerDefeatedStage = 180 Auto Const
Int Property CheatingStage = 150 Auto Const
Int Property QuestDoneStage = 250 Auto Const
{ quests can look for this stage to be done to trigger 'react to end of brawl' content }

;-- Functions ---------------------------------------

Function StartBrawl(Bool bStart)
  Actor OpponentREF = Opponent.GetActorRef()
  Actor OpponentFriendREF = OpponentFriend.GetActorRef()
  OpponentREF.SetNoBleedoutRecovery(bStart)
  OpponentREF.AllowBleedoutDialogue(bStart)
  (Opponent as genericbrawlopponentaliasscript).StartUpdateTimer(bStart)
  If OpponentFriendREF
    OpponentFriendREF.SetNoBleedoutRecovery(bStart)
    (OpponentFriend as genericbrawlopponentaliasscript).StartUpdateTimer(bStart)
  EndIf
  If bStart
    Game.GetPlayer().EquipItem(Unarmed as Form, False, True)
    OpponentREF.EquipItem(Unarmed as Form, False, True)
    OpponentREF.StartCombat(Game.GetPlayer() as ObjectReference, False)
    If OpponentFriendREF
      OpponentFriendREF.EquipItem(Unarmed as Form, False, True)
      OpponentFriendREF.StartCombat(Game.GetPlayer() as ObjectReference, False)
    EndIf
    Int I = 0
    While I < PlayerAllies.GetCount()
      Actor theAlly = PlayerAllies.GetAt(I) as Actor
      If theAlly
        theAlly.EquipItem(Unarmed as Form, False, True)
        theAlly.StartCombat(OpponentREF as ObjectReference, False)
        OpponentREF.StartCombat(theAlly as ObjectReference, False)
        If OpponentFriendREF
          theAlly.StartCombat(OpponentFriendREF as ObjectReference, False)
          OpponentFriendREF.StartCombat(theAlly as ObjectReference, False)
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
EndFunction

Function OpponentDefeated()
  Self.StopBrawlCombat()
  Opponent.GetActorRef().ModValue(GenericBrawlLoser, 1.0)
  Self.StartEndingTimer()
EndFunction

Function PlayerDefeated()
  Self.StopBrawlCombat()
  Opponent.GetActorRef().ModValue(GenericBrawlWinner, 1.0)
  Self.StartEndingTimer()
EndFunction

Function StopBrawlCombat()
  Actor OpponentREF = Opponent.GetActorRef()
  Actor OpponentFriendREF = OpponentFriend.GetActorRef()
  Game.GetPlayer().StopCombatAlarm()
  OpponentREF.StopCombatAlarm()
  If OpponentFriendREF
    OpponentFriendREF.StopCombatAlarm()
  EndIf
EndFunction

Function StartEndingTimer()
  Self.StartTimer(EndTime, EndTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == EndTimerID
    Self.Stop()
  EndIf
EndEvent
