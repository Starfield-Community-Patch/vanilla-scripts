ScriptName Fragments:Terminals:TERM_UC01_VanguardRegistrati_00227D84 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  CrimeFactionUC.PlayerPayCrimeGold(False, False)
EndFunction
