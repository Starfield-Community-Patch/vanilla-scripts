ScriptName ShipTerminalScript Extends ObjectReference

;-- Variables ---------------------------------------
Int MenuItemID_ReleaseDockingClamps = 1 Const

;-- Properties --------------------------------------
ActorValue Property SpaceshipDockingclamps Auto Const mandatory
{ docking clamps actor value - will be > 0 when a ship initiates docking with another ship }
terminalmenu Property DefaultShipTerminal Auto Const mandatory
{ top level ship terminal }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Self.CheckForDockingClamps()
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == DefaultShipTerminal
    If auiMenuItemID == MenuItemID_ReleaseDockingClamps
      spaceshipreference myShip = Self.GetCurrentShipRef()
      If myShip as Bool && myShip.GetValue(SpaceshipDockingclamps) > 0.0
        myShip.ModValueTo(SpaceshipDockingclamps, 0.0)
      EndIf
    EndIf
  EndIf
EndEvent

Function CheckForDockingClamps()
  spaceshipreference myShip = Self.GetCurrentShipRef()
  Self.SetValue(SpaceshipDockingclamps, myShip.GetValue(SpaceshipDockingclamps))
EndFunction
