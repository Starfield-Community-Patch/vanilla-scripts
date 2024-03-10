ScriptName FFConstantZ06JanetOnAliasInit Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property InitStage = 1 Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetOwningQuest().SetStage(InitStage)
EndEvent
