ScriptName OE_AustinF_PvG_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property BoardingShip Auto Const
bescript Property BoardingScript Auto hidden
sq_parentscript Property SQ_Parent Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted")
EndEvent

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript akSource, Var[] akArgs)
  If akArgs[0] as spaceshipreference == BoardingShip.GetShipRef()
    BoardingScript = akArgs[1] as bescript
  EndIf
EndEvent
