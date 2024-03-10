ScriptName OutpostShipbuilderMenuScript Extends TerminalMenu

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  outpostshipbuildermenuactivator myShipbuilderRef = akTerminalRef as outpostshipbuildermenuactivator
  If myShipbuilderRef
    shipvendorscript theShipVendor = myShipbuilderRef.myVendor
    If theShipVendor
      If auiMenuItemID == 1
        theShipVendor.myLandingMarker.ShowHangarMenu(0, theShipVendor as Actor, None, False)
      ElseIf auiMenuItemID == 2
        theShipVendor.myLandingMarker.ShowHangarMenu(0, theShipVendor as Actor, None, True)
      EndIf
    EndIf
  EndIf
EndEvent
