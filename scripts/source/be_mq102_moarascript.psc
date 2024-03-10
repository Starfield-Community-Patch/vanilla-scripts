ScriptName BE_MQ102_MoaraScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetOwningQuest().SetStage(20)
EndEvent
