ScriptName UC_RHQ_TeleportRefOnLoadScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC_RHQ_TeleportLinkedRef Auto Const mandatory
{ Keyword used to know which marker to teleport the NPC to }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.IsEnabled()
    Self.MoveTo(Self.GetLinkedRef(UC_RHQ_TeleportLinkedRef), 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent
