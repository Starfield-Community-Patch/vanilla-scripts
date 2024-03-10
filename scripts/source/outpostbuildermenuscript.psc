ScriptName OutpostBuilderMenuScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkOutpostBuilder Auto Const mandatory
{ linked ref keyword to builder }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    ObjectReference myBuilder = Self.GetLinkedRef(LinkOutpostBuilder)
    If myBuilder
      myBuilder.ShowWorkshopBuilderMenu()
    Else
      Self.ShowWorkshopBuilderMenu()
    EndIf
  EndIf
EndEvent
