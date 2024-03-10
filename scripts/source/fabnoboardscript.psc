ScriptName FABNoBoardScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property DockingPermission Auto Const mandatory
Float Property fDocking = 4.0 Auto

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetRef().SetValue(DockingPermission, fDocking)
EndEvent
