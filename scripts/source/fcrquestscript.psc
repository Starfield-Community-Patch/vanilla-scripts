ScriptName FCRQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FCRMissionCounter Auto Const mandatory
Quest Property FCR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function FCRMissionComplete()
  FCRMissionCounter.Mod(1.0)
  If FCRMissionCounter.GetValue() >= 3.0 && !FCR01.IsRunning()
    FCR01.Start()
    FCRMissionCounter.SetValue(0.0)
  EndIf
EndFunction
