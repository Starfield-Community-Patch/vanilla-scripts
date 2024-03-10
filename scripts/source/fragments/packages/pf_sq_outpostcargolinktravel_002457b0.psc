ScriptName Fragments:Packages:PF_SQ_OutpostCargoLinkTravel_002457B0 Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  sq_outpostcargolinkshipscript myShip = akActor.GetSpaceship() as sq_outpostcargolinkshipscript
  If myShip
    myShip.ArriveAtOutpost()
  EndIf
EndFunction
