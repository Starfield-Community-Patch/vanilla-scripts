ScriptName Fragments:Terminals:TERM_OE_KT_AutomatedFacility_00063F39 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property AutomatedFacilityQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  AutomatedFacilityQuest.SetStage(30)
EndFunction
