ScriptName RQ_ParentScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  Quest Property SQ_PlayerShip Auto Const mandatory
  Quest Property TestGoToSpaceQuest Auto Const mandatory
  GlobalVariable Property RQ_Debug_SummonShipOnStart Auto Const mandatory
  GlobalVariable Property PCM_VerifiedOnly Auto Const mandatory
  GlobalVariable Property PCM_BlockCreation_DebugGlobal Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ExecuteCommand(String aCommand)
  ; Empty function
EndFunction

Function TestRQ(String QuestName, String TestPlanet, String Overlay1, String Overlay2, Int PCM_BlockCreation_DebugGlobal_Value, Int Overlay1X, Int Overlay1Y, Int Overlay2X, Int Overlay2Y, Int PlayerX, Int PlayerY)
  If Overlay1X == 0
    Overlay1X = 1
  EndIf
  If Overlay1Y == 0
    Overlay1Y = 1
  EndIf
  If Overlay2X == 0
    Overlay2X = 1
  EndIf
  If Overlay2Y == 0
    Overlay2Y = 3
  EndIf
  If PlayerX == 0
    PlayerX = 1
  EndIf
  If PlayerY == 0
    PlayerY = 1
  EndIf
  Self.TestRQFull(QuestName, TestPlanet, Overlay1, Overlay2, PCM_BlockCreation_DebugGlobal_Value, Overlay1X, Overlay1Y, Overlay2X, Overlay2Y, PlayerX, PlayerY)
EndFunction

Function TestRQFull(String QuestName, String TestPlanet, String Overlay1, String Overlay2, Int PCM_BlockCreation_DebugGlobal_Value, Int Overlay1X, Int Overlay1Y, Int Overlay2X, Int Overlay2Y, Int PlayerX, Int PlayerY)
  TestGoToSpaceQuest.SetStage(20)
  Float waitingFor = 0.0
  Float waitMax = 10.0
  Float waitTime = 0.100000001
  While SQ_PlayerShip.IsRunning() == False && waitingFor < waitMax
    Utility.Wait(waitTime)
    waitingFor += waitTime
  EndWhile
  RQ_Debug_SummonShipOnStart.SetValue(1.0)
  PCM_VerifiedOnly.SetValue(1.0)
  PCM_BlockCreation_DebugGlobal.SetValue(PCM_BlockCreation_DebugGlobal_Value as Float)
  Self.ExecuteCommand("SQAL " + QuestName + " 1")
  Self.ExecuteCommand("SetDebugQuest " + QuestName + " 1 100")
  Self.ExecuteCommand(("AddWorldspaceToPlanet " + Overlay1 + " " + TestPlanet + " " + Overlay1X as String) + " " + Overlay1Y as String)
  If Overlay2
    If Overlay1X == Overlay2X && Overlay1Y == Overlay2Y
      Overlay2Y += 3
    EndIf
    Self.ExecuteCommand(("AddWorldspaceToPlanet " + Overlay2 + " " + TestPlanet + " " + Overlay2X as String) + " " + Overlay2Y as String)
  EndIf
  Self.ExecuteCommand(("LOP " + TestPlanet + " " + PlayerX as String) + " " + PlayerY as String)
EndFunction
