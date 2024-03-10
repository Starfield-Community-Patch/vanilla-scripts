ScriptName UC09_InvasivePestRefScript Extends UC09_HeatleechRefScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ActorTypeHeatleech Auto Const mandatory
{ Heetleech keyword. }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.HasKeyword(ActorTypeHeatleech)
    Parent.OnCellLoad()
  EndIf
EndEvent
