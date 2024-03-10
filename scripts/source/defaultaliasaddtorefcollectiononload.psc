ScriptName DefaultAliasAddToRefCollectionOnLoad Extends ReferenceAlias
{ When this Ref loads, add it to the specified Ref Collection }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property RefCollectionToFill Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  RefCollectionToFill.AddRef(Self.GetRef())
EndEvent
