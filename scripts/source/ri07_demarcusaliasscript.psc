ScriptName RI07_DeMarcusAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const
Int Property iPreReqStage Auto Const
Int Property iTurnOffStage Auto Const
MagicEffect Property SocialSkill_Manipulation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, None, SocialSkill_Manipulation as Form, True)
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If akEffect == SocialSkill_Manipulation
    Quest OwningQuest = Self.GetOwningQuest()
    If OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage)
      OwningQuest.SetStage(iStageToSet)
    EndIf
  EndIf
EndEvent
