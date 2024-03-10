ScriptName Fragments:Scenes:SF_CF05_RC_SYS920_Scene03_002D6ABD Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_MarineBarracks01 Auto Const
ReferenceAlias Property Alias_CF05_MarineBarracks02 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End()
  Alias_CF05_MarineBarracks01.TryToEvaluatePackage()
  Alias_CF05_MarineBarracks02.TryToEvaluatePackage()
EndFunction
