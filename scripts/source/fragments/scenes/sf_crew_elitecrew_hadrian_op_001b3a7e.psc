ScriptName Fragments:Scenes:SF_CREW_EliteCrew_Hadrian_Op_001B3A7E Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property HadrianKnowsGlobal Auto Const
{ Tracking Liam C's variable for whether Hadrian knows Vae is alive }

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  HadrianKnowsGlobal.SetValue(1.0)
EndFunction
