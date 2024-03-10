ScriptName Fragments:Scenes:SF_City_NA_Botany01_006_Kelt_0026B037 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property UC_NA_KeltonFrush Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  UC_NA_KeltonFrush.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Phase_02_Begin()
  UC_NA_KeltonFrush.GetActorRef().EvaluatePackage(False)
EndFunction
