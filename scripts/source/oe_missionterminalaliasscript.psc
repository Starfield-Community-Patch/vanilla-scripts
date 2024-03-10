ScriptName OE_MissionTerminalAliasScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Self.GotoState("Done")
    (Self.GetOwningQuest() as oe_missionterminalquestscript).PlayerActivateMissionTerminal()
  EndIf
EndEvent

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState
