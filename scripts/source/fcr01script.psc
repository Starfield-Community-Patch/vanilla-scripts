ScriptName FCR01Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
missionparentscript Property MissionParent Auto Const mandatory
{ mission parent quest }
Int Property AcceptStage = 50 Auto Const
{ The stage to set when mission is accepted }

;-- Functions ---------------------------------------

Event OnMissionAccepted()
  Self.HandleOnMissionAccepted()
EndEvent

Function HandleOnMissionAccepted()
  If MissionParent.MissionBoardAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
    Self.MissionAccepted(True)
  Else
    Self.MissionAccepted(False)
  EndIf
EndFunction

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    wwiseevent.PlayMenuSound("UITerminalMissionBoardMissionAcceptYes")
    Self.setstage(AcceptStage)
  Else
    wwiseevent.PlayMenuSound("UITerminalMissionBoardMissionAcceptNo")
  EndIf
EndFunction
