ScriptName COM_Andreja_Q01_VaruunShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property pDockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetReference().SetValue(pDockingPermission, 4.0)
EndEvent
