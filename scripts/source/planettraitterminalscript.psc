ScriptName PlanetTraitTerminalScript Extends ObjectReference conditional
{ for now (?) holds data used by PlanetTraitTerminalMenuScript }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property traitKeywordToDiscover Auto hidden
planet Property planetToCheck Auto hidden
Bool Property traitDataAwarded = False Auto conditional hidden

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function
EndEvent
