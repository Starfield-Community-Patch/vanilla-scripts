ScriptName UC03_HadrianAliasScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetRef().IgnoreFriendlyHits(True)
EndEvent
