ScriptName SQ_ShipServicesActorScript Extends ShipVendorScript conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
dialogueshipservicesscript Property DialogueShipServices Auto Const mandatory
{ quest handling ship services dialogue }

;-- Functions ---------------------------------------

Function HandleOnLoad()
  Parent.HandleOnLoad()
  DialogueShipServices.UpdateFuelGlobals()
EndFunction
