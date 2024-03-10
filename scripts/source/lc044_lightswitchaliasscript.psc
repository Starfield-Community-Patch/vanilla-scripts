ScriptName LC044_LightSwitchAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property LightsToEnable Auto Const mandatory
ReferenceAlias Property LightsToDisable Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference LightsEnableRef = LightsToEnable.GetRef()
  If LightsEnableRef.IsEnabled()
    LightsEnableRef.Disable(False)
    If LightsToDisable.GetRef() != None
      LightsToDisable.GetRef().Enable(False)
    EndIf
  Else
    LightsEnableRef.Enable(False)
    If LightsToDisable.GetRef() != None
      LightsToDisable.GetRef().Disable(False)
    EndIf
  EndIf
EndEvent
