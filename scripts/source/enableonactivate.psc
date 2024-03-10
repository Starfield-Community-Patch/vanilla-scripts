ScriptName EnableOnActivate Extends ObjectReference Const
{ On activate, toggles enable/disable of linked refs }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property toggleEnabled = True Auto Const
{ Set LinkedRef to opposite enable/disable state. }
Bool Property onlyEnable = True Auto Const
{ If true this will only enable, if false only disable. Ignored if toggleEnabled }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If toggleEnabled
    If Self.GetLinkedRef(None).IsEnabled()
      Self.GetLinkedRef(None).Disable(False)
    Else
      Self.GetLinkedRef(None).Enable(False)
    EndIf
  ElseIf onlyEnable
    Self.GetLinkedRef(None).Enable(False)
  Else
    Self.GetLinkedRef(None).Disable(False)
  EndIf
EndEvent
