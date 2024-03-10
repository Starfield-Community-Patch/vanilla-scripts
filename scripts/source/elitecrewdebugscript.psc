ScriptName EliteCrewDebugScript Extends Actor

;-- Variables ---------------------------------------
sq_crewscript SQ_Crew

;-- Properties --------------------------------------
Quest Property CrewQuest Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  SQ_Crew = Game.GetFormFromFile(2774653, "Starfield.esm") as sq_crewscript
EndEvent

Function DebugMakeAvailableCrew()
  SQ_Crew.SetRoleAvailable(Self as Actor, True)
EndFunction

Function DebugHire()
  SQ_Crew.SetRoleActive(Self as Actor, True, True, 0.0, 0.0)
  Self.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function DebugMakeActiveEliteCrew()
  Self.DebugHire()
  CrewQuest.SetStage(0)
  SQ_Crew.SetEliteCrewActive(Self as Actor)
  Self.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction
