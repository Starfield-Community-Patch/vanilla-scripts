ScriptName Fragments:Scenes:SF_UC01_607_WrapupScene_Tual_0003D588 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Tuala Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Tuala.GetActorRef().EvaluatePackage(False)
EndFunction
