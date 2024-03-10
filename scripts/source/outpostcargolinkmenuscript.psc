ScriptName OutpostCargoLinkMenuScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkOutpostCargoLink Auto Const mandatory
{ keyword to find linked ref of my cargo link }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    outpostcargolinkmarkerscript myCargoLink = Self.GetLinkedRef(LinkOutpostCargoLink) as outpostcargolinkmarkerscript
    If myCargoLink
      Bool includeIntersystem = myCargoLink.RequiresFuel
      Keyword requiredKeyword = myCargoLink.CargoLinkMenuKeyword
      myCargoLink.ShowWorkshopTargetMenu(True, None, includeIntersystem, requiredKeyword)
    EndIf
  EndIf
EndEvent
