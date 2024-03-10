ScriptName UC05_ActiveIntercomAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool SetStageOnActivate
Int StageToSet

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If SetStageOnActivate
    SetStageOnActivate = False
    Self.GetOwningQuest().SetStage(StageToSet)
    StageToSet = -1
  EndIf
  (Self.GetOwningQuest() as uc05_questscript).UpdateActiveIntercom(Self as ScriptObject, False, None, -1)
EndEvent

Function UpdateStageToSet(Int iStageToSet)
  StageToSet = iStageToSet
  SetStageOnActivate = True
EndFunction
