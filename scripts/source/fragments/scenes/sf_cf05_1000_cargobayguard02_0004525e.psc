ScriptName Fragments:Scenes:SF_CF05_1000_CargoBayGuard02_0004525E Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_CargoBaySecurityDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  Alias_CF05_CargoBaySecurityDoor.GetRef().SetOpen(True)
EndFunction
