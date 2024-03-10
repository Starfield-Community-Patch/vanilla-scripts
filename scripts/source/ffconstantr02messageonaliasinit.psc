ScriptName FFConstantR02MessageOnAliasInit Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property InitStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetOwningQuest().SetStage(InitStage)
EndEvent
