ScriptName TerraBrewKioskScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property Vendor1 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Vendor1.ShowBarterMenu()
  EndIf
EndEvent
