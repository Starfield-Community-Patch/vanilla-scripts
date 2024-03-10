ScriptName City_NA_JunctionBox04Script Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Light_Indicator Auto Const
Quest Property City_NA_Well01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference AkActionRef)
  If City_NA_Well01.GetStageDone(185)
    City_NA_Well01.SetStage(190)
  EndIf
EndEvent
