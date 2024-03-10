ScriptName NativeTerminal:RobotScript Extends TerminalMenu
{ handles robots (and turrets) via native terminal }

;-- Variables ---------------------------------------
Bool allRobotsFrenzied = True
Bool allRobotsTeammate = True
Bool anyRobotsActive = False
Bool anyRobotsAlive = False
Bool hasRobotPod = False
Bool hasRobots = False

;-- Properties --------------------------------------
Group autofillProperties
  TerminalMenu Property NativeTerminalRobotFriendSettings Auto Const mandatory
  { autofill }
  TerminalMenu Property NativeTerminalRobotFrenzy Auto Const mandatory
  { autofill }
  ActorValue Property Aggression Auto Const mandatory
  { autofill }
  sq_parentscript Property SQ_Parent Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AnyRobotsActive Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_HasRobotPod Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_HasRobots Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AnyRobotsAlive Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AllRobotsFrenzied Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AllRobotsTeammate Auto Const mandatory
  { autofill }
  Faction Property NativeTerminalRobotAllyFaction Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalRobot Auto Const mandatory
{ link that robots are linked to terminal with 
  NOTE: for turret terminal, use LinkTerminalTurret }
Int Property menuItemID_Activate01 = 1 Auto Const
Int Property menuItemID_Deactivate01 = 2 Auto Const
Int Property menuItemID_Ally01 = 1 Auto Const
Int Property menuItemID_Frenzy01 = 1 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef)
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalRobot, None)
  anyRobotsActive = False
  anyRobotsAlive = False
  hasRobotPod = False
  hasRobots = False
  allRobotsFrenzied = True
  allRobotsTeammate = True
  If linkedRefChain.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChain as Actor[])
  EndIf
  If linkedRefChildren.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChildren as Actor[])
  EndIf
  akTerminalRef.SetValue(NativeTerminalRobot_AnyRobotsActive, (anyRobotsActive as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalRobot_AnyRobotsAlive, (anyRobotsAlive as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalRobot_HasRobotPod, (hasRobotPod as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalRobot_HasRobots, (hasRobots as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalRobot_AllRobotsFrenzied, (allRobotsFrenzied as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalRobot_AllRobotsTeammate, (allRobotsTeammate as Int) as Float)
EndFunction

Function UpdateTerminalVariablesForArray(Actor[] actorArray)
  Int I = 0
  While I < actorArray.Length
    Actor theActor = actorArray[I]
    If theActor.IsDead() == False
      anyRobotsAlive = True
      robotpodscript theRobotPodActor = actorArray[I] as robotpodscript
      Bool robotPod = theRobotPodActor as Bool && theRobotPodActor.HasPod()
      If robotPod
        hasRobotPod = True
      Else
        hasRobots = True
      EndIf
      If robotPod == False && theActor.IsUnconscious() == False || robotPod && theRobotPodActor.isInPod == False
        anyRobotsActive = True
      EndIf
      If theActor.GetValue(Aggression) < 3.0
        allRobotsFrenzied = False
      EndIf
      If theActor.IsPlayerTeammate() == False
        allRobotsTeammate = False
      EndIf
    EndIf
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalRobot, None)
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChain as Actor[], akTerminalRef)
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChildren as Actor[], akTerminalRef)
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, TerminalMenu akTerminalBase, Actor[] actorArray, ObjectReference akTerminalRef)
  If akTerminalBase == Self as TerminalMenu
    If auiMenuItemID == menuItemID_Activate01
      Int I = 0
      While I < actorArray.Length
        robotpodscript theRobotPodActor = actorArray[I] as robotpodscript
        If theRobotPodActor
          theRobotPodActor.WakeRobotFromPod()
        Else
          actorArray[I].SetUnconscious(False)
        EndIf
        SQ_Parent.SendNativeTerminalActorUnconsciousEvent(akTerminalRef, actorArray[I], False)
        I += 1
      EndWhile
      Self.UpdateAllTerminalVariables(akTerminalRef)
    ElseIf auiMenuItemID == menuItemID_Deactivate01
      Int i = 0
      While i < actorArray.Length
        robotpodscript therobotpodactor = actorArray[i] as robotpodscript
        If therobotpodactor
          therobotpodactor.SendRobotToPod()
        Else
          actorArray[i].SetUnconscious(True)
        EndIf
        SQ_Parent.SendNativeTerminalActorUnconsciousEvent(akTerminalRef, actorArray[i], True)
        i += 1
      EndWhile
      Self.UpdateAllTerminalVariables(akTerminalRef)
    EndIf
  ElseIf akTerminalBase == NativeTerminalRobotFriendSettings
    If auiMenuItemID == menuItemID_Ally01
      Int i = 0
      While i < actorArray.Length
        Actor theActor = actorArray[i]
        theActor.RemoveFromAllFactions()
        theActor.SetPlayerTeammate(True, False, False)
        theActor.AddToFaction(NativeTerminalRobotAllyFaction)
        theActor.StopCombat()
        SQ_Parent.SendNativeTerminalActorAllyEvent(akTerminalRef, actorArray[i])
        i += 1
      EndWhile
      Self.UpdateAllTerminalVariables(akTerminalRef)
    EndIf
  ElseIf akTerminalBase == NativeTerminalRobotFrenzy
    If auiMenuItemID == menuItemID_Frenzy01
      Int i = 0
      While i < actorArray.Length
        actorArray[i].SetValue(Aggression, 3.0)
        SQ_Parent.SendNativeTerminalActorFrenzyEvent(akTerminalRef, actorArray[i])
        i += 1
      EndWhile
      Self.UpdateAllTerminalVariables(akTerminalRef)
    EndIf
  EndIf
EndFunction
